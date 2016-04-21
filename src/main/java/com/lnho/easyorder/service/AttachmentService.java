package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.Attachment;
import com.lnho.easyorder.bean.OrderDetail;
import com.lnho.easyorder.bean.Attachment;
import com.lnho.easyorder.commons.mybatis.bean.Query;
import com.lnho.easyorder.commons.mybatis.service.BaseService;
import org.jasig.cas.client.util.HttpServletRequestWrapperFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
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
            String prefix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            String savePath = UUID.randomUUID().toString() + prefix;
            String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/" + savePath;
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
