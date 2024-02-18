package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartProduct {
    private Integer cartProductId;
    private Integer quantity;
    private Product product;
    private Cart cart;

    public CartProduct() {

    }

    public boolean addToCart(Integer quantity, Integer productId,Integer cartId){
        boolean flag = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "insert into cart_products (quantity,product_id,cart_id) value (?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1,quantity);
            ps.setInt(2, productId);
            ps.setInt(3, cartId);

            int val = ps.executeUpdate();
            
            if(val == 1) {
                flag = true;                
            }
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public static ArrayList<CartProduct> collectCartProducts(Integer userId) {
        ArrayList<CartProduct> list = new ArrayList<CartProduct>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");
            
            String query = "select cp.cart_product_id, cp.quantity , p.product_id , p.name, p.mrp, p.small_desc,p.discount,p.user_id,c.cart_id,c.user_id from cart_products as cp inner join products as p inner join carts as c where cp.product_id=p.product_id and cp.cart_id=c.cart_id and c.user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt(3));
                p.setName(rs.getString(4));
                p.setMrp(rs.getInt(5));
                p.setSmallDesc(rs.getString(6));
                p.setDiscount(rs.getFloat(7));
                p.setUser(new User(rs.getInt(8)));
                
                Cart c = new Cart();
                c.setCartId(rs.getInt(9));
                c.setUser(new User(rs.getInt(10)));

                CartProduct cp = new CartProduct();
                cp.setCartProductId(rs.getInt(1));
                cp.setQuantity(rs.getInt(2));
                cp.setProduct(p);
                cp.setCart(c);
                
                list.add(cp);
            }
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Integer getCartProductId() {
        return cartProductId;
    }

    public void setCartProductId(Integer cartProductId) {
        this.cartProductId = cartProductId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}