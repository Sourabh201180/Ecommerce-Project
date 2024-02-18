package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductImage {
    private Integer productImageId;
    private String image;
    private Product product;
    
    public ProductImage() {

    }

    public static void addProductMainImage(String pathToSave, Integer productId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "insert into product_images (image, product_id) value (?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, pathToSave);
            ps.setInt(2, productId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void addProductMultipleImages(String fileNames, String uploadPath, Integer productId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "insert into product_images (image, product_id) value (?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            String[] images = fileNames.split(", ");
            System.out.println(images.length);
            ps.setInt(2, productId);
            
            for(String image : images) {
                ps.setString(1, uploadPath+"/"+image);
                ps.executeUpdate();
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<String> fetchAllProductImages(Integer productId) {
        ArrayList<String> productImages = new ArrayList<String>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");
            
            String query = "select image from product_images where product_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                productImages.add(rs.getString(1));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return productImages;
    }

    public static String fetchMainProductImage(Integer productId) {
        String imagePath = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select image from product_images where product_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                imagePath = (String)rs.getString(1);
                break;
            }
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return imagePath;
    }

    public static void deleteProductImages(Integer productId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "delete from product_images where product_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, productId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Integer getProductImageId() {
        return productImageId;
    }
    public void setProductImageId(Integer productImageId) {
        this.productImageId = productImageId;
    }

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }
}