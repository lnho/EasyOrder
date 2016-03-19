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
@Table("tbl_order_detail")
public class OrderDetail {
    @Id("id")
    private Integer id;
    @Column("order_id")
    private Integer orderId;  //消费1充值2
    @Column("name")
    private String name;
    @Column("spec1")
    private Double spec1;
    @Column("spec2")
    private Double spec2;
    @Column("num")
    private Integer num;
    @Column("area")
    private Double area;
    @Column("price")
    private Double price;
    @Column("money")
    private Double money;
    @Column("remark")
    private String remark;
    @Column("type")
    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getSpec1() {
        return spec1;
    }

    public void setSpec1(Double spec1) {
        this.spec1 = spec1;
    }

    public Double getSpec2() {
        return spec2;
    }

    public void setSpec2(Double spec2) {
        this.spec2 = spec2;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
