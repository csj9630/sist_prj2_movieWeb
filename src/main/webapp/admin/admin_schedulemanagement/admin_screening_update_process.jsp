<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.screening_admin.ScreeningDTO" %>
<%@ page import="movie.admin.AdminScreeningService" %>

<%
    request.setCharacterEncoding("UTF-8");

    String screenCode = request.getParameter("screen_code");
    String movieCode = request.getParameter("movie_code");
    String theaterNum = request.getParameter("theater_num");
    String screenDate = request.getParameter("screen_date");
    String screenTime = request.getParameter("screen_time");

    ScreeningDTO dto = new ScreeningDTO();
    dto.setScreenCode(screenCode);
    dto.setMovieCode(movieCode);
    dto.setTheaterNum(theaterNum);
    dto.setScreenDate(screenDate);
    dto.setScreenTime(screenTime);

    AdminScreeningService service = AdminScreeningService.getInstance();
    int result = service.modifyScreening(dto);

    String msg = "";
    String url = "Admin_ScreeningList.jsp";

    if(result == 1) {
        msg = "상영 스케줄이 수정되었습니다.";
    } else if(result == -2) {
        msg = "이미 예매된 내역이 있어 수정할 수 없습니다.";
        url = "history.back()";
    } else {
        msg = "수정에 실패했습니다. 잠시 후 다시 시도해주세요.";
        url = "history.back()";
    }
%>
<script type="text/javascript">
    alert("<%= msg %>");
    <% if("history.back()".equals(url)) { %>
        history.back();
    <% } else { %>
        location.href = "<%= url %>";
    <% } %>
</script>