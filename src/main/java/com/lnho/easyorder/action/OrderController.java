package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.Order;
import com.lnho.easyorder.commons.web.Response;
import com.lnho.easyorder.service.OrderService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping()
    public String list(String keyword, Model model) {
        if (keyword == null) {
            keyword = "";
        }
        List<Order> list = orderService.list(keyword);
        model.addAttribute("data", list);
        model.addAttribute("keyword", keyword);
        return "order/list";
    }

    @RequestMapping("edit")
    public String edit(Integer id, Model model) {
        if (id != null) {
            Order order = orderService.get(id);
            model.addAttribute("data", order);
        }
        return "order/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public Response<Boolean> save(Order order) {
        if (StringUtils.isBlank(order.getClientName()) || StringUtils.isBlank(order.getClientPhone())) {
            return Response.getFailedResponse("请填写完整");
        }
        if (order.getClientAddress() == null) {
            order.setClientAddress("");
        }
        if (order.getOrderTime() == null) {
            order.setOrderTime(new Date());
        }
        boolean result;
        if (order.getId() == null) {
            result = orderService.createOrder(order);
        } else {
            result = orderService.updateOrder(order);
        }
        return Response.getSuccessResponse(result);
    }

    @RequestMapping("del")
    @ResponseBody
    public Response<Boolean> del(Integer id) {
        boolean result = orderService.deleteOrder(id);
        return Response.getSuccessResponse(result);
    }
}
