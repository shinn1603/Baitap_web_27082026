package vn.iotstar.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/image")
public class DownloadImageController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    // Đường dẫn này phải TRÙNG KHỚP với đường dẫn upload trong CategoryController
    private static final String UPLOAD_DIR = "C:\\uploads"; 

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy tên file từ tham số URL (ví dụ: /image?fname=abc.jpg)
        String fileName = req.getParameter("fname");
        
        if (fileName == null || fileName.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND); // Báo lỗi 404 nếu không có tên file
            return;
        }

        // Khởi tạo file
        File file = new File(UPLOAD_DIR + File.separator + fileName);

        if (file.exists()) {
            // Lấy định dạng của file (vd: image/jpeg, image/png)
            String contentType = getServletContext().getMimeType(file.getName());
            if (contentType == null) {
                contentType = "application/octet-stream";
            }
            resp.setContentType(contentType);
            resp.setContentLength((int) file.length());

            // Đọc file từ ổ cứng và ghi vào luồng phản hồi của HTTP
            try (FileInputStream in = new FileInputStream(file);
                 OutputStream out = resp.getOutputStream()) {
                 
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // Nếu không tìm thấy file trong ổ C, trả về lỗi 404 (Không tìm thấy)
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}