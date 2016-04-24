package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.*;
import com.lnho.easyorder.common.conf.Define;
import com.lnho.easyorder.service.*;
import com.lnho.framework.web.Response;
import com.lnho.easyorder.common.conf.Global;
import com.lnho.easyorder.vo.ProjectVo;
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
    @Autowired
    private ProjectService projectService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private AttachmentService attachmentService;
    @Autowired
    private Global global;

    @RequestMapping()
    public String list(Integer orderId, Model model) {
        List<ProjectVo> list = orderDetailService.list(orderId, false);
        model.addAttribute("data", list);
        model.addAttribute("orderId", orderId);
        model.addAttribute("leftMenu", "order");
        List<Attachment> attachments = attachmentService.getAttachmentImageList(Define.ATTACHMENT_TYPE_ORDER, orderId);
        model.addAttribute("attachments", attachments);
        return "order_detail/list";
    }

    @RequestMapping("print")
    public String print(Integer orderId, Model model) {
        List<ProjectVo> list = orderDetailService.list(orderId, true);
        model.addAttribute("data", list);
        model.addAttribute("orderId", orderId);
        model.addAttribute("leftMenu", "order");
        model.addAttribute("order", orderService.get(orderId));
        model.addAttribute("printTitle", global.getPrintTitle());
        List<Attachment> attachments = attachmentService.getAttachmentImageList(Define.ATTACHMENT_TYPE_ORDER, orderId);
        model.addAttribute("attachments", attachments);
        return "order_detail/print";
    }

    @RequestMapping("edit")
    public String edit(Integer orderId, Integer id, Model model) {
        if (id != null) {
            OrderDetail orderDetail = orderDetailService.get(id);
            model.addAttribute("data", orderDetail);
            Project project = projectService.get(orderDetail.getProjectId());
            orderId = project.getOrderId();
        }
        model.addAttribute("orderId", orderId);
        List<Project> projects = projectService.list(orderId);
        List<Product> products1 = productService.list(1);
        List<Product> products2 = productService.list(2);
        List<Product> products3 = productService.list(3);
        model.addAttribute("projects", projects);
        model.addAttribute("products1", products1);
        model.addAttribute("products2", products2);
        model.addAttribute("products3", products3);
        model.addAttribute("leftMenu", "order");
        return "order_detail/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public Response<Boolean> save(OrderDetail orderDetail, Model model) {
        if (orderDetail.getRemark() == null) {
            orderDetail.setRemark("");
        }
        if (orderDetail.getType() == null || orderDetail.getProjectId() == null ||
                orderDetail.getNum() == null || orderDetail.getPrice() == null) {
            return Response.getFailedResponse("数据不能为空");
        }
        Double money;
        orderDetail.setType(orderDetail.getType());
        if (orderDetail.getType() == ProductType.PRODUCT.getId()) {
            if (orderDetail.getSpec1() == null || orderDetail.getSpec2() == null) {
                return Response.getFailedResponse("数据不能为空");
            }
            Double area = orderDetail.getSpec1() * orderDetail.getSpec2() * orderDetail.getNum();
            money = area * orderDetail.getPrice();
            orderDetail.setArea(area);
        } else if (orderDetail.getType() == ProductType.LINE.getId()) {
            if (orderDetail.getSpec1() == null) {
                return Response.getFailedResponse("数据不能为空");
            }
            if (orderDetail.getSpec2() == null) {
                orderDetail.setSpec2(0.0);
            }
            money = orderDetail.getSpec1() * orderDetail.getNum() * orderDetail.getPrice();
            orderDetail.setArea(0.0);
        } else {
            if (orderDetail.getNum() == null) {
                return Response.getFailedResponse("数据不能为空");
            }
            money = orderDetail.getPrice() * orderDetail.getNum();
            orderDetail.setSpec1(0.0);
            orderDetail.setSpec2(0.0);
            orderDetail.setArea(0.0);
        }
        orderDetail.setOrderId(projectService.get(orderDetail.getProjectId()).getOrderId());
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
