package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Review;
import models.User;

@WebServlet("/edit_review.do")
public class EditReviewServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if(user != null) {
            Integer reviewId = Integer.parseInt(request.getParameter("r_id"));
            Review uReview = Review.getReviewInfo(reviewId);
            
            Gson gson = new Gson();

            String resp = gson.toJson(uReview);

            response.getWriter().write(resp);
        } else{
            response.getWriter().print("[\"expired\"]");
        }
    }
}