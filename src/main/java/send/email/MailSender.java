package send.email;


import java.util.Properties;

// SendMail 클래스는 teamProject 패키지 또는 동일 패키지에 있어야 합니다.
// 여기서는 import 없이 MailTest 패키지 내에 있다고 가정하고 작성합니다.
// 만약 SendMail이 teamProject 패키지에 있다면: import teamProject.SendMail; 를 추가해야 합니다.
// 현재 이미지에는 SendMail이 MailTest 패키지에 있다고 가정합니다.

public class MailSender {

	public static void runEmailSend(String recipient) {
		 // ⭐️ 1. 실제 사용할 계정 정보와 내용을 설정합니다.
        // 발신자 이메일 주소 (Gmail 주소)
        String user_name = "testsist29@gmail.com"; 
        // 발신자 앱 비밀번호 (일반 비밀번호 대신 16자리 앱 비밀번호를 사용해야 합니다.)
        String password = "fwqi ereb pwfv rlrk"; 
        
        // 메일 내용 설정
        String j = "";
		for(int i = 0; i < 5; i++) {
			j+=String.valueOf((int)(Math.random() * 10));
		}
        String title = "2GV 비밀번호 찾기 인증 이메일";
        String content = j;
        
        // 발신자 이름 (goMail 메소드 인수로 필요)
        String senderName = "관리자"; 
        
        // 2. SendMail 인스턴스 생성
        SendMail sendMail = new SendMail();
        Properties props = new Properties(); // Properties 객체 생성
        
        // 3. Session을 설정하고 메일 전송
        // sendMail.goMail(Session session, String title, String content, String senderEmail, String senderName) 호출
        sendMail.goMail(
            sendMail.setting(props, user_name, password, recipient),
            title,
            content,
            user_name, // 발신자 이메일
            senderName // 발신자 이름
        );
        // 전송 완료 후 추가적인 메시지 출력이 필요하다면 여기에 작성
	}
	
    public static void main(String[] args) {
    }
}
