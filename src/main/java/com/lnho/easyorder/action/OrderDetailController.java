package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.OrderDetail;
import com.lnho.easyorder.bean.Product;
import com.lnho.easyorder.commons.web.Response;
import com.lnho.easyorder.service.OrderDetailService;
import com.lnho.easyorder.service.ProductService;
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
    @Autowired
    private ProductService productService;

    @RequestMapping()
    public String list(Integer orderId, Model model) {
        List<OrderDetail> list = orderDetailService.list(orderId);
        model.addAttribute("data", list);
        model.addAttribute("orderId", orderId);
        return "order_detail/list";
    }

    @RequestMapping("edit")
    public String edit(Integer orderId, Integer id, Model model) {
        if (id != null) {
            OrderDetail orderDetail = orderDetailService.get(id);
            model.addAttribute("data", orderDetail);
            model.addAttribute("orderId", orderDetail.getProjectId());
        } else {
            model.addAttribute("orderId", orderId);
        }
        List<Product> products = productService.list(1);
        model.addAttribute("products", products);
        return "order_detail/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public Response<Boolean> save(OrderDetail orderDetail, Model model) {
        if (orderDetail.getRemark() == null) {
            orderDetail.setRemark("");
        }
        if (orderDetail.getSpec1() == null || orderDetail.getType() == null || orderDetail.getPrice() == null) {
            return Response.getFailedResponse("数据不能为空");
        }
        Double money = 0.0;
        if (orderDetail.getType() == 1) {
            if (orderDetail.getSpec2() == null || orderDetail.getArea() == null) {
                return Response.getFailedResponse("数据不能为空");
            } else {
                money = orderDetail.getSpec1() * orderDetail.getSpec2() * orderDetail.getPrice() * orderDetail.getArea();
                orderDetail.setNum(0);
            }
        }
        if (orderDetail.getType() == 2) {
            if (orderDetail.getNum() == null) {
                return Response.getFailedResponse("数据不能为空");
            } else {
                money = orderDetail.getSpec1() * orderDetail.getPrice() * orderDetail.getNum();
                orderDetail.setSpec2(0.0);
                orderDetail.setArea(0.0);
            }
        }
        orderDetail.setMoney(money);
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
