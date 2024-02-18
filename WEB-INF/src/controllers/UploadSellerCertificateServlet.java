package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.FileUpload;

import models.User;

@WebServlet("/upload_seller_certificate_file.do")
public class UploadSellerCertificateServlet extends HttpServlet { 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        if(user != null) {
            String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/sellers/"+user.getEmail()+"/certificates");
            
            String fileName = FileUpload.uploadFile(request, uploadPath);
            String pathToSave = user.getEmail()+"/certificates/"+fileName;

            user.setCertificate(pathToSave);

            user.saveUser();

            System.out.println("Seller Registered Successfully");
        }
    }
}