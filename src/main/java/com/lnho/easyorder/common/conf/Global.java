package com.lnho.easyorder.common.conf;

/**
 * com.lnho.easyorder.common.conf
 *
 * @author lnho
 * @date 15-3-24 上午9:55
 */
public class Global {
    private String adminUser;
    private String adminPass;
    private String siteName;
    private String printTitle;

    public String getPrintTitle() {
        return printTitle;
    }

    public void setPrintTitle(String printTitle) {
        this.printTitle = printTitle;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getAdminUser() {
        return adminUser;
    }

    public void setAdminUser(String adminUser) {
        this.adminUser = adminUser;
    }

    public String getAdminPass() {
        return adminPass;
    }

    public void setAdminPass(String adminPass) {
        this.adminPass = adminPass;
    }
}
