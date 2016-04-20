package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.service.OverviewService;
import com.lnho.easyorder.vo.OverviewVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/overview")
public class OverviewController {
    @Autowired
    private OverviewService overviewService;

    @RequestMapping()
    public String overview(Model model) {
        List<OverviewVo> monthsList = overviewService.queryMonthsCount();
        model.addAttribute("monthsList", monthsList);
        List<OverviewVo> yearsList = overviewService.queryYearsCount();
        model.addAttribute("yearsList", yearsList);
        model.addAttribute("leftMenu", "overview");
        return "overview/list";
    }
}
