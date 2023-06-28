package org.Hooya.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jdk.nashorn.internal.parser.DateParser;
import org.Hooya.entity.ErrorLog;
import org.Hooya.mapper.LogMapper;
import org.Hooya.service.LogService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, ErrorLog> implements LogService {
    @Autowired
    private LogMapper logMapper;

    @Override
    public Page<ErrorLog> getErrorLogPage(String startTime ,String endTime,Integer page,Integer size) {
        Page<ErrorLog> pageError =new Page<>();
        pageError.setCurrent(page);
        pageError.setSize(size);
        LambdaQueryWrapper<ErrorLog> lambdaQueryWrapper =new LambdaQueryWrapper<>();
        if(StringUtils.isNotBlank(startTime)&&StringUtils.isNotBlank(endTime)){
            lambdaQueryWrapper.between(ErrorLog::getCreateTime,startTime,endTime);
        }
        lambdaQueryWrapper.orderByDesc(ErrorLog::getCreateTime);
        return logMapper.selectPage(pageError,lambdaQueryWrapper);
    }
}
