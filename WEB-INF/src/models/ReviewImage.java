package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewImage {
    private Integer reviewImageId;
    private String image;
    private Review review;
    
    public ReviewImage() {

    }

    public static void addReviewMainImage(String pathToSave, Integer reviewId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "insert into review_images (image, review_id) value (?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, pathToSave);
            ps.setInt(2, reviewId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void addReviewMultipleImages(String fileNames, String uploadPath, Integer reviewId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "insert into review_images (image, review_id) value (?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            String[] images = fileNames.split(", ");
            System.out.println(images.length);
            ps.setInt(2, reviewId);
            
            for(String image : images) {
                ps.setString(1, uploadPath+"/"+image);
                ps.executeUpdate();
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<String> fetchAllReviewImages(Integer reviewId) {
        ArrayList<String> reviewImages = new ArrayList<String>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");
            
            String query = "select image from review_images where review_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, reviewId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                reviewImages.add(rs.getString(1));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return reviewImages;
    }

    public static String fetchMainReviewImage(Integer reviewId) {
        String imagePath = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select image from review_images where review_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, reviewId);

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

    public static void deleteReviewImages(Integer reviewId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "delete from review_images where review_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, reviewId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getReviewImageId() {
        return reviewImageId;
    }

    public void setReviewImageId(Integer reviewImageId) {
        this.reviewImageId = reviewImageId;
    }

    public Review getReview() {
        return review;
    }

    public void setReview(Review review) {
        this.review = review;
    }
}