package com.lnho.easyorder.dao;

import com.lnho.easyorder.bean.Order;
import com.lnho.easyorder.commons.mybatis.dao.BaseDAO;

import java.util.List;

/**
 * com.lnho.easyorder.dao
 *
 * @author lnho
 * @date 14-7-23 上午10:30
 */
public interface OrderDAO extends BaseDAO<Order> {
    List<Order> query(String keyword);
}
