<%@page import="reserve.seat.SeatBookingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

SeatBookingDAO sbDAO = SeatBookingDAO.getInstance();
String screenCode = "scc001", seatCode="st001";

boolean flag = sbDAO.selectSeatStatus(screenCode, seatCode);

String result = "예약 불가능";

if(flag){
	result ="예약 가능";
}

out.print("자리 조회 결과 : "+ result);


%>