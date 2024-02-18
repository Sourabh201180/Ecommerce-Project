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

@WebServlet("/show_seller_products_cards.do")
public class ShowSellerProductsCardsServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException , ServletException{
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        String nextPage = "index.jsp";

        Integer uId  =  Integer.parseInt(request.getParameter("uId"));

        if(user!=null) {
            ArrayList<Product> products = Product.collectAllProductsOfSeller(uId);
            
            request.setAttribute("products", products);

            nextPage = "seller_products.jsp";

        } else{

        }
        
        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}