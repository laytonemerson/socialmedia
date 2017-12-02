package edu.matc.persistence;

import java.util.Properties;
import javax.mail.*;    
import javax.mail.internet.*;

/**
 * This is the Mailer Class. It's used to transport the message from user to friend.
 *
 *@author lemerson
 */
public class Mailer{

    /**
     * Send an email using smtp.gmail
     *
     * @param from Who the email is from
     * @param password The password of the email account being used
     * @param to The recipient of the email
     * @param sub The subject of the email
     * @param msg The email body text
     *
     * @exception RuntimeException re - Any runtime exception encountered during the sending of the email.
     */
    public static void send(String from,String password,String to,String sub,String msg) {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, password);
                    }
                });

        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setText(msg);
            Transport.send(message);
        } catch (MessagingException re) {
            throw new RuntimeException(re);
        }

    }
}