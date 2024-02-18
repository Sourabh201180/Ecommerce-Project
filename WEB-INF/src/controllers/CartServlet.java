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
import models.CartProduct;

@WebServlet("/cart.do")
public class CartServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException , ServletException{
        HttpSession session = request.getSession();
        
        String nextPage = "index.jsp";

        User user = (User)session.getAttribute("user");
        
        if(user != null) {         
            ArrayList<CartProduct> cartProducts = CartProduct.collectCartProducts(user.getUserId());
                
            session.setAttribute("cartProducts", cartProducts);

            nextPage = "cart.jsp";
        } else {
            
        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}