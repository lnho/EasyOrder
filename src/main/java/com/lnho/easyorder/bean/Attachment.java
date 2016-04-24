package com.lnho.easyorder.bean;

import com.lnho.framework.mybatis.annotation.Column;
import com.lnho.framework.mybatis.annotation.Id;
import com.lnho.framework.mybatis.annotation.Table;

/**
 * com.lnho.easyorder.bean
 *
 * @author lnho
 * @date 16-4-20 上午10:28
 */
@Table("tbl_attachment")
public class Attachment {
    @Id("id")
    private Integer id;
    @Column("type")
    private Integer type;
    @Column("relative_id")
    private Integer relativeId;
    @Column("file_name")
    private String fileName;
    @Column("save_path")
    private String savePath;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getRelativeId() {
        return relativeId;
    }

    public void setRelativeId(Integer relativeId) {
        this.relativeId = relativeId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }
}
