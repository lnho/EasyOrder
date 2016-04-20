package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.OrderDetail;
import com.lnho.easyorder.bean.ProductType;
import com.lnho.easyorder.bean.Project;
import com.lnho.easyorder.commons.mybatis.bean.Query;
import com.lnho.easyorder.commons.mybatis.service.BaseService;
import com.lnho.easyorder.commons.utils.NumberFormatUtil;
import com.lnho.easyorder.vo.ProjectVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * com.lnho.easyorder.service
 *
 * @author lnho
 * @date 14-7-23 上午10:29
 */
@Service
public class OrderDetailService extends BaseService<OrderDetail> {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private OrderService orderService;

    public List<ProjectVo> list(Integer orderId, boolean print) {
        List<ProjectVo> result = new ArrayList<ProjectVo>();
        List<Project> projects = projectService.list(orderId);
        Double totalArea = 0.0;
        Double totalMoney = 0.0;
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        for (int i = 0; i < projects.size(); i++) {
            Project project = projects.get(i);
            ProjectVo projectVo = new ProjectVo();
            projectVo.setNo(NumberFormatUtil.formatInteger(i + 1));
            if (print) {
                projectVo.setTitle(project.getName() + "合计");
            } else {
                StringBuilder name = new StringBuilder();
                char[] nameChar = project.getName().toCharArray();
                for (char c : nameChar) {
                    name.append(c).append("　");
                }
                name.append("合　计");
                projectVo.setTitle(name.toString());
            }
            projectVo.setOrderDetails(new ArrayList<OrderDetail>());
            map.put(project.getId(), i);
            result.add(projectVo);
        }
        Query query = Query.build(OrderDetail.class);
        query.addEq("orderId", orderId);
        List<OrderDetail> orderDetails = this.findByQuery(query);
        for (OrderDetail orderDetail : orderDetails) {
            orderDetail.setName(productService.get(orderDetail.getProductId()).getName());
            Integer index = map.get(orderDetail.getProjectId());
            ProjectVo projectVo = result.get(index);
            if (orderDetail.getType() == ProductType.PRODUCT.getId()) {
                projectVo.setArea(projectVo.getArea() + orderDetail.getArea());
                totalArea += orderDetail.getArea();
            }
            projectVo.setMoney(projectVo.getMoney() + orderDetail.getMoney());
            totalMoney += orderDetail.getMoney();
            projectVo.getOrderDetails().add(orderDetail);
        }
        ProjectVo projectVo = new ProjectVo();
        projectVo.setArea(totalArea);
        projectVo.setMoney(totalMoney);
        projectVo.setOrderDetails(new ArrayList<OrderDetail>());
        if (print) {
            projectVo.setTitle("总 合 计");
        } else {
            projectVo.setTitle("总　合　计");
        }
        result.add(projectVo);
        orderService.updateOrderCount(orderId,totalArea,totalMoney);
        return result;
    }

    public List<OrderDetail> queryByProjectId(Integer projectId) {
        Query query = Query.build(OrderDetail.class);
        query.addEq("projectId", projectId);
        return this.findByQuery(query);
    }

    public boolean deleteOrderDetail(Integer id) {
        OrderDetail orderDetail = get(id);
        if (orderDetail == null) {
            return false;
        }
        delete(id);
        return true;
    }

    public boolean createOrderDetail(OrderDetail orderDetail) {
        insert(orderDetail);
        return true;
    }

    public boolean updateOrderDetail(OrderDetail orderDetail) {
        OrderDetail orderDetail1 = get(orderDetail.getId());
        if (orderDetail1 == null) {
            return false;
        }
        update(orderDetail);
        return true;
    }
}
