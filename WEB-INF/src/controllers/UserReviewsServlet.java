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

@WebServlet("/user_reviews.do")
public class UserReviewsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        String nextPage = "index.jsp";

        if(user != null) {
            ArrayList<Review> reviews = Review.collectAllUserReviews(user.getUserId());

            request.setAttribute("reviews", reviews);

            nextPage = "user_reviews.jsp";
        } else {

        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}