package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.User;
import com.lnho.easyorder.commons.mybatis.service.BaseService;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * com.lnho.easyorder.service
 *
 * @author lnho
 * @date 14-7-23 上午10:29
 */
@Service
public class UserService extends BaseService<User> {

    public Boolean checkLogin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object isLogin = session.getAttribute("isLogin");
        if (isLogin != null && (Boolean) isLogin == true) {
            return true;
        }
        return false;
    }
}
