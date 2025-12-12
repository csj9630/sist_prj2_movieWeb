<%@page import="movie.detail.DetailDTO"%>
<%@page import="movie.detail.DetailDAO"%>
<%@page import="movie.detail.DetailService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../fragments/siteProperty.jsp"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ include file="detail_process.jsp"%>


<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${detail.name}</title>
<link rel="stylesheet" href="${commonURL}/resources/css/megabox.min.css" />
<link rel="stylesheet"
	href="${commonURL}/resources/css/movie_detail.css" />
<script src="${commonURL}/resources/js/movie_detail.js"></script>
<link rel="shortcut icon"
	href="${commonURL}/resources/images/favicon.ico">


<!-- bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	introDivider();
});//document.ready

$(function introDivider() {
	 let text = $("#movie_intro").html().trim();

	    // 1) HTML 태그 제거 (<br>, <p> 등)
	    text = text.replace(/<[^>]+>/g, " ");

	    // 2) 줄바꿈을 공백으로 통합
	    text = text.replace(/\s+/g, " ").trim();

	    // 3) 문장 단위 분리 (. ! ?)
	    let sentences = text.split(/(?<=[.!?])\s+/);

	    // 4) 공백 문장 제거
	    sentences = sentences.map(s => s.trim()).filter(s => s.length > 0);
	    
	    // 5) 출력 생성
	    let result = "";
	    if (sentences.length > 0) {
	        result += '<h2 class="content-title">'+sentences[0]+'</h2>';
	    }
	    for (let i = 1; i < sentences.length; i++) {
	        result += '<p class="content-text">'+sentences[i]+'</p>';
	    }

	    $("#movie_intro").html(result);
})//introDivider

</script>
</head>
<body>
	<header id="header">
		<c:import url="${commonURL}/fragments/header.jsp" />
	</header>

	<!-- 히어로 섹션 -->
	<div class="hero-section">
		<div class="bg-img"
			style="background-image: url('${commonURL}/${movieImgPath}/${detail.code}/${detail.bgImg}')"></div>
		<div class="bg-mask"></div>
		<div class="hero-container">
			<!-- 왼쪽 정보 -->
			<div class="hero-info">
				<h1 class="title">${detail.name}</h1>
				<!-- 통계 -->
				<div class="hero-stats">
					<div class="stat-item">
						<span class="stat-icon">⭐</span>
						<div class="stat-content">
							<div class="stat-value rating-value">9.5</div>
							<div class="stat-label">(42.6k)</div>
						</div>
					</div>
					<div class="stat-item">
						<span class="stat-icon">♥</span>
						<div class="stat-content">
							<div class="stat-value heart-value">8</div>
							<div class="stat-label">관심</div>
						</div>
					</div>
					<div class="stat-item">
						<span class="stat-icon">👁</span>
						<div class="stat-content">
							<div class="stat-value">3,302,939</div>
							<div class="stat-label">조회수</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 오른쪽 포스터 -->
			<div class="hero-poster">
				<div class="poster">
					<div class="poster-content">
						<img class="poster-img" alt="${detail.name}"
							src="${commonURL}/${movieImgPath}/${detail.code}/${detail.mainImg}" />
					</div>
				</div>
				<div class="purchase-box">
					<div class="purchase-item">
						<input type="button" value="예매" class="reservation" />
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 콘텐츠 섹션 -->
	<div class="content-section">
		<!-- 탭 -->
		<div class="tabs">
			<button class="tab active" data-tab="info">주요정보</button>
			<button class="tab" data-tab="storage">실관람평</button>
			<button class="tab" data-tab="episodes">예고편/스틸컷</button>
		</div>

		<!-- 탭 콘텐츠 -->
		<div class="tab-contents">
			<!-- 작품정보 탭 -->
			<div class="tab-content active" id="info">
				<div class="content-box" >
				<div id="movie_intro"><c:out value="${detail.intro}"/></div>


					<div class="divider"></div>

					<div class="info-list">
						<p>
							<strong>장르</strong>${detail.genre}</p>
						<p>
							<strong>상영시간</strong>${detail.runningTime}분</p>
						<p>
							<strong>등급</strong>${detail.grade}</p>
					</div>
				</div>
			</div>

			<!-- 실관람평 탭 -->
			<div class="tab-content" id="storage">
				<div class="content-box">
					<div class="comment-area">
						<h2 class="content-title" style="margin-bottom: 0">
							${detail.name}에 대한 15,098개의 이야기가 있어요!</h2>
					</div>

					<!-- 공지 메시지 -->
					<div class="comment-asdf">
						<div class="comment-avatar">M</div>
						<div style="flex: 1">
							<div class="comment-input">
								최근 ${detail.name}에 관한 평점 게시물이 늘고 있습니다. 영화의 어떤 점이 좋았는지 이야기해주세요.<br />
							</div>
							<div style="text-align: right">
								<a href="#" class="comment-button"> ✏️ 관람평쓰기 </a>
							</div>
						</div>
					</div>

					<!-- 댓글 목록 (기존 코드 유지) -->

					<%-- 	<c:forEach var="comment" items="${detail.videoLink}" varStatus="status"> --%>
					<div class="comment-item">
						<div class="comment-header">
							<div class="comment-user">
								<div class="user-avatar">👤</div>
								<span class="username">ha***o1110</span>
							</div>
							<div class="comment-actions">
								<button class="comment-like">👍 0</button>
								<button class="comment-menu">⋮</button>
							</div>
						</div>
						<div class="comment-body">
							<div class="comment-rating">
								<span class="rating-label">관람평</span> <span class="rating-score">10</span>
								<span class="rating-stars">⭐ +4</span>
							</div>
							<p class="comment-text">주요등장 캐릭터들이는 너무 매력있!!</p>
							<span class="comment-time">10 분전</span>
						</div>
					</div>
					<!-- 나머지 댓글들... -->
				</div>
			</div>
		</div>

		<!-- 예고편/스틸컷 탭 -->

		
		<div class="tab-content" id="episodes">
			<div class="content-box">
				<div class="video-section">
					<div class="video-header">
						<h2 class="content-title">메인 예고편</h2>
					</div>

					<div class="comments-section">
						<!-- 메인 비디오 플레이어 -->
						<iframe id="mainVideo" class="main-video"
							src="${trailerList[0].fullVideoUrl}?controls=0"
							title="${detail.name} 예고편" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen> </iframe>

						<!-- 비디오 썸네일 캐러셀 -->

						<div class="video-carousel" id="videoCarousel">
							<c:forEach var="trailer" items="${trailerList}"
								varStatus="status">
								<div class="video-thumbnail ${status.first ? 'active' : ''}"
									onclick="changeVideo('${trailer.fullVideoUrl}', this)">
									<img src="${trailer.fullThumbnailUrl}"
										style="width: 100%; height: 100%; object-fit: cover"
										alt="예고편 ${status.count}" />
									<div class="play-icon">▶</div>
								</div>
							</c:forEach>
						</div>
					</div> 
				</div>

				<!-- 이미지 앨범 -->
				<div class="album-section">
					<h2 class="content-title">이미지</h2>
					<div class="image-grid">
						<c:forEach var="img" items="${imgList}" varStatus="status">
							<div class="image-item">
								<img src="${commonURL}/${movieImgPath}/${img.movie_code}/${img.img_path}" alt="${detail.name} ${status.count}" />
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div> 
	</div>


	<footer id="footer">
		<c:import url="${commonURL}/fragments/footer.jsp" />
	</footer>
</body>

</html>