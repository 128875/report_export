package org.Hooya.controller;

import cn.hutool.core.io.FileUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.spire.doc.Document;
import com.spire.doc.FileFormat;
import lombok.extern.slf4j.Slf4j;
import org.Hooya.entity.Template;
import org.Hooya.service.TemplateService;
import org.Hooya.util.DownloadUtil;
import org.Hooya.util.ResultUtil;
import org.Hooya.vo.Result;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;

@RestController
@Slf4j
@RequestMapping("/InvoiceTemplate")
public class TemplateController {

    @Autowired
    private TemplateService templateService;

    @Autowired
    private DownloadUtil downloadUtil;

    @Value("${TemplatePdf}")
    private String templatePdfPath;

    @Value("${TemplateDic}")
    private String templateDicPath;

    @GetMapping("list")
    public List<Template> getTemplateList(){
        return templateService.list();
    }

    @GetMapping("getTemplate")
    public Result getTemplateById(@RequestParam Integer templateId){
        return ResultUtil.success(templateService.getById(templateId));
    }

    @PostMapping("templatePdf")
    public byte[] getTemplatePdf(@RequestParam Integer templateId, HttpServletResponse response){
        Template byId = templateService.getById(templateId);
        String templatePdfPath = byId.getPdfpath();

        FileInputStream fileInputStream = null;
        File file = new File(templatePdfPath);
        byte[] bFile = new byte[(int) file.length()];
        try {
            fileInputStream = new FileInputStream(templatePdfPath);
            fileInputStream.read(bFile);
            fileInputStream.close();
            response.setHeader("Content-disposition", java.net.URLEncoder.encode(templatePdfPath, "UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bFile;
    }

    @PostMapping("downloadTemplate")
    public void downloadTemplateDocx(@RequestParam Integer templateId,HttpServletResponse response){
        Template byId = templateService.getById(templateId);
        String filePath = byId.getPath();
        String fileName = byId.getTemplateName() + ".docx";
        downloadUtil.DownloadExportFile(filePath,fileName,response);
    }

    @GetMapping("getTemplateRootPath")
    public Result getTemplateRootPath(){
        return ResultUtil.success(new String[]{templateDicPath,templatePdfPath});
    }

    @PostMapping("uploadTemplateFile")
    public Result uploadTemplateDocx(@RequestBody MultipartFile file){
        String fileName  = file.getOriginalFilename();
        String fileType = fileName.substring(fileName.lastIndexOf("."));
        if(!fileType.equals(".docx")){
            return ResultUtil.fail("500","上传文件类型错误！");
        }
        return ResultUtil.success("上传成功",new String[]{templateDicPath,templatePdfPath});
    }


    @PostMapping("uploadTemplate")
    public Result uploadTemplate(@ModelAttribute Template template){
        log.info("==========模板文件上传中============");
        String country = template.getCountry();
        String dianpu = template.getDianpu();
        String unit = template.getUnit();
        Integer type = template.getType();
        String templateName = template.getTemplateName();

        Template old = null;
        if(template.getId()!=null){
            old = templateService.getById(template.getId());
        }

        if(!StringUtils.isNotBlank(dianpu)){
            return ResultUtil.fail("400","店铺名称不能为空!");
        }
        if(!StringUtils.isNotBlank(country)){
            return ResultUtil.fail("400","国家名称不能为空!");
        }
        if(!StringUtils.isNotBlank(unit)){
            return ResultUtil.fail("400","发票单位不能为空!");
        }
        if(type==null){
            return ResultUtil.fail("400","账单类型不能为空!");
        }

        if(StringUtils.isNotBlank(templateName)){
            if(old ==null){
                if(templateService.countTemplateByName(templateName)!=0){
                    return ResultUtil.fail("400","模板名称重复!");
                }
                if(templateService.countTemplateByCountryAndDianpu(country,dianpu)!=0) {
                    return ResultUtil.fail("400", "该国家该店铺模板已存在!");
                }
            }else{
                if(templateService.countTemplateByName(templateName)!=0
                    && !old.getTemplateName().equals(templateName)){
                    return ResultUtil.fail("400","模板名称重复!");
                }
                if(templateService.countTemplateByCountryAndDianpu(country,dianpu)!=0
                    && !old.getDianpu().equals(dianpu) && !old.getCountry().equals(country)) {
                    return ResultUtil.fail("400", "该国家该店铺模板已存在!");
                }
            }
        }else
            return ResultUtil.fail("400","模板名称不能为空!");

        MultipartFile file = template.getFile();
        if(file!=null){
            if(old!=null){
                new File(old.getPath()).delete();
                new File(old.getPdfpath()).delete();
            }
            try {
                file.transferTo(new File(template.getPath()));
            } catch (IOException e) {
                e.printStackTrace();
            }
            Document document =new Document();
            document.loadFromFile(template.getPath());
            document.saveToFile(template.getPdfpath(), FileFormat.PDF);
        }else {
            return ResultUtil.fail("400","请上传模板文件!");
        }

        log.info("==========模板文件上传成功============");

        boolean save;
        if(template.getId()==null){
            save= templateService.save(template);
        }else {
            save = templateService.getBaseMapper().updateById(template) == 1;
        }

        if(save){
            return ResultUtil.success("上传成功!");
        }else
            return ResultUtil.fail("500","上传失败");
    }

    @DeleteMapping("deleteTemplate")
    public Result delTemplateFile(@RequestParam Integer templateId){
        Template template = templateService.getById(templateId);
        String pdfpath = template.getPdfpath();
        String path = template.getPath();
        boolean delete1 = new File(pdfpath).delete();
        boolean delete2 = new File(path).delete();
        boolean delTemp = templateService.removeById(templateId);
        if(delete1&&delete2&&delTemp){
            return ResultUtil.success("模板删除成功！",null);
        }else {
            return ResultUtil.fail("500","删除失败!请联系开发人员");
        }
    }


}
