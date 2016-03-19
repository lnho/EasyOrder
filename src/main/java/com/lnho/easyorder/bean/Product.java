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
@Table("product")
public class Product {
    @Id("id")
    private Integer id;
    @Column("name")
    private String name;
    @Column("type")
    private Integer type;
    @Column("spec1")
    private Double spec1;
    @Column("spec2")
    private Double spec2;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
