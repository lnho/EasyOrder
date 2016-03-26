package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.Order;
import com.lnho.easyorder.bean.Project;
import com.lnho.easyorder.commons.mybatis.service.BaseService;
import com.lnho.easyorder.dao.OrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private OrderDAO orderDAO;
    @Autowired
    private ProjectService projectService;

    public List<Order> list(String keyword) {
        return orderDAO.query("%" + keyword + "%");
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
        order = insert(order);
        Project project = new Project();
        project.setOrderId(order.getId());
        project.setName("项目1");
        projectService.createProject(project);
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
