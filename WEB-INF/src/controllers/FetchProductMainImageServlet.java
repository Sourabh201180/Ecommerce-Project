// package controllers;

// import java.io.IOException;
// import java.util.ArrayList;

// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
// import javax.servlet.http.HttpSession;

// import models.User;

// import com.google.gson.Gson;

// import models.ProductImage;

// @WebServlet("/fetch_product_main_image.do")
// public class FetchProductMainImageServlet extends HttpServlet {
//     public void doGet(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
//         HttpSession session = request.getSession();

//         User user = (User)session.getAttribute("user");

//         Integer productId = Integer.parseInt(request.getParameter("product_id"));

//         // String productMainImage = ProductImage.fetchMainProductImage(productId, user.getEmail());
//         System.out.println("productMainImage = "+productMainImage);

//         Gson gson = new Gson();

//         String resp = gson.toJson(productMainImage);

//         response.getWriter().write(resp);
//     }  
// }