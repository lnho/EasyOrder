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
    public String list(Model model) {
        List<Product> list = productService.list();
        model.addAttribute("data", list);
        return "product/list";
    }

    @RequestMapping("edit")
    public String edit(Integer id, Model model) {
        if (id != null) {
            Product product = productService.get(id);
            model.addAttribute("data", product);
        }
        return "product/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public Response<Boolean> save(Product product, Model model) {
        boolean result;
        if (product.getId() == null) {
            result = productService.createProduct(product);
        } else {
            result = productService.updateProduct(product);
        }
        return Response.getSuccessResponse(result);
    }

    @RequestMapping("del")
    @ResponseBody
    public Response<Boolean> del(Integer id) {
        boolean result = productService.deleteProduct(id);
        return Response.getSuccessResponse(result);
    }
}
