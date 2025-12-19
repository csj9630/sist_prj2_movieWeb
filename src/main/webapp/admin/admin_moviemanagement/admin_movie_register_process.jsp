<%@page import="movie.image.ImageDTO"%>
<%@page import="movie.image.ImageService"%>
<%@page import="movie.movie_admin.MovieDAO"%>
<%@page import="movie.movie_admin.MovieDTO"%>
<%@page import="movie.admin.AdminMovieService"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    // 1. 저장 경로 설정
    String root = application.getRealPath("/"); 
    String saveDirectory = root + "resources" + File.separator + "img";
    
    File dir = new File(saveDirectory);
    if(!dir.exists()) dir.mkdirs();

    int maxSize = 1024 * 1024 * 10; 
    String encoding = "UTF-8";

    // 2. 파일 업로드 (이 시점에 파일은 서버에 저장됨)
    MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());

    // 3. 파라미터 받기
    String mode = mr.getParameter("mode");
    String id = mr.getParameter("id"); 
    String name = mr.getParameter("name");
    String genre = mr.getParameter("genre");
    String time = mr.getParameter("time");
    String grade = mr.getParameter("grade");
    String release = mr.getParameter("release");
    String showing = mr.getParameter("showing");
    String intro = mr.getParameter("intro");
    
    // [이미지 처리]
    // mainImage -> MOVIE 테이블 (포스터)
    // bgImage -> MOVIE_IMAGE 테이블 (스틸컷)
    String mainImg = mr.getFilesystemName("mainImage"); 
    String bgImg = mr.getFilesystemName("bgImage");     

    String prevMain = mr.getParameter("prevMainImage");
    // String prevBg = mr.getParameter("prevBgImage"); // 스틸컷은 테이블이 달라서 기존값 필요 없음

    // 포스터 처리 (없으면 기존 유지 or 기본 이미지)
    if(mainImg == null) mainImg = prevMain;
    if(mainImg == null) mainImg = "no_image.png";
    
    // 4. DTO 설정 (영화 기본 정보)
    MovieDTO mDTO = new MovieDTO();
    if(id != null && !id.isEmpty()) mDTO.setMovieCode(id);
    
    mDTO.setMovieName(name);
    mDTO.setMovieGenre(genre);
    mDTO.setRunningTime(time);
    mDTO.setMovieGrade(grade);
    mDTO.setReleaseDate(release);
    mDTO.setShowing(showing);
    mDTO.setIntro(intro);
    mDTO.setMainImage(mainImg); // 포스터는 여기에 저장
    
    AdminMovieService as = AdminMovieService.getInstance();
    boolean result = false;
    
    if("insert".equals(mode)){
        // (1) 영화 등록 (MOVIE 테이블)
        result = as.registerMovie(mDTO); 
        
        // (2) 등록 성공 시 스틸컷 저장 (MOVIE_IMAGE 테이블)
        if(result && bgImg != null) {
            // 방금 등록된 영화의 코드(PK)를 가져옴
            String newMovieCode = MovieDAO.getInstance().selectMaxMovieCode();
            
            // 팀원의 ImageService 호출
            ImageDTO iDTO = new ImageDTO();
            iDTO.setMovie_code(newMovieCode); // FK 연결
            iDTO.setImg_path(bgImg);
            
            ImageService.getInstance().addImage(iDTO);
        }
    } else {
        // (1) 영화 수정 (MOVIE 테이블)
        result = as.modifyMovie(mDTO);
        
        // (2) 스틸컷 처리는 정책에 따라 다름. 
        // 여기서는 "새 스틸컷이 업로드되면 기존 것을 지우고 새로 등록"하는 방식으로 구현
        if(result && bgImg != null) {
             ImageService imgService = ImageService.getInstance();
             
             // 기존 스틸컷 삭제 (선택 사항 - 쌓아두려면 이 줄 삭제)
             // imgService.removeImage(id); 
             
             // 새 스틸컷 추가
             ImageDTO iDTO = new ImageDTO();
             iDTO.setMovie_code(id); // 수정 모드이므로 id(movie_code)가 이미 있음
             iDTO.setImg_path(bgImg);
             imgService.addImage(iDTO);
        }
    }
    
    JSONObject json = new JSONObject();
    json.put("result", result);
    out.print(json.toJSONString());
%>