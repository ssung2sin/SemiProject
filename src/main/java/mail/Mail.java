package mail;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
    public static void send(String sendEmail, String ranNum) {
        // Gmail 계정 정보
        final String username = "sist0615lee@gmail.com";
        final String password = "uodi jxav icid fqpt";

        // 속성 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // 세션 생성
        Session session = Session.getInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

        try {
            // 메시지 생성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendEmail));
            message.setSubject("휴고 휴면계정 안내 메일입니다.");
            message.setText("인증번호 : "+ranNum);

            // 메시지 전송
            Transport.send(message);

            System.out.println("이메일 전송 완료!");

        } catch (MessagingException e) {
            e.printStackTrace();
            System.err.println("이메일 전송 실패: " + e.getMessage());
        }
    }
}