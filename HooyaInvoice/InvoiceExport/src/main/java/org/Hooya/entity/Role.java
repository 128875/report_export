package org.Hooya.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("t_role")
public class Role implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;
    //角色名称
    private String name;
    //权限集合
    private String permission;
    //超级管理员（0否 1是）
    private Integer root;
    //角色状态（0停用 1正常）
    private String status;
}
