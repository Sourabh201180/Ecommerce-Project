package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import models.Cart;
import models.CartProduct;


@WebServlet("/add_to_cart.do")
public class AddToCartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        boolean flag = false;

        if(user != null) {
            Integer produtctId = Integer.parseInt(request.getParameter("pid"));
            
            CartProduct cartP = new CartProduct();
            Integer cartId = Cart.getCartId(user.getUserId());

            if(cartP.addToCart(1,produtctId,cartId)){
                flag = true;
            }
        } else{
            
        }
        
        response.getWriter().print(flag);
    }
}