package org.Hooya.thread;

import com.alibaba.fastjson.JSONObject;
import com.spire.doc.*;
import com.spire.doc.documents.HorizontalAlignment;
import com.spire.doc.documents.TextSelection;
import com.spire.doc.fields.TextRange;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.Hooya.common.Constrants;
import org.Hooya.common.TableType;
import org.Hooya.entity.Template;
import org.Hooya.mapper.TemplateMapper;
import org.Hooya.vo.InvoiceInfomation;

import java.io.File;
import java.util.List;
import java.util.Map;

@AllArgsConstructor
@Slf4j
public class InvoiceThread2 implements Runnable{

    private TemplateMapper templateMapper;
    private final int index;    //第几个发票
    private List<Map<String, Object>> jsonData;
    private String pdfsPath;

    @Override
    public void run() {
        Map<String, Object> datum = jsonData.get(index);
        Map<String,String> mainList = (Map<String,String>)datum.get("mainList");
        List<Map<String,String>> childList = (List<Map<String,String>>)datum.get("childList");
        InvoiceInfomation invoiceInfomation = JSONObject.parseObject(
                datum.get("sourceData").toString(), InvoiceInfomation.class);

        //根据国家获取出库单和账单模板
        String orderId = invoiceInfomation.getOrderId();
        String country = invoiceInfomation.getCountry();
        String dianPu = invoiceInfomation.getDianPu();
        List<Template> templateCases = templateMapper.getTemplates(country, dianPu);

        //加载2个文档 ，出库单和 账单
        for (int i = 0; i < templateCases.size(); i++) {
            Template template = templateCases.get(i);

            Document document = new Document();
            document.loadFromFile(template.getPath());
            //替换所有
            document.setReplaceFirst(false);
            //是账单就放入单位key
            String unit = null;
            if(template.getType()==0){
                unit = " "+template.getUnit();
                mainList.put("unit",unit);
            }

            mainList.put("ptyf",mainList.get("ptyf").replace(",","."));
            mainList.put("zek",mainList.get("zek").replace(",","."));
            mainList.put("noTaxje",mainList.get("noTaxje").replace(",","."));
            mainList.put("taxje",mainList.get("taxje").replace(",","."));
            mainList.put("ebayzje",mainList.get("ebayzje").replace(",","."));

            //替换主要字段
            mainList.forEach((key,value)->{
                if(document.getText().contains("["+key+"]")) {
                    document.replace(
                            "[" + key + "]",
                            value == null ? "" : value,
                            true,
                            true
                    );
                    if(value!=null&&value.length()>30){
                        TextSelection string = document.findString(value, true, true);
                        string.getAsOneRange().getCharacterFormat().setFontSize(TableType.shrinkFont.getFontSize());
                    }
                }
            });

            //获取doc里面的table
            Bookmark bookmark  = document.getBookmarks().get("table");
            Table table = (Table) bookmark.getBookmarkStart().getOwner().getOwner().getOwner().getOwner();

            String[] tableColumnKeys = null; //需调整
            int type = template.getType();
            switch (type){
                case 0: tableColumnKeys= Constrants.tableColumnKeys0; break;
                case 1: tableColumnKeys= Constrants.tableColumnKeys1; break;
            }
            //设置表格内容
            for (Map<String, String> childmap : childList) {
                TableRow row = table.addRow(tableColumnKeys.length);
                //设置内容
                for (int j = 0; j < tableColumnKeys.length; j++) {
                    // 设置是否使用与表格相同的内间距。
                    row.getCells().get(j).getCellFormat().setSamePaddingsAsTable(false);
                    //上间距  1 x 0.035 cm
                    row.getCells().get(j).getCellFormat().getPaddings().setTop(9f);

                    String content = childmap.get(tableColumnKeys[j]);
                    if((j==tableColumnKeys.length-1||
                            j==tableColumnKeys.length-2||
                            j==tableColumnKeys.length-3) && unit!=null){
                        content = content.replace(",",".") + unit;
                    }


                    TextRange range = row.getCells().get(j).addParagraph().appendText(content);
                    range.getOwnerParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Left); //是否居中
                    range.getCharacterFormat().setFontName(TableType.template01.getFontName());
                    range.getCharacterFormat().setFontSize(TableType.template01.getFontSize());

                    if(content.length()>30){
                        range.getCharacterFormat().setFontName(TableType.shrinkFont.getFontName());
                        range.getCharacterFormat().setFontSize(TableType.shrinkFont.getFontSize());
                        //行距
                        range.getOwnerParagraph().getFormat().setLineSpacingRule(LineSpacingRule.Exactly);
                        range.getOwnerParagraph().getFormat().setLineSpacing(12f);
                    }
                }

            }

            //固定表格宽高
            table.autoFit(AutoFitBehaviorType.Fixed_Column_Widths);
            String suffix  = i==0 ? "_Invoice":"_DeliveryNote";
            String fileName = orderId+"_"+mainList.get("khname").replace(File.separator,"").replace(" ","")
                    +"_"+dianPu+suffix+(index+1)+".pdf";

            document.saveToFile(pdfsPath+fileName,FileFormat.PDF);
            document.dispose();
            log.info("当前线程：{} 已完成任务，将要退出",Thread.currentThread().getName());
        }
    }
}
