package controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Product;
import models.SubCategory;
import models.User;

@WebServlet("/add_update_product.do")
public class AddUpdateProductServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("hey");
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        
        boolean flag = false;

        if(user != null) {
            Integer add_update = Integer.parseInt(request.getParameter("add_update"));
            // add_update = 1 => add
            // add_update = 2 => update

            System.out.println(1);
            
            String name = request.getParameter("product_name");
            System.out.println(name+"~");
            Integer quantity = Integer.parseInt(request.getParameter("product_quantity"));
            System.out.println(quantity+"~");
            Integer mrp = Integer.parseInt(request.getParameter("product_mrp"));
            System.out.println(mrp+"~");
            Float discount = Float.parseFloat(request.getParameter("product_discount"));
            System.out.println(discount+"~");
            Integer deliveryCharge = Integer.parseInt(request.getParameter("product_delivery_charge"));
            System.out.println(deliveryCharge+"~");
            Integer giftCharge = Integer.parseInt(request.getParameter("product_gift_charge"));
            System.out.println(giftCharge+"~");
            String smallDesc = request.getParameter("product_short_content");
            System.out.println(smallDesc+"~");
            String longDesc = request.getParameter("product_long_content");
            System.out.println(longDesc+"~");
            Integer productCategoryId = Integer.parseInt(request.getParameter("product_category1"));      // this we will not gone use
            System.out.println(productCategoryId+"~");
            Integer subCategoryId = Integer.parseInt(request.getParameter("product_sub_category1"));
            System.out.println(subCategoryId+"~");
            
            // System.out.println(name+"~"+quantity+"~"+mrp+"~"+discount+"~"+deliveryCharge+"~"+giftCharge+"~"+smallDesc+"~"+longDesc+"~"+productCategoryId+"~"+subCategoryId);
            
            SubCategory subCategory = new SubCategory(subCategoryId);
            System.out.println(2);
            
            Product product = new Product(name, quantity, mrp, discount, smallDesc, longDesc, giftCharge, deliveryCharge, user, subCategory);
            System.out.println(3);
            
            Integer prodId = 0;
            if(add_update == 1) {
                prodId = product.addProduct();
            } else {
                Integer prod_id = Integer.parseInt(request.getParameter("prod_id"));
                product.setProductId(prod_id);
                
                prodId = product.updateProduct();
            }
            
            String productId = Integer.toString(prodId);
            if(productId.length() > 0) {        
                System.out.println(1234);        
                String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/users/sellers/"+user.getEmail()+"/products");
                File file = new File(uploadPath, productId);         // esse hi kuch bhi likh diya hu dekh lena ek baar
                file.mkdir();

                String uploadPath2 = getServletContext().getRealPath("/WEB-INF/uploads/users/sellers/"+user.getEmail()+"/products/"+productId);
                File file2 = new File(uploadPath2, "pics");         // esse hi kuch bhi likh diya hu dekh lena ek baar
                file2.mkdir();

                flag = true;
            }

            Product prod = new Product(prodId);
            session.setAttribute("prod", prod);
        }
        System.out.println(4);

        response.getWriter().print(flag);
    }
}