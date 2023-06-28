package org.Hooya.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@Data
@TableName("t_template")
public class Template implements Serializable {
    @TableId(value="id",type= IdType.AUTO)
    private Integer id;
    private String templateName;
    private String country;
    private String dianpu;
    private String path;
    private String pdfpath;

    //货币单位
    private String unit;
    //账单类型 0：代表Invoice  1:代表 DeliverNote
    private Integer type;

    @TableField(exist = false)
    private MultipartFile file;
}
