package org.Hooya.vo;


import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

@Data
@AllArgsConstructor
public class InvoiceInfomation implements Serializable {
    //订单号
    private String orderId;
    //店铺名称
    private String dianPu;
    //国家
    private String country;
}
