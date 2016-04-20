package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.Attachment;
import com.lnho.easyorder.commons.web.Response;
import com.lnho.easyorder.service.AttachmentService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/attachment")
public class AttachmentController {
    @Autowired
    private AttachmentService attachmentService;

    @RequestMapping()
    public String list(Integer type, Integer relativeId,Model model) {
        List<Attachment> list = attachmentService.list(type,relativeId);
        model.addAttribute("data", list);
        model.addAttribute("relativeId", relativeId);
        model.addAttribute("type", type);
        model.addAttribute("leftMenu", "order");
        return "attachment/list";
    }

    @RequestMapping("add")
    public String add(Integer type,Integer relativeId, Model model) {
        if (relativeId == null || type == null) {
            return "404";
        }
        model.addAttribute("relativeId", relativeId);
        model.addAttribute("type", type);
        model.addAttribute("leftMenu", "order");
        return "attachment/edit";
    }

    @RequestMapping("edit")
    public String edit(Integer id, Model model) {
        if (id != null) {
            Attachment attachment = attachmentService.get(id);
            model.addAttribute("data", attachment);
            model.addAttribute("relativeId", attachment.getRelativeId());
            model.addAttribute("type", attachment.getType());
        }
        model.addAttribute("leftMenu", "order");
        return "attachment/edit";
    }

    @RequestMapping("save")
    @ResponseBody
    public Response<Boolean> save(Attachment attachment) {
        if (StringUtils.isBlank(attachment.getFileName()) || attachment.getRelativeId() == null) {
            return Response.getFailedResponse("请全部填写后提交");
        }
        boolean result;
        try {
            if (attachment.getId() == null) {
                result = attachmentService.createAttachment(attachment);
            } else {
                result = attachmentService.updateAttachment(attachment);
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
        boolean result = attachmentService.deleteAttachment(id);
        if (result) {
            return Response.getSuccessResponse(result);
        }
        return Response.getFailedResponse("删除失败");
    }
}
