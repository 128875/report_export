package org.Hooya.config;

import cn.dev33.satoken.exception.NotLoginException;
import cn.dev33.satoken.exception.NotPermissionException;
import cn.dev33.satoken.exception.NotRoleException;
import cn.hutool.json.JSONUtil;
import com.alibaba.druid.support.json.JSONUtils;
import lombok.extern.slf4j.Slf4j;
import org.Hooya.entity.ErrorLog;
import org.Hooya.exception.BussinessException;
import org.Hooya.util.AsyncTask;
import org.Hooya.vo.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.Date;
import java.util.Set;
import java.util.stream.Collectors;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @Autowired
    private AsyncTask asyncTask;

    @ExceptionHandler(BussinessException.class)
    public ResponseEntity<String> handleExcepting(BussinessException e,HttpServletRequest request){
        this.saveErrorLog(e,request);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
    }

    @ExceptionHandler(Exception.class)
    public R handleExcepting(Exception e, HttpServletRequest request){
        this.saveErrorLog(e,request);
        return R.error(500, e.getMessage());
    }

    /*************************Sa-Token常见异常*************************/

    @ExceptionHandler({ConstraintViolationException.class})
    public R loginValidatedHandler(ConstraintViolationException ex, HttpServletRequest request) {
        //this.saveErrorLog(e,request);
        Set<ConstraintViolation<?>> violations = ex.getConstraintViolations();
        String message = violations.stream().map(ConstraintViolation::getMessage).collect(Collectors.joining(","));
        return R.error(500, message);
    }

    /**
     * 处理sa-token未登录异常
     * @param e
     * @return
     */
    @ExceptionHandler({NotLoginException.class})
    public R notLoginExceptionHandler(NotLoginException e, HttpServletRequest request) {
        this.saveErrorLog(e,request);
        return R.error(501, "请登录");
    }

    @ExceptionHandler({NotPermissionException.class})
    public R notPermissionExceptionHandler(NotPermissionException e, HttpServletRequest request) {
        this.saveErrorLog(e,request);
        return R.error("暂无权限");
    }

    @ExceptionHandler({NotRoleException.class})
    public R notRoleExceptionHandler(NotRoleException e, HttpServletRequest request) {
        this.saveErrorLog(e,request);
        return R.error("暂无权限");
    }


    public void saveErrorLog(Exception e,HttpServletRequest request){
        log.error("error",e);
        ErrorLog errorLog =new ErrorLog();
        errorLog.setUrl(request.getRequestURI());
        errorLog.setMethod(request.getMethod());
        errorLog.setParams(JSONUtil.parse(request.getParameterMap()).toBean(String.class));
        errorLog.setMessage(e.getMessage());
        errorLog.setException(e.getClass().toString());
        errorLog.setCreateTime(new Date());
        asyncTask.saveErrorLog(errorLog);
    }

}
