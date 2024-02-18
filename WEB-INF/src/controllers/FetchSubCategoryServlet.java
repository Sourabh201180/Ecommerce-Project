package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.SubCategory;

import java.io.IOException;

import com.google.gson.Gson;

@WebServlet("/fetch_sub_category.do")
public class FetchSubCategoryServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer subCategoryId = Integer.parseInt(request.getParameter("scid"));
        
        SubCategory subCategory = SubCategory.getSubCategoryInfo(subCategoryId);

        Gson gson = new Gson();
        String resp = gson.toJson(subCategory);

        response.getWriter().write(resp);
    }
}