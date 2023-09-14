package mail;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {

    // 구글 이메일
    static final String user_email= "sist0615lee@gmail.com";
    // 구글 비번
    static final String user_pw = "enmv vmti kayj lpdo";
    
    static final String smtp_host = "smtp.gmail.com";
    static final int smtp_port = 465;  // TLS : 587, SSL : 465

    public static void Send(String email,String ranNum) throws Exception {
    	System.setProperty("jdk.tls.client.protocols", "TLSv1.2");
        Properties props = System.getProperties();
        props.put("mail.smtp.host", smtp_host); 
        props.put("mail.smtp.port", smtp_port); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.ssl.enable", "true"); 
        props.put("mail.smtp.ssl.trust", smtp_host);
        props.put("mail.smtp.ssl.socketFactory", "javax.net.ssl.SSLSocketFactory");
        
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user_email, user_pw);
                    }
                });
        
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user_email));

           // 받는 이메일
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)    
            );
	
	  // 제목
            message.setSubject("휴고 인증메일 입니다."); 
	  
	   // 내용
            message.setText("인증번호 : "+ranNum);

            // 발송
            Transport.send(message);
            
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
}