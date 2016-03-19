package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.CountResult;
import com.lnho.easyorder.bean.Log;
import com.lnho.easyorder.bean.User;
import com.lnho.easyorder.param.LogParam;
import com.lnho.easyorder.service.LogService;
import com.lnho.easyorder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/log")
public class LogController {
    @Autowired
    private LogService logService;
    @Autowired
    private UserService userService;

    @RequestMapping()
    public String list(LogParam pageQueryParam, Model model) {
        List<Log> auctionVoList = logService.list(pageQueryParam);
        model.addAttribute("data", auctionVoList);
        model.addAttribute("totalCounts", pageQueryParam.getTotalHit());
        model.addAttribute("currentPage", pageQueryParam.getPageNo());
        double lastPage = Math.ceil(pageQueryParam.getTotalHit() / pageQueryParam.getPageSize());
        model.addAttribute("lastPage", lastPage);
        Integer userId = pageQueryParam.getUserId();
        if (userId != null) {
            model.addAttribute("userId", userId);
        } else {
            model.addAttribute("userId", "");
        }
        return "log/list";
    }

    @RequestMapping("count")
    public String count(Integer userId, Model model) {
        User user = userService.get(userId);
        String userName;
        List<CountResult> list;
        if (user != null) {
            userName = user.getUsername();
            list = logService.list(userId);
        } else {
            userName = "";
            list = new ArrayList<CountResult>();
        }
        model.addAttribute("list", list);
        model.addAttribute("userName", userName);
        return "log/count";
    }
}
