package org.Hooya.common;


import org.Hooya.exception.BussinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class TemplateCase {

    private static final String FR0 = "FdvamFR_Invoice";
    private static final String FR1 = "FdvamFR_DeliveryNote";
    private static final String FR2 = "GiantexFR-am_Invoice";
    private static final String FR3 = "GiantexFR-am_DeliveryNote";

    private static final String IT0 = "FdvamIT_Invoice";
    private static final String IT1 = "FdvamIT_DeliveryNote";
    private static final String IT2 = "GiantexIT-am_Invoice";
    private static final String IT3 = "GiantexIT-am_DeliveryNote";

    private static final String ES0 = "FdsES_Invoice";
    private static final String ES1 = "FdsES_DeliveryNote";
    private static final String ES2 = "GiantexES-am_Invoice";
    private static final String ES3 = "GiantexES-am_DeliveryNote";

    private static final String DE0 = "FdsDE_Invoice";
    private static final String DE1 = "FdsDE_DeliveryNote";
    private static final String DE2 = "GiantexDE-am_Invoice";
    private static final String DE3 = "GiantexDE-am_DeliveryNote";

    private static final String EN0 = "RealdeEN_Invoice";
    private static final String EN1 = "RealdeEN_DeliveryNote";

    private static final String NL0 = "GiantexNL-am_Invoice";
    private static final String NL1 = "GiantexNL-am_DeliveryNote";

    private static final String PL0 = "GiantexPL-am_Invoice";
    private static final String PL1 = "GiantexPL-am_DeliveryNote";

    private static final List<String> store1s = new ArrayList<>(
            Arrays.asList("FDVAM-FR","FDVAM-IT","FDSES","FDSDE","realde-cz","realde-sk")
    );
    private static final String store2 = "Giantex";

    private static final List<String> invoices = new ArrayList<>(Arrays.asList
            (FR0,FR2,IT0,IT2,ES0,ES2,DE0,DE2,EN0,NL0,PL0));


    public String[] getTemplateCase(String country,String dianpu){
        String[] arr = new String[2];
        if(store1s.contains(dianpu)){
            if ("FR".equalsIgnoreCase(country)) {
                arr[0]=FR0;arr[1]=FR1;
            }else if("IT".equalsIgnoreCase(country)){
                arr[0]=IT0;arr[1]=IT1;
            }else if("ES".equalsIgnoreCase(country)){
                arr[0]=ES0;arr[1]=ES1;
            }else if("DE".equalsIgnoreCase(country)){
                arr[0]=DE0;arr[1]=DE1;
            }else{
                arr[0]=EN0;arr[1]=EN1;
            }
        }else if(dianpu.contains(store2)){
            if ("BE".equalsIgnoreCase(country)||"FR".equalsIgnoreCase(country)) {
                arr[0]=FR2;arr[1]=FR3;
            }else if("DE".equalsIgnoreCase(country)){
                arr[0]=DE2;arr[1]=DE3;
            }else if("ES".equalsIgnoreCase(country)){
                arr[0]=ES2;arr[1]=ES3;
            }else if("IT".equalsIgnoreCase(country)){
                arr[0]=IT2;arr[1]=IT3;
            }else if("PL".equalsIgnoreCase(country)){
                arr[0]=PL0;arr[1]=PL1;
            }else{
                arr[0]=NL0;arr[1]=NL1;
            }
        }

        if(arr[0] ==null&&arr[1] ==null){
            throw new BussinessException("无"+dianpu+country+"的模板!");
        }
        return arr;
    }

    public String[] getTableColumnKeys(String template){
        String[] arr;
        if(invoices.contains(template)
        ){
            if(template.equals(FR2)||template.equals(DE2)||template.equals(ES2)||template.equals(IT2)||
                    template.equals(NL0)){
                arr = new String[]{"sl","sku", "cpgg","wxdjTax", "wxdj","zje"};
            }else {
                arr = new String[]{"sl", "sku", "cpgg", "wxdj", "wxdjTax", "zje"};
            }
        }else{
            arr = new String[]{"sl","sku", "cpgg","trackCode","trackno"};
        }
        return arr;
    }

    public String getUnit(String template,String country){
        String unit = null;

        if(template.equals(FR0)||template.equals(IT0)||template.equals(ES0)||template.equals(DE0)||template.equals(EN0)){
            if(country.equalsIgnoreCase("cz")){
                unit = " CZK";
            }else {
                unit = " EUR";
            }
        }

        if(template.equals(FR2)||template.equals(DE2)||template.equals(ES2)||template.equals(IT2)||
                template.equals(NL0)){
            if(country.equalsIgnoreCase("se")){
                unit = " kr";
            }else if(country.equalsIgnoreCase("pl")){
                unit = " zł";
            } else {
                unit = " €";
            }
        }

        return unit;
    }

}
