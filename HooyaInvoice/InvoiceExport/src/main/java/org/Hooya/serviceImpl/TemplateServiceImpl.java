package org.Hooya.serviceImpl;

import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.Hooya.entity.Template;
import org.Hooya.mapper.TemplateMapper;
import org.Hooya.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TemplateServiceImpl extends ServiceImpl<TemplateMapper, Template> implements TemplateService {
    @Autowired
    private TemplateMapper templateMapper;

    @Override
    public int countTemplateByName(String name) {
        return new LambdaQueryChainWrapper<>(templateMapper).eq(Template::getTemplateName,name).count();
    }

    @Override
    public int countTemplateByCountryAndDianpu(String country, String dianpu) {
        return new LambdaQueryChainWrapper<>(templateMapper).
                eq(Template::getCountry,country)
                .eq(Template::getDianpu,dianpu)
                .count();
    }

}
