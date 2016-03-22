package com.lnho.easyorder.bean;

import com.lnho.easyorder.commons.mybatis.annotation.Column;
import com.lnho.easyorder.commons.mybatis.annotation.Id;
import com.lnho.easyorder.commons.mybatis.annotation.Table;

/**
 * com.lnho.easyorder.bean
 *
 * @author lnho
 * @date 14-7-23 上午10:28
 */
@Table("tbl_project")
public class Project {
    @Id("id")
    private Integer id;
    @Column("order_id")
    private Integer orderId;
    @Column("name")
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
}
