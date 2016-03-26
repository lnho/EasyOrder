package com.lnho.easyorder.vo;

import com.lnho.easyorder.bean.OrderDetail;

import java.util.List;

/**
 * Created by Lnho on 2016/3/26.
 */
public class ProjectVo {
    private String no;
    private String title;
    private Double area = 0.0;
    private Double money = 0.0;
    private List<OrderDetail> orderDetails;

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

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
}
