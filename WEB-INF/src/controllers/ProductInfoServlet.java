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
import models.User;

@WebServlet("/product_info.do")
public class ProductInfoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Integer productId = Integer.parseInt(request.getParameter("productId"));

        // User user = (User)session.getAttribute("user");

        Product product = Product.getProductInfo(productId);
        ArrayList<Product> subsequentProducts = Product.getAllSubsequentProducts(product.getSubCategory().getSubCategoryId());
        
        String nextPage = "index.jsp";

        // if(user != null) {

        // } else {
            
        // }
            
        // product ki info to sbko dikhegi, whether he is logged in or not
        session.setAttribute("product", product);
        session.setAttribute("subsequentProducts", subsequentProducts);
        nextPage = "product_info.jsp";

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}