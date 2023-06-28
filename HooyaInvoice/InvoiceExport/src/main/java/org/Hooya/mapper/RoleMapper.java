package org.Hooya.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.Hooya.entity.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface RoleMapper extends BaseMapper<Role> {
    List<Role> getAllRoles(HashMap<String, Object> params);
}
