package org.Hooya.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("t_permission")
public class Permission implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;
    //菜单名称
    private String name;
    //父菜单ID
    private Integer parentId;
    //菜单类型（M目录 C菜单 F按钮）
    private String type;
    //组件路径
    private String path;
    //权限标识
    private String perms;
    //显示顺序
    private Integer sort;
    //菜单状态（0停用 1正常 ）
    private Integer status;
    //菜单图标
    private String icon;
}
