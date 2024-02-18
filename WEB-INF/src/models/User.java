package models;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.jasypt.util.password.StrongPasswordEncryptor;

public class User {
    private Integer userId;
    private String name;
    // ##################
    // private Character gender;
    private String gender;
    private Date dob;
    // ##################
    private String contact;
    private String email;
    private String password;
    private String address;
    private City city;
    private String certificate;
    private Integer userType;
    private String pic;
    private String otp;
    private String about;
    private Status status;

    public static final Integer SELLER = 1;
    public static final Integer BUYER = 2;

    private static StrongPasswordEncryptor spe = new StrongPasswordEncryptor();

    public User() {

    }

    public User(Integer userId) {
        this.userId = userId;
    }

    public User(Integer userId, String name) {
        this.userId = userId;
        this.name = name;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(String name, String email, String password, String contact, String otp, Integer userType) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.otp = otp;
        this.userType = userType;
    }

    public User(Integer userId, String name, String gender, Date dob, String contact, String email, String address, String about) {
        this.userId = userId;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.contact = contact;
        this.email = email;
        this.address = address;
        this.about = about;
    }

    public int updateUser() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "update users set name=?, gender=?, dob=?, contact=?, email=?, address=?, about=? where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, gender);
            ps.setDate(3, dob);
            ps.setString(4, contact);
            ps.setString(5, email);
            ps.setString(6, address);
            ps.setString(7, about);
            ps.setInt(8, userId);

            ps.executeUpdate();
            
            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return userId;
    }

    public static User getUserInfo(Integer userId) {
        User user = new User();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select user_id, name, gender, dob, email, contact, address, about, certificate from users where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                user.userId = rs.getInt(1);
                user.name = rs.getString(2);
                user.gender = rs.getString(3);
                user.dob = rs.getDate(4);
                user.email = rs.getString(5);
                user.contact = rs.getString(6);
                user.address = rs.getString(7);
                user.about = rs.getString(8);
                user.certificate = rs.getString(9);
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return user;
    }

    public int getUserTypeByEmail() {
        int userT = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select * from users where email=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                userT = rs.getInt("user_type");
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return userT;
    }

    public int login() {
        int flag = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select * from users where email=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                String encryptedPassword = rs.getString("password"); 
                boolean f1 = spe.checkPassword(password, encryptedPassword);
                boolean f2 = rs.getInt("status_id") == Status.ACTIVE;
                if(f2) {
                    if(f1) {
                        userId = rs.getInt("user_id");
                        name = rs.getString("name");
                        contact = rs.getString("contact");
                        address = rs.getString("address");
                        certificate = rs.getString("certificate");
                        gender = rs.getString("gender");
                        dob = rs.getDate("dob");
                        pic = rs.getString("pic");
                        about = rs.getString("about");
                        
                        // city = new City(rs.getInt("city_id"));
                        status = Status.STATUS_ACTIVE;
                        flag = 1;
                    } //flag = 0 if password mismatch
                } else {
                    flag = rs.getInt("status_id");
                    // flag = status_id
                }
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public boolean saveUser() {
        boolean flag = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "";
            // because buyer doesn't have to upload certificate
            if(certificate == null) {   // buyer
                query = "insert into users (name, email, password, contact, address, city_id, user_type, pic, about, status_id) value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            } else {  
                query = "insert into users (name, email, password, contact, address, city_id, user_type, pic, about, status_id, certificate) value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            }

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, spe.encryptPassword(password));
            ps.setString(4, contact);
            ps.setString(5, address);
            ps.setInt(6, city.getCityId());
            ps.setInt(7, userType);
            ps.setString(8, pic);
            ps.setString(9, about);
            ps.setInt(10, Status.ACTIVE);
            if(certificate != null) {
                ps.setString(11, certificate);
            }

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

    public static String fetchUserProfileImage(Integer userId) {
        String imagePath = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sastadb?user=root&password=1523");

            String query = "select pic from users where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // public Character getGender() {
    //     return gender;
    // }

    // public void setGender(Character gender) {
    //     this.gender = gender;
    // }
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }
}