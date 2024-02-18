package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import utils.SMSSender;
import utils.SMSTemplates;
import utils.Utility;

import java.io.*;

import models.User;

@WebServlet("/signup_step_1.do")
public class SignupStepOneServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Integer userType = Integer.parseInt(request.getParameter("golu"));

        session.setAttribute("userT", userType);
        response.getWriter().print(true);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String gResponse = request.getParameter("g-recaptcha-response");
        
        if(Utility.isHuman(gResponse)) {
            System.out.println(2);
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");

            // generating the otp, which will be send through phone number
            String otp = Utility.generateOTP();
            System.out.println(otp);
            
            Integer userT = (Integer)session.getAttribute("userT");

            User user = new User(name, email, password, contact, otp, userT);
            System.out.println(name+"~~~"+email+"~~"+password+"~~"+contact+"~~"+otp+"~~"+userT);

            session.setAttribute("user", user);
            
            // creating folder with email
            String uploadPath = "";
            String fName = "";
            String fName1 = "";
            if(userT == 1) {
                uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/sellers");  
                fName = "products";  
                fName1 = "certificates";  
            } else {
                uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/buyers");    
                fName = "carts";  
            }
            
            // creating folder with their email
            File file1 = new File(uploadPath, email);
            file1.mkdir(); 

            // creating folder products or carts on the basis of user types
            File file = new File(uploadPath, email+"/"+fName);
            file.mkdir(); 
            // for making certificates folder
            if(userT==1) {
                File file2 = new File(uploadPath, email+"/"+fName1);
                file2.mkdir(); 
            }
            
            // getting the otp on phone number
            String smsMessage = SMSTemplates.getSignupMobileVerificationMessage(name, otp);
            // SMSSender.sendSMS(contact, smsMessage);
            
            response.sendRedirect("signup_step_2.jsp");
        }
    }
}