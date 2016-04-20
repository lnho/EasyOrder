package com.lnho.easyorder.service;

import com.lnho.easyorder.bean.Attachment;
import com.lnho.easyorder.bean.OrderDetail;
import com.lnho.easyorder.bean.Attachment;
import com.lnho.easyorder.commons.mybatis.bean.Query;
import com.lnho.easyorder.commons.mybatis.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * com.lnho.easyorder.service
 *
 * @author lnho
 * @date 14-7-23 上午10:29
 */
@Service
public class AttachmentService extends BaseService<Attachment> {

    public List<Attachment> list(Integer type,Integer relativeId) {
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

    public boolean createAttachment(Attachment attachment) {
        insert(attachment);
        return true;
    }

    public boolean updateAttachment(Attachment attachment) {
        Attachment attachment1 = get(attachment.getId());
        if (attachment1 == null) {
            return false;
        }
        update(attachment);
        return true;
    }
}
