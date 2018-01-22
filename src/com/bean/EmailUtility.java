package com.bean;
import com.connection.ConnectionBD;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailUtility {
    public static void sendEmail ( String host, String port,
                                 final String userName, final String password, Integer SIMNumber) throws AddressException,
            MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        String Email="";

        ConnectionBD Con = new ConnectionBD();
        Con.driver();
        Con.OpenConnexion();
        ResultSet rs= Con.selectExec("Select Email from Subscriber INNER JOIN Mobile ON  Mobile.Number='"+SIMNumber+"' AND Mobile.SubscriberRegistrationNumber=Subscriber.CIN" +
                "  UNION " +
                "Select Email from Subscriber INNER JOIN Landline ON  Landline.Number='"+SIMNumber+"' AND Landline.SubscriberRegistrationNumber=Subscriber.CIN");

        try {
            while(rs.next()) {
               Email =(rs.getString("Email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName,password);
            }
        };


        Session session = Session.getInstance(properties, auth);
        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = new InternetAddress[0];
        toAddresses = new InternetAddress[]{ new InternetAddress(Email) };

        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject("TelecomCompany Bill ");
        msg.setSentDate(new Date());

        ResultSet billSearch = Bill.SearchBill(SIMNumber);

        String text="";

        try {
            while(billSearch.next())
            {
                text =
                "SIM : "+billSearch.getString("SIMNumber")+"\n"+
                "Network Service: "+billSearch.getString("NetworkServiceType")+"\n"+
                "vocal Service: "+billSearch.getString("VocalServiceType")+"\n"+
                "unity number consumed : "+billSearch.getString("NumberUnityConsumed")+"\n"+
                "Bill Date: "+billSearch.getString("Date")+"\n"+
                "Total to pay: "+billSearch.getString("Total")+"\n"+
                "Expiration Date : "+billSearch.getString("ExpirationDate")+"\n";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }



        msg.setText(text);

        // sends the e-mail
        Transport.send(msg);
    }
}