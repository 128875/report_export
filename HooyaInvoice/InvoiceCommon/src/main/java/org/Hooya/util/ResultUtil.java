package org.Hooya.util;

import lombok.Data;
import org.Hooya.common.CodeEnum;
import org.Hooya.vo.Result;

@Data
public class ResultUtil {

    public static Result success(Object data) {
        return resultData(CodeEnum.SUCCESS.val(), CodeEnum.SUCCESS.msg(), data);
    }

    public static Result success(String msg,Object data) {
        return resultData(CodeEnum.SUCCESS.val(), msg, data);
    }

    public static Result fail(String code, String msg) {
        return resultData(code, msg, null);
    }

    public static Result fail(String code, String msg, Object data) {
        return resultData(code, msg, data);
    }

    private static Result resultData(String code, String msg, Object data) {
        Result resultData = new Result();
        resultData.setCode(code);
        resultData.setMsg(msg);
        resultData.setData(data);
        return resultData;
    }

}
