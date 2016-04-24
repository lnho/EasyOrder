package com.lnho.easyorder.common.utils;

import com.lnho.easyorder.common.conf.Define;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Created by lnho on 2016/4/24.
 */
public class FileUtil {
    public static boolean checkFileIsImage(String fileName) {
        String suffix = getFileSuffix(fileName);
        return suffix.equals("jpg") || suffix.equals("jpeg") || suffix.equals("png") || suffix.equals("gif") ||
                suffix.equals("bmp");
    }

    public static String getFileSuffix(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }

    public static void getFileDownload(HttpServletRequest request, HttpServletResponse response, String fileName) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
        String filePath = request.getSession().getServletContext().getRealPath("/") + Define.getAttachmentUrl(fileName);
        InputStream inputStream = new FileInputStream(new File(filePath));
        OutputStream os = response.getOutputStream();
        byte[] b = new byte[2048];
        int length;
        while ((length = inputStream.read(b)) > 0) {
            os.write(b, 0, length);
        }
        // 这里主要关闭。
        os.close();
        inputStream.close();
    }
}
