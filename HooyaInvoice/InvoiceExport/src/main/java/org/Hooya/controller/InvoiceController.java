package org.Hooya.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ZipUtil;
import com.alibaba.fastjson.JSONObject;
import com.spire.doc.*;
import com.spire.doc.documents.*;
import com.spire.doc.fields.TextRange;
import lombok.extern.slf4j.Slf4j;
import org.Hooya.entity.Template;
import org.Hooya.thread.InvoiceThread;
import org.Hooya.common.TableType;
import org.Hooya.mapper.TemplateMapper;
import org.Hooya.thread.InvoiceThread2;
import org.Hooya.util.DownloadUtil;
import org.Hooya.util.JsonTransUtil;
import org.Hooya.util.ResultUtil;
import org.Hooya.vo.InvoiceInfomation;
import org.Hooya.vo.Result;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.List;


@RestController
@Slf4j
@RequestMapping("/HooyaInvoice")
public class InvoiceController {

    @Autowired
    private DownloadUtil downloadUtil;
    @Autowired
    private JsonTransUtil jsonTransUtil;
    @Autowired
    private TemplateMapper templateMapper;

    @Value("${DataRequireUrl}")
    private String dataRequireUrl;
    @Value("${TemplateDic}")
    private String templateDic;
    @Value("${TemplateExportBatchDic}")
    private String templateExportBatchDic;

    //触发权限判断
    @GetMapping("/getExportAuth")
    public Result ExportInvoiceBatch(){
        return ResultUtil.success(dataRequireUrl);
    }

    //通用模板发票批量打印
    @PostMapping("/ExportJsonData")
    public void ExportInvoiceBatch(HttpServletResponse response,@RequestBody String jsonParams){
        log.info("正在发送http请求，获取数据");
        String requireUrl = dataRequireUrl + "getReportDataByJson";
        List<Map<String, Object>> jsonData = jsonTransUtil.getJsonResult(requireUrl,jsonParams);

        List<Thread> threads = new ArrayList<>();
        //清空
        //FileUtil.clean(templateExportBatchDic);
        String pdfsPath = templateExportBatchDic + UUID.randomUUID() + File.separator;
        if(new File(pdfsPath).mkdir())
            log.info("导出文件夹创建成功！");

        log.info("一共将要导出 {} 条账单",jsonData.size());
        for (int i = 0; i < jsonData.size(); i++) {
            Thread thread = new Thread(new InvoiceThread(templateMapper,i,jsonData,pdfsPath));
            thread.setName("thread-invoice-"+i);
            threads.add(thread);
            thread.start();
        }

        try {
            for (Thread thread : threads) {
                thread.join();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        File zip = ZipUtil.zip(pdfsPath, StandardCharsets.UTF_8);
        downloadUtil.DownloadExportFile(zip.getPath(),UUID.randomUUID()+".zip",response);

        log.info("-------------批量发票+出货单下载完成---------------");
    }

    //特殊订单打印
    @PostMapping("/ExportOrderData")
    public byte[] ExportOrder(@RequestBody String jsonData){

        JSONObject jsonObject = JSONObject.parseObject(jsonData);
        Map<String,String> mainData = (Map<String,String>)jsonObject.get("mainData");
        List<Map<String,String>> skus = (List<Map<String,String>>)jsonObject.get("Skus");

        Document document = new Document();
        document.loadFromFile(templateDic+"lieferschein_limango_marktplat_fds"+".docx");

        mainData.forEach((key,value)->{
            document.replace("["+key+"]",
                    value==null?"":value,
                    true,true);
        });
        BookmarksNavigator bookmarksNavigator = new BookmarksNavigator(document);
        bookmarksNavigator.moveToBookmark("table");

        //设置子表格
        Table table = new Table(document, false);

        //获取表格column key 和子表宽高
        float[] tableWidths = new float[]{
                310/3.53f,630/3.53f,150/3.53f,150/3.53f,220/3.53f,140/3.53f
        };
        String[] tableColumnKeys = new String[]{
                "Sku","SkuDes","PackageLen","PackageWidth","PackageHeigth","ShippedCount"
        };

        for (Map<String, String> childmap : skus) {
            TableRow row = table.addRow(tableColumnKeys.length);
            //给每个格子设定宽度/高度
            for (int j = 0; j < tableWidths.length; j++) {
                row.getCells().get(j).setCellWidth(tableWidths[j], CellWidthType.Point);
            }
            //设置内容
            for (int j = 0; j < tableColumnKeys.length; j++) {
                String content = childmap.get(tableColumnKeys[j]);
                TextRange range = row.getCells().get(j).addParagraph().appendText(content);
                range.getOwnerParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Left);
                range.getCharacterFormat().setFontName(TableType.template01.getFontName());
                range.getCharacterFormat().setFontSize(TableType.template01.getFontSize());
                if(j==2)
                    range.getCharacterFormat().setFontSize(TableType.shrinkFont.getFontSize());
            }

        }

        //定位到doc上标签table的位置 插入子表格
        bookmarksNavigator.moveToBookmark("table");
        bookmarksNavigator.insertTable(table);
        //固定表格宽高
        table.autoFit(AutoFitBehaviorType.Fixed_Column_Widths);

        //清空
        FileUtil.clean(templateExportBatchDic);
        document.saveToFile(templateExportBatchDic+"lieferschein_limango_marktplat_fds.pdf",FileFormat.PDF);
        document.dispose();
        byte[] bytes = FileUtil.readBytes(templateExportBatchDic + "lieferschein_limango_marktplat_fds.pdf");

        return bytes;
    }

    //单个invoice base64
    @RequestMapping("/ExportOrder")
    public Map<String,Object> ExportSingleOrderBase64(@RequestBody String jsonParams){
        log.info("正在发送http请求，获取数据");
        String requireUrl = dataRequireUrl + "getReportDataByJson";
        List<Map<String, Object>> jsonData = jsonTransUtil.getJsonResult(requireUrl,jsonParams);
        List<Thread> threads = new ArrayList<>();
        String pdfsPath = templateExportBatchDic + UUID.randomUUID() + File.separator;
        if(new File(pdfsPath).mkdir())
            log.info("导出文件夹创建成功！");

        for (int i = 0; i < jsonData.size(); i++) {
            Thread thread = new Thread(new InvoiceThread2(templateMapper,i,jsonData,pdfsPath));
            thread.setName("thread-invoice-"+i);
            threads.add(thread);
            thread.start();
        }

        try {
            for (Thread thread : threads) {
                thread.join();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        Map<String,Object> map =new LinkedHashMap<>();

        File[] files = new File(pdfsPath).listFiles();
        try {
            for (File file : files) {
                if(file.getName().contains("Invoice")){
                    InputStream inputStream =new FileInputStream(file);
                    byte[] bytes = new byte[(int)file.length()];
                    inputStream.read(bytes);
                    map.put("file",new String(Base64.getEncoder().encode(bytes), StandardCharsets.UTF_8));
                    map.put("msg","单张账单Invoice_Base64");
                    map.put("code","200");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return map;
    }
}
