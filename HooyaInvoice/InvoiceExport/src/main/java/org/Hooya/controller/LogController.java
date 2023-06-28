package org.Hooya.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.Hooya.entity.ErrorLog;
import org.Hooya.service.LogService;
import org.Hooya.util.ResultUtil;
import org.Hooya.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/log")
public class LogController {

    @Autowired
    private LogService logService;

    @GetMapping("/error")
    public Result getErrorLogPage(@RequestParam(required = false) String startTime ,
                                  @RequestParam(required = false) String endTime,
                                  @RequestParam Integer page,
                                  @RequestParam Integer size
                                    ){
        Page<ErrorLog> pageError = logService.getErrorLogPage(startTime, endTime,page,size);
        return ResultUtil.success(pageError);
    }
}
