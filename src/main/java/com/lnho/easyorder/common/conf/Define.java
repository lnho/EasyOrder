package com.lnho.easyorder.common.conf;

/**
 * Created by lnho on 2016/4/24.
 */
public class Define {
    public static final Integer ATTACHMENT_TYPE_ORDER =1;
    public static final String attachmentSavePath="/upload/";

    public static String getAttachmentUrl(String savePath){
        return attachmentSavePath+savePath;
    }
}
