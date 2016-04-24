package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.Attachment;
import com.lnho.easyorder.common.conf.Define;
import com.lnho.easyorder.common.utils.FileUtil;
import com.lnho.framework.mybatis.bean.Query;
import com.lnho.framework.mybatis.service.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * com.lnho.easyorder.service
 *
 * @author lnho
 * @date 14-7-23 上午10:29
 */
@Service
public class AttachmentService extends BaseService<Attachment> {

    public List<Attachment> list(Integer type, Integer relativeId) {
        Query query = Query.build(Attachment.class);
        query.addEq("relativeId", relativeId);
        query.addEq("type", type);
        return this.findByQuery(query);
    }

    public List<Attachment> getAttachmentImageList(Integer type, Integer relativeId) {
        List<Attachment> list = list(type, relativeId);
        List<Attachment> result = new ArrayList<Attachment>();
        for (Attachment attachment : list) {
            if (FileUtil.checkFileIsImage(attachment.getSavePath())) {
                attachment.setSavePath(Define.getAttachmentUrl(attachment.getSavePath()));
                result.add(attachment);
            }
        }
        return result;
    }

    public boolean deleteAttachment(Integer id) {
        Attachment attachment = get(id);
        if (attachment == null) {
            return false;
        }
        delete(id);
        return true;
    }

    public boolean createAttachment(Attachment attachment, MultipartFile file, HttpServletRequest request) {
        try {
            // 文件保存路径
            String suffix = FileUtil.getFileSuffix(file.getOriginalFilename());
            String savePath = UUID.randomUUID().toString() + "." + suffix;
            String filePath = request.getSession().getServletContext().getRealPath("/") + Define.getAttachmentUrl(savePath);
            // 转存文件
            file.transferTo(new File(filePath));
            attachment.setSavePath(savePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
        insert(attachment);
        return true;
    }

    public boolean updateAttachment(Attachment attachment) {
        Attachment attachment1 = get(attachment.getId());
        if (attachment1 == null) {
            return false;
        }
        attachment1.setFileName(attachment.getFileName());
        update(attachment1);
        return true;
    }
}
