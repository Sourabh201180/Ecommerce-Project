package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SubCategory {
    private Integer subCategoryId;
    private String subCategory;
    private Category category;

    public SubCategory() {
        super();
    }

    public SubCategory(Integer subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public SubCategory(Integer subCategoryId, String subCategory) {
        this.subCategoryId = subCategoryId;
        this.subCategory = subCategory;
    }

    public SubCategory(Integer subCategoryId, String subCategory, Category category) {
        this.subCategoryId = subCategoryId;
        this.subCategory = subCategory;
        this.category = category;
    }

    public static SubCategory getSubCategoryInfo(Integer subCategoryId) {
        SubCategory subCategory = new SubCategory();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select sub_category_id, name, category_id from sub_categories where sub_category_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, subCategoryId);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                subCategory.subCategoryId = rs.getInt(1);
                subCategory.subCategory = rs.getString(2);
                subCategory.category = new Category(rs.getInt(3));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return subCategory;
    }

    public static ArrayList<SubCategory> collectAllSubCategories() {
        ArrayList<SubCategory> subCategories = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select sub_category_id, s.name, s.category_id, c.name from sub_categories as s inner join categories as c where s.category_id=c.category_id";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                subCategories.add(new SubCategory(rs.getInt(1), rs.getString(2), new Category(rs.getInt(3), rs.getString(4))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return subCategories;
    }

    public static ArrayList<SubCategory> CollectAllSubsequentSubCategories(Integer categoryId) {
        ArrayList<SubCategory> subCategories = new ArrayList<SubCategory>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select sub_category_id, s.name, s.category_id, c.name from sub_categories as s inner join categories as c where s.category_id=c.category_id and s.category_id=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                subCategories.add(new SubCategory(rs.getInt(1), rs.getString(2), new Category(rs.getInt(3), rs.getString(4))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return subCategories;
    }

    public Integer getSubCategoryId() {
        return subCategoryId;
    }
    public void setSubCategoryId(Integer subCategoryId) {
        this.subCategoryId = subCategoryId;
    }
    public String getSubCategory() {
        return subCategory;
    }
    public void setSubCategory(String subCategory) {
        this.subCategory = subCategory;
    }
    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }
}