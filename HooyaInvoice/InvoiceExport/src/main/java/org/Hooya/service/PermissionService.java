package org.Hooya.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.Hooya.entity.Permission;

import java.util.HashMap;
import java.util.List;

public interface PermissionService extends IService<Permission> {

    List<Permission> getAllPermissions(HashMap<String,Object> query);

}
