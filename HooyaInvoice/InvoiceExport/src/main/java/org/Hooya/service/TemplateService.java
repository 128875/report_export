package org.Hooya.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.Hooya.entity.Template;


public interface TemplateService extends IService<Template> {
    int countTemplateByName(String name);
    int countTemplateByCountryAndDianpu(String country, String dianpu);
}
