package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.SubCategory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import com.google.gson.Gson;

@WebServlet("/fetch_all_sub_category.do")
public class FetchAllSubsequentSubCategoryServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer categoryId = Integer.parseInt(request.getParameter("category_id"));

        ArrayList<SubCategory> subCategories = (ArrayList<SubCategory>)getServletContext().getAttribute("subCategories");
        ArrayList<SubCategory> subCatz = new ArrayList<>();

        Iterator<SubCategory> itr = subCategories.iterator();
        while(itr.hasNext()) {
            SubCategory subCategory = itr.next();
            if(subCategory.getCategory().getCategoryId() == categoryId) {
                subCatz.add(subCategory);
            }
        }

        Gson gson = new Gson();
        String resp = gson.toJson(subCatz);
        
        response.getWriter().write(resp);
    }
}