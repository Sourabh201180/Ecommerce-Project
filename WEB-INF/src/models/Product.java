package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Product {
    private Integer productId;
    private String name;
    private Integer quantity;
    private Integer mrp;
    private Float discount;
    private String smallDesc;
    private String longDesc;
    private Integer giftCharge;
    private Integer deliveryCharge;
    private User user;
    private SubCategory subCategory;
    private Status status;
    
    public Product() {
        super();
    }

    public Product(Integer productId) {
        this.productId = productId;
    }

    public Product(Integer productId, String name) {
        this.productId = productId;
        this.name = name;
    }

    public Product(String name, Integer quantity, Integer mrp, Float discount, String smallDesc, String longDesc, Integer giftCharge, Integer deliveryCharge, User user, SubCategory subCategory, Status status) {
        this.name = name;
        this.quantity = quantity;
        this.mrp = mrp;
        this.discount = discount;
        this.smallDesc = smallDesc;
        this.longDesc = longDesc;
        this.giftCharge = giftCharge;
        this.deliveryCharge = deliveryCharge;
        this.user = user;
        this.subCategory = subCategory;
        this.status = status;
    }
    
    public Product(Integer productId, String name, Integer quantity, Integer mrp, Float discount, String smallDesc, String longDesc, Integer giftCharge, Integer deliveryCharge, SubCategory subCategory, Status status) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.mrp = mrp;
        this.discount = discount;
        this.smallDesc = smallDesc;
        this.longDesc = longDesc;
        this.giftCharge = giftCharge;
        this.deliveryCharge = deliveryCharge;
        this.subCategory = subCategory;
        this.status = status;
    }

    public Product(String name, Integer quantity, Integer mrp, Float discount, String smallDesc, String longDesc, Integer giftCharge, Integer deliveryCharge, User user, SubCategory subCategory) {
        this.name = name;
        this.quantity = quantity;
        this.mrp = mrp;
        this.discount = discount;
        this.smallDesc = smallDesc;
        this.longDesc = longDesc;
        this.giftCharge = giftCharge;
        this.deliveryCharge = deliveryCharge;
        this.user = user;
        this.subCategory = subCategory;
    }

    public Product(Integer productId, String name, Integer quantity, Integer mrp, Float discount, String smallDesc, String longDesc, Integer giftCharge, Integer deliveryCharge, User user, SubCategory subCategory, Status status) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.mrp = mrp;
        this.discount = discount;
        this.smallDesc = smallDesc;
        this.longDesc = longDesc;
        this.giftCharge = giftCharge;
        this.deliveryCharge = deliveryCharge;
        this.user = user;
        this.subCategory = subCategory;
        this.status = status;
    }

    public int addProduct() {
        int productId = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "insert into products (name, quantity, mrp, discount, small_desc, long_desc, gift_charges, delivery_charges, user_id, sub_category_id, status_id) value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, name);
            ps.setInt(2, quantity);
            ps.setInt(3, mrp);
            ps.setFloat(4, discount);
            ps.setString(5, smallDesc);
            ps.setString(6, longDesc);
            ps.setInt(7, giftCharge);
            ps.setInt(8, deliveryCharge);
            ps.setInt(9, user.getUserId());
            ps.setInt(10, subCategory.getSubCategoryId());
            ps.setInt(11, Status.AVAILABLE);

            int val = ps.executeUpdate();
            
            if(val == 1) {
                ResultSet rs = ps.getGeneratedKeys();
                if(rs.next()) {
                    productId = rs.getInt(1);
                }
            }
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return productId;
    }

    public int updateProduct() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "update products set name=?, quantity=?, mrp=?, discount=?, small_desc=?, long_desc=?, gift_charges=?, delivery_charges=?, sub_category_id=? where product_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setInt(2, quantity);
            ps.setInt(3, mrp);
            ps.setFloat(4, discount);
            ps.setString(5, smallDesc);
            ps.setString(6, longDesc);
            ps.setInt(7, giftCharge);
            ps.setInt(8, deliveryCharge);
            ps.setInt(9, subCategory.getSubCategoryId());
            ps.setInt(10, productId);

            ps.executeUpdate();
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return productId;
    }
    
    public static ArrayList<Product> collectAllProductsOfSeller(Integer userId) {
        ArrayList<Product> products = new ArrayList<Product>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");
            
            String query = "select * from products where user_id=? limit 5";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                products.add(new Product(rs.getInt("product_id"), rs.getString("name"), rs.getInt("quantity"), rs.getInt("mrp"), rs.getFloat("discount"), rs.getString("small_desc"), rs.getString("long_desc"), rs.getInt("gift_charges"), rs.getInt("delivery_charges"), new User(rs.getInt("user_id")), new SubCategory(rs.getInt("sub_category_id")), new Status(rs.getInt("status_id"))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return products;
    }

    public static ArrayList<Product> collectAllProducts() {
        ArrayList<Product> products = new ArrayList<Product>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");
            
            String query = "select * from products";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                products.add(new Product(rs.getInt("product_id"), rs.getString("name"), rs.getInt("quantity"), rs.getInt("mrp"), rs.getFloat("discount"), rs.getString("small_desc"), rs.getString("long_desc"), rs.getInt("gift_charges"), rs.getInt("delivery_charges"), new User(rs.getInt("user_id")), new SubCategory(rs.getInt("sub_category_id")), new Status(rs.getInt("status_id"))));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return products;
    }

    public static void deleteProduct(Integer productId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "delete from products where product_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, productId);

            ps.executeUpdate();

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Product getProductInfo(Integer productId) {
        Product product = new Product();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select product_id, name, quantity, mrp, discount, small_desc, long_desc, gift_charges, delivery_charges, sub_category_id from products where product_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                product.productId = rs.getInt(1);
                product.name = rs.getString(2);
                product.quantity = rs.getInt(3);
                product.mrp = rs.getInt(4);
                product.discount = rs.getFloat(5);
                product.smallDesc = rs.getString(6);
                product.longDesc = rs.getString(7);
                product.giftCharge = rs.getInt(8);
                product.deliveryCharge = rs.getInt(9);
                product.subCategory = new SubCategory(rs.getInt(10));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return product;
    }

    public static ArrayList<Product> getAllSubsequentProducts(Integer subCategoryId) {
        ArrayList<Product> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select product_id, name, quantity, mrp, discount, small_desc, long_desc, gift_charges, delivery_charges from products where sub_category_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, subCategoryId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Product product = new Product();

                product.productId = rs.getInt(1);
                product.name = rs.getString(2);
                product.quantity = rs.getInt(3);
                product.mrp = rs.getInt(4);
                product.discount = rs.getFloat(5);
                product.smallDesc = rs.getString(6);
                product.longDesc = rs.getString(7);
                product.giftCharge = rs.getInt(8);
                product.deliveryCharge = rs.getInt(9);
                // product.subCategory = new SubCategory(rs.getInt(10));

                list.add(product);
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return list;
    }

    public Integer getProductId() {
        return productId;
    }
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public Integer getQuantity() {
        return quantity;
    }
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getMrp() {
        return mrp;
    }
    public void setMrp(Integer mrp) {
        this.mrp = mrp;
    }

    public Float getDiscount() {
        return discount;
    }
    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public String getSmallDesc() {
        return smallDesc;
    }
    public void setSmallDesc(String smallDesc) {
        this.smallDesc = smallDesc;
    }

    public String getLongDesc() {
        return longDesc;
    }
    public void setLongDesc(String longDesc) {
        this.longDesc = longDesc;
    }

    public Integer getGiftCharge() {
        return giftCharge;
    }
    public void setGiftCharge(Integer giftCharge) {
        this.giftCharge = giftCharge;
    }

    public Integer getDeliveryCharge() {
        return deliveryCharge;
    }
    public void setDeliveryCharge(Integer deliveryCharge) {
        this.deliveryCharge = deliveryCharge;
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    public SubCategory getSubCategory() {
        return subCategory;
    }
    public void setSubCategory(SubCategory subCategory) {
        this.subCategory = subCategory;
    }

    public Status getStatus() {
        return status;
    }
    public void setStatus(Status status) {
        this.status = status;
    }
}