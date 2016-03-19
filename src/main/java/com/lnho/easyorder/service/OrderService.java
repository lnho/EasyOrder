package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.Order;
import com.lnho.easyorder.commons.mybatis.service.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * com.lnho.easyorder.service
 *
 * @author lnho
 * @date 14-7-23 上午10:29
 */
@Service
public class OrderService extends BaseService<Order> {

    public List<Order> list() {
        return this.findAll();
    }

    public boolean deleteOrder(Integer id) {
        Order order = get(id);
        if (order == null) {
            return false;
        }
        delete(id);
        return true;
    }

    public boolean createOrder(Order order) {
        insert(order);
        return true;
    }

    public boolean updateOrder(Order order) {
        Order order1 = get(order.getId());
        if (order1 == null) {
            return false;
        }
        update(order);
        return true;
    }
}
