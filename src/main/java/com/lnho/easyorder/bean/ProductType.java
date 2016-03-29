package com.lnho.easyorder.bean;

/**
 * com.lnho.easyorder.bean
 *
 * @author lnho
 * @date 16-3-29 上午10:28
 */
public enum ProductType {
    PRODUCT(1), LINE(2), PROCESSING_CHARGE(3);
    private int id;

    ProductType(Integer id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
