package org.Hooya.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.Hooya.entity.Permission;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface PermissionMapper extends BaseMapper<Permission> {
    List<Permission> getAllPermissions(HashMap<String,Object> query);
}
