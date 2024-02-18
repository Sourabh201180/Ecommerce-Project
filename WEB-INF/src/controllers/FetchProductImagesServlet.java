package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.ProductImage;

@WebServlet("/fetch_product_all_images.do")
public class FetchProductImagesServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        Integer productId = Integer.parseInt(request.getParameter("productId"));

        ArrayList<String> productImages = ProductImage.fetchAllProductImages(productId);
        session.setAttribute("productImages", productImages);

        Gson gson = new Gson();

        String resp = gson.toJson(productImages);

        response.getWriter().write(resp);
    }  
}