package com.lnho.easyorder.common;

import com.lnho.framework.context.ApplicationContextUtil;
import com.lnho.easyorder.conf.Global;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

public class WebFreeMarkerView extends FreeMarkerView {

    @Override
    protected void exposeHelpers(Map<String, Object> model, HttpServletRequest request) throws Exception {
        String ctx = request.getContextPath();
        ctx += "/";
        model.put("ctx", ctx);
        model.put("siteName", ApplicationContextUtil.getBean(Global.class).getSiteName());
        HttpSession session = request.getSession();
        Object isLogin = session.getAttribute("isLogin");
        if (isLogin != null && (Boolean) isLogin) {
            isLogin = true;
        } else {
            isLogin = false;
        }
        model.put("isLogin", isLogin);
    }

}
