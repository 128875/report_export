package org.Hooya.controller;


import org.Hooya.service.AdminService;
import org.Hooya.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.dev33.satoken.stp.StpUtil;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.HashMap;


@Validated
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("login")
    public Result Login(HttpServletRequest request,
                      @NotBlank(message = "请输入账号!") @Size(message = "用户名长度在3-20",max = 20,min = 3) String username,
                      @NotBlank(message = "请输入密码!") @Size(message = "密码长度在5-30",max = 30,min = 5) String password){
        HashMap<String,Object> params =new HashMap<>();
        params.put("username",username);
        params.put("password",password);
        return adminService.checkLogin(params);
    }
}
