package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Product;
import models.User;

@WebServlet("/edit_product.do")
public class EditProductServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if(user != null) {
            Integer produtctId = Integer.parseInt(request.getParameter("pid"));
            Product uProduct = Product.getProductInfo(produtctId);

            Gson gson = new Gson();

            String resp = gson.toJson(uProduct);

            response.getWriter().write(resp);
        } else{
            response.getWriter().print("[\"expired\"]");
        }
    }
}






// package controllers;

// import java.io.IOException;

// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

// import models.Product;
// // import models.ProductImage;
// import models.User;

// @WebServlet("/edit_product.do")
// public class EditProductServlet extends HttpServlet {
//     public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//         HttpSession session = request.getSession();
//         User user = (User)session.getAttribute("user");

//         boolean flag = false;

//         if(user != null) {
//             Integer produtctId = Integer.parseInt(request.getParameter("pid"));
//             Product uProduct = Product.getProductInfo(produtctId);

//             // 
//             System.out.println(uProduct.getName());
//             // 

//             session.setAttribute("uProduct", uProduct);

//             System.out.println(uProduct);
//             flag = true;
//         } else{

//         }
        
//         response.getWriter().print(flag);
//     }
// }