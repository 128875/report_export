package org.Hooya.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.Hooya.entity.Admin;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface AdminMapper extends BaseMapper<Admin> {
    Admin getUserInfo(HashMap<String,Object> params);
}
