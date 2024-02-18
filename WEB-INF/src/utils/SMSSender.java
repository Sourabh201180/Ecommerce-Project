package utils;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SMSSender {
    public static final String ACCOUNT_SID = "AC97be4e221ca7e706ef632615f3fc6108";
    public static final String AUTH_TOKEN = "dffbd0063e902df41e92e03bc4d4d022";
    public static final String fromPhone = "+18176314387";

    public static void sendSMS(String toPhone, String msg) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Message message = Message.creator(
                            new com.twilio.type.PhoneNumber("+91"+toPhone),
                            new com.twilio.type.PhoneNumber(fromPhone),
                            msg
                        ).create();
        
        System.out.println(message.getSid());
    }
}