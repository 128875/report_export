package org.Hooya.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.Hooya.entity.Template;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TemplateMapper extends BaseMapper<Template> {
    List<Template> getTemplates(@Param("country") String country, @Param("dianpu") String dianpu);
}
