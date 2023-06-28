package org.Hooya.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.Hooya.entity.ErrorLog;

public interface LogService extends IService<ErrorLog> {
    Page<ErrorLog> getErrorLogPage(String startTime,String endTime,Integer page,Integer size);
}
