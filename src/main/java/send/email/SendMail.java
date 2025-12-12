package send.email;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

    final String ENCODING = "UTF-8";
    final String PORT = "587"; // SSL/TLS 포트
    final String SMTPHOST = "smtp.gmail.com";
    String TO = ""; // 수신자 이메일 주소를 여기에 입력
    //final String TO = "tkdeod1234@naver.com"; // 수신자 이메일 주소를 여기에 입력

    /**
     * Session 셋팅
     * @param props
     * @param user_name
     * @param password (앱 비밀번호)
     * @return
     */
    public Session setting(Properties props, String user_name, String password, String TO) {
        
        Session session = null;
        this.TO = TO;
        try {
            // 메일 전송 프로토콜 설정
            props.put("mail.transport.protocol", "smtp");
            
            // SMTP 호스트 및 포트 설정 (465 = SSL/TLS)
            props.put("mail.smtp.host", SMTPHOST);
            props.put("mail.smtp.port", PORT);
            
            // 인증 및 SSL 설정
            props.put("mail.smtp.auth", true);
           // props.put("mail.smtp.ssl.enable", true); // SSL 사용
            props.put("mail.smtp.ssl.trust", SMTPHOST);
            
            //587포트 사용 추가
            props.put("mail.smtp.ssl.enable", "false"); // ⭐️ 465 설정이므로 반드시 'false'로
            props.put("mail.smtp.starttls.enable", "true"); // ⭐️ 587을 사용하려면 이 설정이 필수
            
            // SSL Handshake 오류 방지를 위한 프로토콜 명시
            props.put("mail.smtp.ssl.protocols", "TLSv1.2"); 
            
            // 기타 설정 (이미지에 포함된 내용) - 465포트 말고 딴거 사용
            //props.put("mail.smtp.quit-wait", "false");
           // props.put("mail.smtp.socketFactory.port", PORT);
           // props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
           // props.put("mail.smtp.socketFactory.fallback", "false");
            
            // 세션 인스턴스 생성 및 인증 정보 설정
            session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user_name, password);
                }
            });
            
            // 디버그 모드 활성화 (선택 사항: 실행 오류 시 상세 로그 확인용)
             //session.setDebug(true);

        } catch (Exception e) {
            System.out.println("Session Setting 실패");
            e.printStackTrace();
        }
        
        return session;
    }

    /**
     * 메시지 세팅 후 메일 전송
     * @param session
     * @param title
     * @param content
     */
    public void goMail(Session session, String title, String content, String senderEmail, String senderName) {
        
        if (session == null) {
            System.out.println("메일 전송 실패: Session이 유효하지 않습니다.");
            return;
        }

        Message msg = new MimeMessage(session);
        try {
            // 발신자 설정 (이름은 ENCODING 적용)
            msg.setFrom(new InternetAddress(senderEmail, senderName, ENCODING)); 
            
            // 수신자 설정 (TO: 클래스 상수)
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(TO));
            
            // 제목 및 내용 설정
            msg.setSubject(title);
            msg.setContent(content, "text/html; charset=" + ENCODING);

            Transport.send(msg); // 메일 전송
            
            System.out.println("메일 보내기 성공");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("메일 보내기 실패");
        }
    }

    // 메일 테스트를 위한 main 메소드 예시
	/*
	 * public static void main(String[] args) {
	 * 
	 * SendMail mailer = new SendMail(); Properties props = new Properties();
	 * 
	 * // ⭐️ 사용자 정보 설정 (반드시 Gmail 앱 비밀번호를 사용하세요) final String MY_EMAIL =
	 * "tkdeodlee@gmail.com"; final String APP_PASSWORD = "mijm bcea egca nfvv"; //
	 * 실제 앱 비밀번호 입력
	 * 
	 * // 1. Session 설정 Session mailSession = mailer.setting(props, MY_EMAIL,
	 * APP_PASSWORD);
	 * 
	 * // 2. 메일 전송 String title = "Java Mailer 테스트 제목입니다."; String content =
	 * "<h1 style='color: green;'>JavaMail 전송 성공!</h1><p>이 메일은 SMTP 테스트를 위해 발송되었습니다.</p>"
	 * ; String senderName = "관리자";
	 * 
	 * mailer.goMail(mailSession, title, content, MY_EMAIL, senderName); }
	 */
}
