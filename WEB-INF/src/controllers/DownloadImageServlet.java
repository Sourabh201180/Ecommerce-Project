package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.ProductImage;
import models.User;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@WebServlet("/download_image.do")
public class DownloadImageServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("image/png");
        
        // String imagePath = request.getParameter("image_path");
        // System.out.println("imagePath = "+imagePath);

        String imagePath = "";
        Integer count = Integer.parseInt(request.getParameter("count"));
        InputStream is = getServletContext().getResourceAsStream("abc");

        if(count == 1) {    // product main pic
            Integer productId = Integer.parseInt(request.getParameter("product_id"));
            
            imagePath = ProductImage.fetchMainProductImage(productId);
            is = getServletContext().getResourceAsStream("/WEB-INF/uploads/users/sellers/"+imagePath);
        } else if(count == 2){  // product multiple pics
            imagePath = request.getParameter("image_path");
            is = getServletContext().getResourceAsStream("/WEB-INF/uploads/users/sellers/"+imagePath);
        } else if(count == 3){  // profile pic
            Integer userId = Integer.parseInt(request.getParameter("user_id"));
            Integer userType = Integer.parseInt(request.getParameter("user_type"));
            
            imagePath = User.fetchUserProfileImage(userId);
            String buyerSeller = "";
            if(userType == 2) {         // buyer
                buyerSeller = "buyers";
            } else {
                buyerSeller = "sellers";
            }
            
            is = getServletContext().getResourceAsStream("/WEB-INF/uploads/users/"+ buyerSeller +"/"+imagePath);
        } else {    // certificate
            imagePath = request.getParameter("certificate_path");
            is = getServletContext().getResourceAsStream("/WEB-INF/uploads/users/sellers/"+imagePath);
        }

        OutputStream os = response.getOutputStream();

        byte[] arr = new byte[1024];
        int count1 = 0;
        while((count1 = is.read(arr)) != -1) {
            os.write(arr);
        }

        os.close();
    }
}