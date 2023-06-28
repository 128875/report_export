package org.Hooya.serviceImpl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mysql.cj.log.Log;
import org.Hooya.entity.Admin;
import org.Hooya.entity.Permission;
import org.Hooya.entity.Role;
import org.Hooya.mapper.AdminMapper;
import org.Hooya.service.AdminService;
import org.Hooya.service.PermissionService;
import org.Hooya.service.RoleService;
import org.Hooya.util.ResultUtil;
import org.Hooya.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    @Override
    public Result checkLogin(HashMap<String,Object> params) {
        HashMap<String,Object> data =new HashMap<>();
        params.put("status",1);
        Admin userInfo = this.getBaseMapper().getUserInfo(params);
        if(userInfo==null || userInfo.getStatus().equals(0)){
            return ResultUtil.fail("500","用户不存在!");
        }
        if (!DigestUtils.md5DigestAsHex(
                (params.get("password") + userInfo.getSafe()).getBytes())
                .equals(userInfo.getPassword())) {
            return ResultUtil.fail("500","密码错误!");
        }

        HashMap<String,Object> where = new HashMap<>();
        where.put("status",1);
        where.put("role_ids",JSONUtil.parse(userInfo.getRole()).toBean(List.class));
        List<Role> allRoles = roleService.getAllRoles(where);
        if(allRoles.size()==0){
            ResultUtil.fail("500","该用户无角色权限!");
        }
        StpUtil.login(userInfo.getId());
        data.put("username",userInfo.getUsername());
        data.put("token",StpUtil.getTokenValue());
        data.put("permissions",this.getAllPerms(StpUtil.getLoginId().toString()));
        return ResultUtil.success("登陆成功!",data);
    }


    @Override
    public List<Permission> getAllPerms(String LoginId) {
        Admin admin = this.getBaseMapper().selectById(LoginId);
        HashMap<String,Object> params = new HashMap<>();
        int root = 0;
        params.put("status", 1);
        params.put("role_ids",JSONUtil.parse(admin.getRole()).toBean(List.class));
        List<Role> allRoles = roleService.getAllRoles(params);
        Set<Integer> permissionIds = new HashSet<>();
        for (Role allRole : allRoles) {
            if(allRole.getRoot().equals(1)){
                root = 1 ;
                break;
            }
            for (Object id : JSONUtil.parse(allRole.getPermission()).toBean(List.class)) {
                permissionIds.add(Integer.valueOf(id.toString()));
            }
        }
        HashMap<String,Object> query = new HashMap<>();
        query.put("status", 1);
        if(root == 0){
            query.put("permission_ids",permissionIds);
        }
        return permissionService.getAllPermissions(query);
    }
}
