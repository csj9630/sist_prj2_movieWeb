<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../../fragments/siteProperty.jsp"%> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- <%@ include
file="../../fragments/loginChk2.jsp"%> --%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지 - 2GV</title>
    <jsp:include page="/fragments/style_css.jsp" />

    <jsp:include page="style.jsp" />
  </head>
  <body>
    <!-- 헤더 -->
    <div id="header">
      <jsp:include page="../../fragments/header.jsp" />
    </div>

    <!-- 브레드크럼 -->
    <nav class="breadcrumb" aria-label="breadcrumb">
      <div class="container">
        <ol class="breadcrumb-list">
          <li>
            <a href="index.html" title="홈으로 이동">
              <i class="fa-solid fa-house"></i>
            </a>
            <span class="breadcrumb-separator">></span>
          </li>
          <li>
            <span class="current">나의 메가박스</span>
          </li>
        </ol>
      </div>
    </nav>

    <!-- 메인 컨텐츠 -->
    <div class="container">
      <div class="page-wrap">
        <!-- 사이드바 -->
        <%@ include file="../../fragments/sideFrame.jsp" %>

        <!-- 메인 컨텐츠 -->
        <main class="main-content">
          <!-- 1. 프로필 배너 -->
          <div class="profile-banner">
            <div class="profile-avatar">
              <i class="fa-solid fa-user"></i>
            </div>
            <div class="profile-info">
              <h2>안녕하세요!<br />민*조님</h2>
              <div class="profile-links">
                <a href="#">개인정보수정</a>
                <span>|</span>
                <a href="#">지난등급조회</a>
              </div>
            </div>
          </div>

          <!-- 2. 나의 예매내역 -->
          <section class="dashboard-section">
            <div class="section-header">
              <h3 class="section-title">나의 예매내역</h3>
              <a href="mypageBook1.html" class="more-link"
                >더보기 <i class="fa-solid fa-chevron-right"></i
              ></a>
            </div>
            <div class="booking-empty">예매 내역이 없습니다.</div>
          </section>

          <!-- 3. 나의 무비스토리 -->
          <section class="dashboard-section">
            <div class="section-header">
              <h3 class="section-title">나의 무비스토리</h3>
              <!-- 등록 버튼 제거됨 -->
            </div>

            <div class="story-counts">
              <div class="count-item">
                <span class="count-num">16</span>
                <span class="count-label">본 영화</span>
              </div>
              <div class="count-item">
                <span class="count-num">0</span>
                <span class="count-label">관람평</span>
              </div>
            </div>

            <div class="review-list">
              <!-- 관람평이 없습니다 -->
            </div>
          </section>
        </main>
      </div>
    </div>

    <!-- Script removed (dead code) -->
    <!-- 푸터 -->
    <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>
  </body>
</html>
