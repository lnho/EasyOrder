package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.OrderDetail;
import com.lnho.easyorder.bean.Project;
import com.lnho.easyorder.commons.mybatis.bean.Query;
import com.lnho.easyorder.commons.mybatis.service.BaseService;
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
public class ProjectService extends BaseService<Project> {
    @Autowired
    private OrderDetailService orderDetailService;

    public List<Project> list(Integer orderId) {
        Query query = Query.build(Project.class);
        query.addEq("orderId", orderId);
        return this.findByQuery(query);
    }

    public boolean deleteProject(Integer id) {
        Project project = get(id);
        if (project == null) {
            return false;
        }
        List<Project> projects = list(project.getOrderId());
        if (projects.size() < 2) {
            return false;
        }
        List<OrderDetail> orderDetails = orderDetailService.queryByProjectId(project.getId());
        if (orderDetails.size() > 0) {
            return false;
        }
        delete(id);
        return true;
    }

    public boolean createProject(Project project) {
        insert(project);
        return true;
    }

    public boolean updateProject(Project project) {
        Project project1 = get(project.getId());
        if (project1 == null) {
            return false;
        }
        update(project);
        return true;
    }
}
