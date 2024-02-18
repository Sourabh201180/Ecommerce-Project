package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.City;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import com.google.gson.Gson;

@WebServlet("/search_city.do")
public class SearchCityServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String prefix = request.getParameter("city").toLowerCase();

        ArrayList<City> cities = (ArrayList<City>)getServletContext().getAttribute("cities");
        ArrayList<City> ctz = new ArrayList<>();

        Iterator<City> itr = cities.iterator();
        while(itr.hasNext()) {
            City ct = itr.next();
            if(ct.getCity().toLowerCase().startsWith(prefix)) {
                ctz.add(ct);
            }
        }

        Gson gson = new Gson();
        String resp = gson.toJson(ctz);
        
        response.getWriter().write(resp);
    }
}