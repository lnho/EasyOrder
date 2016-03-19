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
@Table("order")
public class Order {
    @Id("id")
    private Integer id;

    @Column("user_id")
    private Integer userId;
    @Column("addtime")
    private Long addtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Long getAddtime() {
        return addtime;
    }

    public void setAddtime(Long addtime) {
        this.addtime = addtime;
    }
}
