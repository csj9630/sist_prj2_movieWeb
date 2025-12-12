package send.email;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/quickMail") // 버튼이 찾을 주소 이름
public class QuickMailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. 화면에서 보낸 이메일 주소 받기
        String email = request.getParameter("email");
        
        // 2. 아까 만든 자바 실행! (바로 실행됨)
        MailSender.runEmailSend(email);
        
        // 3. 끝났다고 응답
        response.getWriter().write("OK");
        System.out.println("servlet 동작");
    }
}