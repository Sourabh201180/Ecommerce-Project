package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.User;

@WebServlet("/fetch_user_info.do")
public class FetchUserInfoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if(user != null) {
            Integer userId = Integer.parseInt(request.getParameter("uid"));
            User user1 = User.getUserInfo(userId);

            Gson gson = new Gson();

            String resp = gson.toJson(user1);

            response.getWriter().write(resp);
        } else{
            response.getWriter().print("[\"expired\"]");
        }
    }
}