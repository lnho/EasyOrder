package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.Project;
import com.lnho.easyorder.commons.web.Response;
import com.lnho.easyorder.service.ProjectService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/project")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @RequestMapping()
    public String list(Integer orderId, Model model) {
        List<Project> list = projectService.list(orderId);
        model.addAttribute("data", list);
        model.addAttribute("orderId", orderId);
        return "project/list";
    }

    @RequestMapping("add")
    public String add(Integer orderId, Model model) {
        if (orderId == null) {
            return "404";
        }
        model.addAttribute("orderId", orderId);
        return "project/edit";
    }

    @RequestMapping("edit")
    public String edit(Integer id, Model model) {
        if (id != null) {
            Project project = projectService.get(id);
            model.addAttribute("data", project);
            model.addAttribute("orderId",project.getOrderId());
        }
        return "project/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public Response<Boolean> save(Project project) {
        if (StringUtils.isBlank(project.getName()) || project.getOrderId() == null) {
            return Response.getFailedResponse("请全部填写后提交");
        }
        boolean result;
        try {
            if (project.getId() == null) {
                result = projectService.createProject(project);
            } else {
                result = projectService.updateProject(project);
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
        boolean result = projectService.deleteProject(id);
        return Response.getSuccessResponse(result);
    }
}
