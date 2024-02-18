package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Product;
import models.ProductImage;
import models.User;

@WebServlet("/delete_product.do")
public class DeleteProductServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Integer productId = Integer.parseInt(request.getParameter("product_id"));

        User user = (User)session.getAttribute("user");
        
        String nextPage = "index.jsp";

        if(user != null) {
            ProductImage.deleteProductImages(productId);
            Product.deleteProduct(productId);

            nextPage = "seller_products.jsp";
        } else {

        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}