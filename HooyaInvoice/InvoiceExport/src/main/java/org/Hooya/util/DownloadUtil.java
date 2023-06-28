package org.Hooya.util;

import org.Hooya.exception.BussinessException;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@Component
public class DownloadUtil {

    public void DownloadExportFile(String FilePath,String fileName ,HttpServletResponse response){

        try {
            File file = new File(FilePath);
            // 清空response
            response.reset();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/octet-stream");
            response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
            //response.addHeader("Content-Length", "" + file.length());

            //统一使用缓冲流输入输出
            FileInputStream fis = new FileInputStream(file);
            InputStream is = new BufferedInputStream(fis);
            byte[] buff = new byte[fis.available()];
            is.read(buff);
            is.close();

            OutputStream os = new BufferedOutputStream(response.getOutputStream());
            os.write(buff);
            os.flush();
            os.close();

        } catch (IOException e) {
            throw new BussinessException(500,"下载失败");
        }

    }
}
