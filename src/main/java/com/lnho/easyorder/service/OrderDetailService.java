package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.OrderDetail;
import com.lnho.easyorder.commons.mybatis.bean.Query;
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
public class OrderDetailService extends BaseService<OrderDetail> {

    public List<OrderDetail> list(Integer orderId) {
        Query query = Query.build(OrderDetail.class);
        query.addEq("orderId",orderId);
        List<OrderDetail> list=this.findByQuery(query);
        return list;
    }
}
