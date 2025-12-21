<%@page import="announcement.AnnouncementDTO"%>
<%@page import="announcement.AnnouncementService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../fragments/siteProperty.jsp" %>

<%
    // 1. 파라미터 확인
    String numStr = request.getParameter("num");
    
    if(numStr == null || numStr.isEmpty()) {
        response.sendRedirect("notice_list.jsp");
        return;
    }
    
    int num = Integer.parseInt(numStr);
    AnnouncementService as = AnnouncementService.getInstance();
    
    // 2. 조회수 증가
    as.modifyAnnounceViews(num);
    
    // 3. 상세 데이터 조회
    AnnouncementDTO ann = as.searchOneAnnouncement(num);
    
    if(ann == null) {
        out.println("<script>alert('삭제되었거나 존재하지 않는 게시물입니다.'); history.back();</script>");
        return;
    }
    
    pageContext.setAttribute("ann", ann);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../../fragments/header_meta.jsp" %> 
    <link rel="stylesheet" href="${commonURL}/resources/css/megabox.min.css" media="all"/>
</head>
<body>
    <div class="body-wrap">
        <header id="header">
            <jsp:include page="../../fragments/header.jsp"/>
        </header>
        
        <div id="container" class="container">
            <div class="page-util">
                <div class="inner-wrap">
                    <div class="location">
                        <span>Home</span>
                        <a href="notice_list.jsp" title="공지사항 페이지로 이동">공지사항</a>
                    </div>
                </div>
            </div>
            
            <div class="inner-wrap">
                <div id="contents">
                    <h2 class="tit">공지사항</h2>
                    <div class="table-wrap">
                        <div class="board-view">
                            <div class="tit-area">
                                <p class="tit">${ann.announce_name}</p>
                            </div>
                            <div class="info">
                                <p>
                                    <span class="tit">구분</span>
                                    <span class="txt">공지</span>
                                </p>
                                <p>
                                    <span class="tit">등록일</span>
                                    <span class="txt">
                                        <fmt:formatDate value="${ann.announce_date}" pattern="yyyy.MM.dd"/>
                                    </span>
                                </p>
                                <p>
                                    <span class="tit">조회수</span>
                                    <span class="txt">${ann.announce_views}</span>
                                </p>
                            </div>

                            <div class="cont">
                                ${ann.announce_content}
                            </div>
                        </div>
                    </div>

                    <div class="prev-next">
                        <div class="line prev">
                            <p class="tit">이전</p>
                            <p class="link">이전 글이 없습니다.</p>
                        </div>
                        <div class="line next">
                            <p class="tit">다음</p>
                            <p class="link">다음 글이 없습니다.</p>
                        </div>
                    </div>
                    
                    <div class="btn-group pt40">
                        <a href="notice_list.jsp" class="button large listBtn" title="목록">목록</a>
                    </div>
                </div>
            </div>
        </div>
        
        <footer id="footer">
            <jsp:include page="../../fragments/footer.jsp"></jsp:include>
        </footer>
    </div>
</body>
</html>