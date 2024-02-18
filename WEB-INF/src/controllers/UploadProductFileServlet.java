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
import models.Product;
import models.ProductImage;

@WebServlet("/upload_product_file.do")
public class UploadProductFileServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        Product prod = (Product)session.getAttribute("prod");

        String productId = Integer.toString(prod.getProductId());

        if(user != null) {
            Integer count = Integer.parseInt(request.getParameter("count"));
            if(count == 1) {
                // single pic ko upload krne ke liye
                String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/sellers/"+user.getEmail()+"/products/"+productId);
                System.out.println(uploadPath);

                String fileName = FileUpload.uploadFile(request, uploadPath);

                String pathToSave = user.getEmail()+"/products/"+productId+"/"+fileName;

                ProductImage.addProductMainImage(pathToSave, Integer.parseInt(productId));
                
                System.out.println("Main Pic Uploaded Successfully");
            } else {
                // multiple pics ko upload krne ke liye
                String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/sellers/"+user.getEmail()+"/products/"+productId+"/pics/");
                System.out.println(uploadPath);

                String fileNames = FileUpload.uploadFile(request, uploadPath);

                String pathToSave = user.getEmail()+"/products/"+productId+"/pics";

                ProductImage.addProductMultipleImages(fileNames, pathToSave, Integer.parseInt(productId));
                
                System.out.println("Multiple Pic Uploaded Successfully");
            }
        }
    }
}