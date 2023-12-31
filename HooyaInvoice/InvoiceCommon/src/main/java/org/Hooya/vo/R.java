package org.Hooya.vo;

import lombok.Data;

@Data
public class R
{

    private Integer code;
    private String msg;
    private Object data ;

    /**
     * 成功
     * @return
     */
    public static R success() {
        return success(new Object(),"请求成功");
    }
    public static R success(Object data) {
        return success(data,"请求成功");
    }

    public static R success(Object data, String msg) {
        R r = new R();
        r.setCode(200);
        r.setMsg(msg);
        r.setData(data);
        return r;
    }

    /**
     * 错误
     * @return
     */
    public static R error() {
        return error(500, "请求失败");
    }

    public static R error(Integer code) {
        return error(code, "请求失败");
    }

    public static R error(String message) {
        return error(500, message);
    }

    public static R error(Integer code, String msg)
    {
        R r = new R();
        r.setCode(code);
        r.setMsg(msg);
        r.setData(null);
        return r;
    }
}
