package org.Hooya.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.Hooya.entity.Role;

import java.util.HashMap;
import java.util.List;

public interface RoleService extends IService<Role> {
    List<Role> getAllRoles(HashMap<String,Object> params);
}
