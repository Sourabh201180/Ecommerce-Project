package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

// same url for both buyer and seller
// we will differentiate on the basis of their email and type...
@WebServlet("/login.do")
public class UserLoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(email, password);

        String nextPage = "index.jsp";
        int result = user.login();
        int userT = user.getUserTypeByEmail();
        user.setUserType(userT);

        switch(result) {
            case 1:
                nextPage = "user_dashboard.jsp";
                break;
            case 2: 
                nextPage = "index.jsp";
                break;
            default:
        }

        session.setAttribute("user", user);
            
        request.getRequestDispatcher("collect_all_products.do?type=1").forward(request, response);
    }
}