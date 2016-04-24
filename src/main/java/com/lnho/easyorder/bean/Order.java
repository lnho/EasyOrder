package com.lnho.easyorder.bean;

import com.lnho.framework.mybatis.annotation.Column;
import com.lnho.framework.mybatis.annotation.Id;
import com.lnho.framework.mybatis.annotation.Table;

import java.util.Date;

/**
 * com.lnho.easyorder.bean
 *
 * @author lnho
 * @date 14-7-23 上午10:28
 */
@Table("tbl_order")
public class Order {
    @Id("id")
    private Integer id;
    @Column("client_name")
    private String clientName;
    @Column("client_address")
    private String clientAddress;
    @Column("client_phone")
    private String clientPhone;
    @Column("order_time")
    private Date orderTime;
    @Column("area")
    private Double area;
    @Column("money")
    private Double money;

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getClientAddress() {
        return clientAddress;
    }

    public void setClientAddress(String clientAddress) {
        this.clientAddress = clientAddress;
    }

    public String getClientPhone() {
        return clientPhone;
    }

    public void setClientPhone(String clientPhone) {
        this.clientPhone = clientPhone;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }
}
