<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MovieWithdraw.MovieWithdrawService"%>
<%
    request.setCharacterEncoding("UTF-8");
    String inputMethod = request.getParameter("inputMethod"); // "password" or "simple"
    String pass = request.getParameter("pass");
    
    // 현재 로그인된 ID 가져오기 (세션 등에서)
    // 테스트용 하드코딩: "test1"
    String userId = (String)session.getAttribute("userId");
    if(userId == null) userId = "test1"; 

    boolean isSuccess = false;
    
    // 단순 비밀번호 입력 방식일 때
    if(pass != null && !pass.isEmpty()) {
        MovieWithdrawService service = MovieWithdrawService.getInstance();
        isSuccess = service.loginCheck(userId, pass);
    }

    if(isSuccess) {
        // 검증 성공 시 세션에 플래그 저장
        session.setAttribute("authFlag", "true");
        // 다음 페이지(개인정보 수정)로 이동
        response.sendRedirect("mypage_withdraw2.jsp");
    } else {
%>
    <script>
        alert("비밀번호가 일치하지 않습니다.");
        history.back();
    </script>
<%
    }
%>
