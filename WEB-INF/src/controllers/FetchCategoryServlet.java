package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Category;

import java.io.IOException;

import com.google.gson.Gson;

@WebServlet("/fetch_category.do")
public class FetchCategoryServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer categoryId = Integer.parseInt(request.getParameter("cid"));
        
        Category category = Category.getCategoryInfo(categoryId);

        Gson gson = new Gson();
        String resp = gson.toJson(category);

        response.getWriter().write(resp);
    }
}