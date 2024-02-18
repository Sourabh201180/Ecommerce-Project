package listeners;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import models.Category;
import models.City;
import models.SubCategory;
import utils.EmailSender;
import utils.Utility;

public class AppListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent e) {
        ServletContext context = e.getServletContext();

        // for saving the host, port in the application scope so, these are loaded only once at the time of starts
        Utility.secretKey = context.getInitParameter("secret_key");
        String smtpHost = context.getInitParameter("smtp_host");
        String smtpPort = context.getInitParameter("smtp_port");

        EmailSender.setProperties(smtpHost, smtpPort);
        
        // for showing the cities with same initials
        ArrayList<City> cities = City.collectAllCities();
        context.setAttribute("cities", cities);

        // for showing all the categories
        ArrayList<Category> categories = Category.collectAllCategories();
        context.setAttribute("categories", categories);
        
        // for showing all the subCategories
        ArrayList<SubCategory> subCategories = SubCategory.collectAllSubCategories();
        context.setAttribute("subCategories", subCategories);
    }

    public void contextDestroyed(ServletContextEvent e) {

    }
}