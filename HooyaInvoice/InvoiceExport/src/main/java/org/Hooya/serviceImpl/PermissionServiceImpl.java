package org.Hooya.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.Hooya.entity.Permission;
import org.Hooya.mapper.PermissionMapper;
import org.Hooya.service.AdminService;
import org.Hooya.service.PermissionService;
import org.Hooya.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class PermissionServiceImpl extends
        ServiceImpl<PermissionMapper, Permission> implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> getAllPermissions(HashMap<String, Object> query) {
        return permissionMapper.getAllPermissions(query);
    }
}
