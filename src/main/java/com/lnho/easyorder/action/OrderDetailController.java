package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.OrderDetail;
import com.lnho.easyorder.commons.web.Response;
import com.lnho.easyorder.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/order/detail")
public class OrderDetailController {
    @Autowired
    private OrderDetailService orderDetailService;

    @RequestMapping()
    public String list(Integer orderId, Model model) {
        List<OrderDetail> list = orderDetailService.list(orderId);
        model.addAttribute("data", list);
        model.addAttribute("orderId",orderId);
        return "order_detail/list";
    }

    @RequestMapping("edit")
    public String edit(Integer orderId, Integer id, Model model) {
        if (id != null) {
            OrderDetail orderDetail = orderDetailService.get(id);
            model.addAttribute("data", orderDetail);
            model.addAttribute("orderId", orderDetail.getOrderId());
        } else {
            model.addAttribute("orderId", orderId);
        }
        return "order_detail/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public Response<Boolean> save(OrderDetail orderDetail, Model model) {
        boolean result;
        if (orderDetail.getId() == null) {
            result = orderDetailService.createOrderDetail(orderDetail);
        } else {
            result = orderDetailService.updateOrderDetail(orderDetail);
        }
        return Response.getSuccessResponse(result);
    }

    @RequestMapping("del")
    @ResponseBody
    public Response<Boolean> del(Integer id) {
        boolean result = orderDetailService.deleteOrderDetail(id);
        return Response.getSuccessResponse(result);
    }
}
