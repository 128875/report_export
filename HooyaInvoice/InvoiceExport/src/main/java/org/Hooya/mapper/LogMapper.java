package org.Hooya.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.Hooya.entity.ErrorLog;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LogMapper extends BaseMapper<ErrorLog> {
}
