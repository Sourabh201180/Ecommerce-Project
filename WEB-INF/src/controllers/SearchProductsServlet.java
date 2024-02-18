package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
 
import com.google.gson.Gson;

@WebServlet("/search_products.do")
public class SearchProductsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        String prefix = request.getParameter("srch_prod").toLowerCase();

        ArrayList<Product> products = Product.collectAllProducts();
        ArrayList<Product> prods = new ArrayList<>();

        Iterator<Product> itr = products.iterator();
        while(itr.hasNext()) {
            Product prod = itr.next();
            // if(prod.getName().toLowerCase().startsWith(prefix)) {
            if(prod.getName().toLowerCase().contains(prefix)) {
                prods.add(prod);
            }
        }

        session.setAttribute("prods", prods);

        Gson gson = new Gson();
        String resp = gson.toJson(prods);
        
        response.getWriter().write(resp);
    }
}