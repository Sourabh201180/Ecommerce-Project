package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import utils.FileUpload;

@WebServlet("/user_profile_pic_upload.do")
public class UserProfilePicUploadServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        Integer userType = user.getUserType();
        
        if(user != null) {
            String uploadPath = "";
            if(userType == 1) {
                uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/sellers/"+user.getEmail());
            } else {
                uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/buyers/"+user.getEmail());
            }

            String fileName = FileUpload.uploadFile(request, uploadPath);
            String pathToSave = user.getEmail()+"/"+fileName;

            user.setPic(pathToSave);

            System.out.println("Profile Pic Uploaded Successfully");
        }
    }
}