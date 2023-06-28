package org.Hooya.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.Hooya.entity.Role;
import org.Hooya.mapper.RoleMapper;
import org.Hooya.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role>implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> getAllRoles(HashMap<String, Object> params) {
        return roleMapper.getAllRoles(params);
    }
}
