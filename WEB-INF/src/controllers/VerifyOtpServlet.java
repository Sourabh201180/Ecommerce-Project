package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import utils.EmailSender;
import utils.EmailTemplate;

@WebServlet("/verify_otp.do")
public class VerifyOtpServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        // we have stored user info in session scope so, we are just accessig it
        User user = (User)session.getAttribute("user");

        // otp entered by the users
        String otp = request.getParameter("otp");
        System.out.println(otp);

        String resp = "false";

        // here we are checking the otp entered by the user matches the otp generated
        if(otp.equals(user.getOtp())) {
            resp = "true";

            String message = "";
            if(user.getUserType() == 1) {
                message = EmailTemplate.getSignupSuccessMessageSeller(user.getName(), user.getEmail(), otp);
            } else {
                message = EmailTemplate.getSignupSuccessMessageBuyer(user.getName(), user.getEmail(), otp);
            }
            String subject = "Account Verification Mail";

            EmailSender.sendEmail(user.getEmail(), subject, message);
        }

        response.getWriter().write(resp);
    }
}