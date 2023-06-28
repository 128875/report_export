package org.Hooya.util;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.Hooya.exception.BussinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Component
public class JsonTransUtil {

    @Autowired
    private RestTemplate restTemplate;

    public List<Map<String,Object>> getJsonResult(String DataRequireUrl,String jsonParams){
        //创建请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<String> request = new HttpEntity<>(jsonParams,headers);
        //发送http请求
        String jsonResult = restTemplate.postForObject(DataRequireUrl, request, String.class);
        JSONObject jsonObject = JSON.parseObject(jsonResult);
        Integer msg = (Integer)jsonObject.get("code");
        if(msg!=200)
            throw new BussinessException(msg,"http请求异常!");

        List<Map<String,Object>> jsonData = (List<Map<String,Object>>)jsonObject.getObject("data", List.class);

        return jsonData;
    }

    public Map<String,String> getMainList(String DataRequireUrl){

        Map jsonResult = restTemplate.getForObject(DataRequireUrl, Map.class);
        Integer msg = (Integer)jsonResult.get("code");
        if(msg!=200)
            throw new BussinessException(msg,"http请求异常!");
        Map<String,String> mainList = (Map<String,String>)jsonResult.get("mainList");
        return mainList;
    }

    public List<Map<String,String>> getChildList(String DataRequireUrl){
        Map jsonResult = restTemplate.getForObject(DataRequireUrl, Map.class);
        Integer msg = (Integer)jsonResult.get("code");
        if(msg!=200)
            throw new BussinessException(msg,"http请求异常!");
        List<Map<String,String>> childList = (List<Map<String, String>>) jsonResult.get("childList");
        return childList;
    }

}
