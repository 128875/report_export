package org.Hooya.config;

import cn.dev33.satoken.interceptor.SaRouteInterceptor;
import cn.dev33.satoken.router.SaHttpMethod;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {
    public static List<String> wihteList = new ArrayList<>(Arrays.asList(
            "/HooyaInvoice/ExportJsonData","/HooyaInvoice/ExportOrder","/HooyaInvoice/ExportOrderData",
            "/admin/login"
    ));
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //注册路由拦截器，自定义认证规则
        registry.addInterceptor(new SaRouteInterceptor((res,req,handler)->{
            SaRouter.match("/**").notMatch(wihteList).check(r-> StpUtil.checkLogin());
            SaRouter.match(SaHttpMethod.GET).match("/HooyaInvoice/getExportAuth").check(r ->StpUtil.checkPermission("invoice:export"));
            SaRouter.match(SaHttpMethod.GET).match("/InvoiceTemplate/**").check(r ->StpUtil.checkPermission("invoice:template"));
            SaRouter.match(SaHttpMethod.GET).match("/log/**").check(r ->StpUtil.checkPermission("log:error"));
        })).addPathPatterns("/**");

    }
}
