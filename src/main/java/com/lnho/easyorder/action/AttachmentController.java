package com.lnho.easyorder.action;

/**
 * com.lnho.easyorder.action
 *
 * @author lnho
 * @date 14-7-23 上午10:34
 */

import com.lnho.easyorder.bean.Attachment;
import com.lnho.easyorder.common.conf.Define;
import com.lnho.easyorder.common.utils.FileUtil;
import com.lnho.framework.web.Response;
import com.lnho.easyorder.service.AttachmentService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/attachment")
public class AttachmentController {
    @Autowired
    private AttachmentService attachmentService;

    @RequestMapping()
    public String list(Integer type, Integer relativeId, Model model) {
        List<Attachment> list = attachmentService.list(type, relativeId);
        model.addAttribute("data", list);
        model.addAttribute("relativeId", relativeId);
        model.addAttribute("type", type);
        model.addAttribute("leftMenu", "order");
        return "attachment/list";
    }

    @RequestMapping("add")
    public String add(Integer type, Integer relativeId, Model model) {
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
    public String save(Attachment attachment, MultipartFile file, HttpServletRequest request, Model model) {
        String errorMsg = "操作成功";
        boolean result = false;
        if (StringUtils.isBlank(attachment.getFileName()) || attachment.getRelativeId() == null) {
            errorMsg = "请全部填写后提交";
        } else {
            try {
                if (attachment.getId() == null) {
                    if (file.isEmpty()) {
                        errorMsg = "请上传文件后提交";
                    } else {
                        result = attachmentService.createAttachment(attachment, file, request);
                    }
                } else {
                    result = attachmentService.updateAttachment(attachment);
                }
            } catch (RuntimeException e) {
                e.printStackTrace();
            }
        }
        model.addAttribute("relativeId", attachment.getRelativeId());
        model.addAttribute("type", attachment.getType());
        model.addAttribute("leftMenu", "order");
        model.addAttribute("result", result);
        model.addAttribute("errorMsg", errorMsg);
        return "attachment/edit";
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

    @RequestMapping("download")
    public void download(Integer id, HttpServletRequest request, HttpServletResponse response) {
        if (id == null) {
            return;
        }
        Attachment attachment = attachmentService.get(id);
        String fileName = attachment.getSavePath();
        try {
            FileUtil.getFileDownload(request, response, fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
