<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../fragments/siteProperty.jsp"%>
<%
	//모든 세션 삭제
    session.invalidate();
	
	String commonURL = (String)application.getAttribute("commonURL");
	
    //메인 페이지로 이동
    response.sendRedirect( commonURL+"/user/main/index.jsp");
%>
