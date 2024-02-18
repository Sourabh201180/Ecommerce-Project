package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Review;
import models.User;

@WebServlet("/product_reviews.do")
public class ProductReviewsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        // User user = (User)session.getAttribute("user");
        String nextPage = "index.jsp";

        Integer productId = Integer.parseInt(request.getParameter("productId"));
        
        // if(user != null) {
            ArrayList<Review> reviews = Review.collectAllProductReviews(productId);

            request.setAttribute("reviews", reviews);

            nextPage = "product_info.jsp";
        // } else {

        // }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}