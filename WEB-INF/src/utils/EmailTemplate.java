package utils;

public class EmailTemplate {
    public static String getSignupSuccessMessageSeller(String name, String email, String otp) {
        String message = "<h2>Hello "+name+"</h2>"+
                         "<h1>Welcome to Sasta Wala,</h1>"+
                         "<H3>Your Account is created as Seller Account...</H3>"+
                         "<H3>You are now be the part of our Carrers Seller Community...</H3>"+
                         "<p>Click over the link to activate your account:"+
                         " <a href='http://localhost:8080/ecommerce_21/signup_verify.do?email="+email+"&otp="+otp+"'>Activation Link</a></p>";

        return message;
    }

    public static String getSignupSuccessMessageBuyer(String name, String email, String otp) {
        String message = "<h2>Hello "+name+"</h2>"+
                         "<h1>Welcome to Sasta Wala,</h1>"+
                         "<H3>Your Account is created...</H3>"+
                         "<p>Click over the link to activate your account:"+
                         " <a href='http://localhost:8080/ecommerce_21/signup_verify.do?email="+email+"&otp="+otp+"'>Activation Link</a></p>";

        return message;
    }
}