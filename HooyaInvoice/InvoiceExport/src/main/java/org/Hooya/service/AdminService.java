package org.Hooya.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.Hooya.entity.Admin;
import org.Hooya.entity.Permission;
import org.Hooya.vo.Result;

import java.util.HashMap;
import java.util.List;

public interface AdminService extends IService<Admin> {
    /**
     * 登录验证
     * @param params
     * @return
     */
    Result checkLogin(HashMap<String,Object> params);

    List<Permission> getAllPerms(String LoginId);
}
