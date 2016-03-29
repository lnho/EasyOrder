package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.Product;
import com.lnho.easyorder.commons.web.Response;
import com.lnho.easyorder.service.ProductService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping()
    public String list(Integer type, Model model) {
        List<Product> list = productService.list(type);
        model.addAttribute("data", list);
        model.addAttribute("type", type);
        model.addAttribute("leftMenu", "product" + type);
        return "product/list";
    }

    @RequestMapping("add")
    public String add(Integer type, Model model) {
        if (type == null) {
            return "404";
        }
        model.addAttribute("leftMenu", "product" + type);
        model.addAttribute("type", type);
        return "product/edit";
    }

    @RequestMapping("edit")
    public String edit(Integer id, Model model) {
        if (id != null) {
            Product product = productService.get(id);
            model.addAttribute("data", product);
            model.addAttribute("type", product.getType());
            model.addAttribute("leftMenu", "product" + product.getType());
        }
        return "product/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public Response<Boolean> save(Product product) {
        if (product.getType() == null || StringUtils.isBlank(product.getName()) || product.getPrice() == null) {
            return Response.getFailedResponse("请全部填写后提交");
        }
        if (product.getSpec2() == null) {
            product.setSpec2(0.0);
        }
        boolean result;
        try {
            if (product.getId() == null) {
                result = productService.createProduct(product);
            } else {
                result = productService.updateProduct(product);
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
            return Response.getFailedResponse("error");
        }
        return Response.getSuccessResponse(result);
    }

    @RequestMapping("del")
    @ResponseBody
    public Response<Boolean> del(Integer id) {
        if (id == null) {
            return Response.getSuccessResponse(false);
        }
        boolean result = productService.deleteProduct(id);
        return Response.getSuccessResponse(result);
    }
}
