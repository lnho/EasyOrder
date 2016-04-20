package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.commons.mybatis.util.StringUtil;
import com.lnho.easyorder.conf.Global;
import com.lnho.easyorder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("index")
public class IndexController {
    @Autowired
    private UserService userService;
    @Autowired
    private Global global;

    @RequestMapping
    public String list() {
        return "redirect:overview.htm";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(HttpServletRequest request) {
        Boolean result = userService.checkLogin(request);
        if (result == true) {
            return "redirect:/user.do";
        } else {
            return "index/login";
        }
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String loginCtrl(String userName, String password, HttpServletRequest request, HttpServletResponse response) {
        if (StringUtil.isBlank(userName) || StringUtil.isBlank(password)) {
            //登录失败
            return "index/login";
        }
        if (userName.equals(global.getAdminUser()) && password.equals(global.getAdminPass())) {
            //登录成功
            HttpSession session = request.getSession();
            session.setAttribute("isLogin", true);
            return "redirect:/user.htm";
        } else {
            //登录失败
            return "index/login";
        }

    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("isLogin", false);
        return "redirect:/index.htm";
    }

    @RequestMapping("main")
    public String main(Model model) {
        return "index/main";
    }
}
