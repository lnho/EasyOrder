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
@Table("tbl_product")
public class Product {
    @Id("id")
    private Integer id;
    @Column("name")
    private String name;
    @Column("type")
    private Integer type;
    @Column("price")
    private Double price;

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
