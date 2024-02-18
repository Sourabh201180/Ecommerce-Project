package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.SubCategory;

@WebServlet("/category_cards.do")
public class CategoryCardsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        Integer cId = Integer.parseInt(request.getParameter("cId"));

        ArrayList<SubCategory> subCats = SubCategory.CollectAllSubsequentSubCategories(cId);
        session.setAttribute("subCats", subCats);
        System.out.println(subCats);
        
        request.getRequestDispatcher("category_cards.jsp").forward(request, response);
    }  
}