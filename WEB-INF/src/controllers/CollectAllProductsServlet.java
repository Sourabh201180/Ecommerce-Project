package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import models.Product;

@WebServlet("/collect_all_products.do")
public class CollectAllProductsServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException , ServletException{
        HttpSession session = request.getSession();

        Integer type = Integer.parseInt(request.getParameter("type"));
        
        String nextPage = "index.jsp";
        
        if(type == 1) {         // type 0 => home page, type 1 => logged in user //
            User user = (User)session.getAttribute("user");

            if(user!=null) {
                ArrayList<Product> products = Product.collectAllProducts();
                
                request.setAttribute("products", products);

                nextPage = "user_dashboard.jsp";
            } else{
                
            }
        } else {
            ArrayList<Product> products = Product.collectAllProducts();
                
            request.setAttribute("products", products);
        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }
}