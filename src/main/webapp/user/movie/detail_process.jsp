<%@page import="movie.trailer.TrailerDTO"%>
<%@page import="movie.trailer.TrailerService"%>
<%@page import="java.util.List"%>
<%@page import="movie.image.ImageDTO"%>
<%@page import="movie.image.ImageService"%>
<%@page import="movie.detail.DetailService"%>
<%@page import="movie.detail.DetailDTO"%>
<%@page import="movie.detail.DetailDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String movieName = request.getParameter("name");
String movieImgPath = "resources/images/movieImg";

DetailService ds = DetailService.getInstance();
DetailDTO dtDTO = ds.searchMovieDetail(movieName);

ImageService is = ImageService.getInstance();
List<ImageDTO> imgList = is.searchImageList(movieName);

TrailerService ts = TrailerService.getInstance();
List<TrailerDTO> trailerList = ts.searchTrailerList(movieName);

pageContext.setAttribute("movieImgPath",movieImgPath );
pageContext.setAttribute("detail", dtDTO);
pageContext.setAttribute("imgList", imgList);
pageContext.setAttribute("trailerList", trailerList);


%>
