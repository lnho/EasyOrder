package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.Product;
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
public class ProductService extends BaseService<Product> {

    public List<Product> list() {
        return this.findAll();
    }

    public boolean deleteProduct(Integer id) {
        Product product = get(id);
        if (product == null) {
            return false;
        }
        delete(id);
        return true;
    }

    public boolean createProduct(Product product) {
        insert(product);
        return true;
    }

    public boolean updateProduct(Product product) {
        Product product1 = get(product.getId());
        if (product1 == null) {
            return false;
        }
        update(product);
        return true;
    }
}
