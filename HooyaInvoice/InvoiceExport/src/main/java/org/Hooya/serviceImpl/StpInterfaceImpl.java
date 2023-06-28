package org.Hooya.serviceImpl;

import cn.dev33.satoken.stp.StpInterface;
import org.Hooya.entity.Permission;
import org.Hooya.service.AdminService;
import org.Hooya.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class StpInterfaceImpl implements StpInterface {

    @Autowired
    private AdminService adminService;

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        List<Permission> allPerms = adminService.getAllPerms(loginId.toString());
        List<String> list = new ArrayList<>();
        for (Permission allPerm : allPerms) {
            list.add(allPerm.getPerms());
        }
        return list;
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        return null;
    }
}
