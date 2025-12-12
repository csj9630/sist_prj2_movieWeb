<%@page import="movie.trailer.TrailerDTO"%>
<%@page import="movie.trailer.TrailerService"%>
<%@page import="movie.image.ImageDTO"%>
<%@page import="java.util.List"%>
<%@page import="movie.image.ImageService"%>
<%@page import="movie.detail.DetailDTO"%>
<%@page import="movie.detail.DetailDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
//DAO,Service 만들고 DB 데이터 잘 들어오는지 테스트하는 페이지.

String movieCode = "mc001";

DetailDAO dtDAO = DetailDAO.getInstance();

//String str = dtDAO.selectDetail("mc2").toString();
DetailDTO dtDTO = dtDAO.selectDetail(movieCode);
application.setAttribute("result",dtDTO);

//ImageService 테스트
ImageService is = ImageService.getInstance();
List<ImageDTO> imagelist =is.searchImageList(movieCode);
pageContext.setAttribute("img",imagelist);

//TrailerService 테스트
TrailerService ts = TrailerService.getInstance();
List<TrailerDTO> trailerList= ts.searchTrailerList(movieCode);
pageContext.setAttribute("trailerList",trailerList);



%>

<h5>영화 상세</h5>
${result.code}
${result.name}
${result}
<hr><hr><hr>
<h5>이미지</h5>
${img}
<hr><hr><hr>
<h5>트레일러</h5>
${trailerList}