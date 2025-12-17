<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="screenInfo.ScreenInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="screenInfo.ScreenInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");

String date=request.getParameter("date");
String movieCode=request.getParameter("movieCode");

ScreenInfoService sis=ScreenInfoService.getInstance();
List<ScreenInfoDTO> list=sis.getMovieSchedule(date, movieCode);

JSONArray jsonArr=new JSONArray();

for(ScreenInfoDTO siDTO:list) {
	JSONObject obj = new JSONObject();
    obj.put("screen_open", sdf.format(siDTO.getScreen_open()));
    obj.put("screen_end", sdf.format(siDTO.getScreen_end()));
    obj.put("movie_name", siDTO.getmDTO().getMoviename());
    jsonArr.add(obj);
}
System.out.print(jsonArr.toString());
out.print(jsonArr.toString());
%>