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

@WebServlet("/seller_products.do")
public class SellerProductsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        String nextPage = "index.jsp";
        if(user != null) {
            ArrayList<Product> products = Product.collectAllProductsOfSeller(user.getUserId());

            request.setAttribute("products", products);

            nextPage = "seller_products.jsp";
        } else {

        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}