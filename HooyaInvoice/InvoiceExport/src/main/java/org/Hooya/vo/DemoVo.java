package org.Hooya.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;

@Data
public class DemoVo implements Serializable {
    ArrayList<InvoiceInfomation> data;
}
