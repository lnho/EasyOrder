package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.OrderDetail;
import com.lnho.easyorder.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
        return "order_detail/list";
    }

    @RequestMapping("edit")
    public String edit(Integer orderId, Model model) {
        List<OrderDetail> list = orderDetailService.list(orderId);
        model.addAttribute("data", list);
        return "order_detail/edit";
    }

    @RequestMapping("del")
    public String del(Integer orderId, Model model) {
        List<OrderDetail> list = orderDetailService.list(orderId);
        model.addAttribute("data", list);
        return "order_detail/list";
    }
}
