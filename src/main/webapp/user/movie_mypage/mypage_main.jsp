<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../../fragments/siteProperty.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지 - 2GV</title>
    <link rel="stylesheet" href="${commonURL}/resources/css/megabox.min.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />

    <style>
      /* 초기화 및 기본 스타일 */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Noto Sans KR", sans-serif;
        color: #333;
        background-color: #fdfdfd;
      }

      a {
        text-decoration: none;
        color: inherit;
      }
      ul {
        list-style: none;
      }

      /* 유틸리티 */
      .container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
      }

      /* 헤더 영역 */
      header {
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
      }

      .top-utils {
        display: flex;
        justify-content: flex-end;
        gap: 15px;
        padding: 10px 0;
        font-size: 13px;
        color: #666;
      }

      .main-nav {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 15px 0;
      }

      .nav-left i,
      .nav-right i {
        font-size: 24px;
        margin: 0 10px;
        cursor: pointer;
        color: #333;
      }

      .logo {
        text-align: center;
      }

      .logo-box {
        background-color: #3e2675;
        color: white;
        padding: 5px 15px;
        font-weight: 900;
        font-size: 24px;
        display: inline-block;
      }

      .logo-sub {
        display: block;
        font-size: 12px;
        color: #3e2675;
        font-weight: 700;
        letter-spacing: 1px;
        margin-top: 2px;
      }

      .nav-menu {
        font-size: 18px;
        font-weight: 700;
        margin: 0 15px;
      }

      /* 브레드크럼 */
      .breadcrumb {
        background-color: #f8f8f8;
        padding: 10px 0;
        font-size: 12px;
        color: #888;
        border-bottom: 1px solid #eee;
      }

      .breadcrumb-list {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        list-style: none;
        gap: 8px;
      }

      .breadcrumb-list li {
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .breadcrumb-list a {
        color: #888;
        transition: color 0.2s;
      }

      .breadcrumb-list a:hover {
        color: #3e2675;
        text-decoration: underline;
      }

      .breadcrumb-list .current {
        color: #333;
        font-weight: 500;
      }

      .breadcrumb-separator {
        color: #ccc;
      }

      /* 페이지 레이아웃 */
      .page-wrap {
        display: flex;
        gap: 30px;
        margin-top: 30px;
        margin-bottom: 50px;
      }

      /* 메인 컨텐츠 */
      .main-content {
        flex: 1;
      }

      /* ----------------------------------------------------------------
         [마이페이지 메인 전용 스타일]
         ---------------------------------------------------------------- */

      /* 프로필 배너 */
      .profile-banner {
        background-color: #3e2675;
        color: white;
        padding: 40px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        gap: 30px;
        margin-bottom: 50px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      }

      .profile-avatar {
        width: 100px;
        height: 100px;
        background-color: #ddd;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        border: 3px solid rgba(255, 255, 255, 0.3);
      }

      .profile-avatar i {
        font-size: 60px;
        color: #fff;
      }

      .profile-info h2 {
        font-size: 28px;
        font-weight: 700;
        margin-bottom: 10px;
        line-height: 1.3;
      }

      .profile-links {
        font-size: 13px;
        color: rgba(255, 255, 255, 0.7);
      }

      .profile-links a {
        margin-right: 10px;
        transition: color 0.2s;
      }

      .profile-links a:hover {
        color: white;
        text-decoration: underline;
      }

      .profile-links span {
        margin-right: 10px;
        color: rgba(255, 255, 255, 0.3);
      }

      /* 섹션 공통 */
      .dashboard-section {
        margin-bottom: 60px;
      }

      .section-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 2px solid #ddd; /* 회색 라인 */
        padding-bottom: 15px;
        margin-bottom: 20px;
      }

      .section-title {
        font-size: 20px;
        font-weight: 700;
        color: #3e2675; /* 보라색 타이틀 */
      }

      .more-link {
        font-size: 13px;
        color: #666;
      }

      .more-link:hover {
        color: #3e2675;
        text-decoration: underline;
      }

      /* 예매내역 */
      .booking-empty {
        text-align: center;
        padding: 50px 0;
        color: #666;
        font-size: 14px;
      }

      /* 무비스토리 */
      .story-counts {
        display: flex;
        justify-content: center;
        gap: 80px;
        margin-bottom: 40px;
        background-color: #fff;
        padding: 20px;
        border: 1px solid #eee;
        border-radius: 10px;
      }

      .count-item {
        text-align: center;
      }

      .count-num {
        display: block;
        font-size: 32px;
        font-weight: 700;
        color: #3e2675;
        margin-bottom: 5px;
      }

      .count-label {
        font-size: 14px;
        color: #666;
      }

      .review-list {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 20px;
      }

      .review-card {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        display: flex;
        gap: 15px;
        background-color: #fff;
        transition: transform 0.2s, box-shadow 0.2s;
      }

      .review-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      }

      .movie-poster-placeholder {
        width: 80px;
        height: 115px;
        background-color: #eee;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #aaa;
        font-size: 24px;
        border-radius: 4px;
        flex-shrink: 0;
      }

      .review-content {
        flex: 1;
      }

      .review-movie-title {
        font-size: 16px;
        font-weight: 700;
        margin-bottom: 5px;
        color: #333;
      }

      .review-rating {
        color: #ffcc00;
        margin-bottom: 10px;
        font-size: 14px;
      }

      .review-text {
        font-size: 13px;
        color: #666;
        line-height: 1.5;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
      }

      .btn-story-register {
        /* 등록 버튼 제거 요청으로 인해 display: none 처리하거나 아예 HTML에서 제외 */
        display: none;
      }
    </style>
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

    <script>
      /*
      // 메뉴 클릭 이벤트 (사이드바 기능)
      document.addEventListener("DOMContentLoaded", function () {
        const menuItems = document.querySelectorAll("[data-menu]");
        
        menuItems.forEach((item) => {
          item.addEventListener("click", function () {
            // 마이페이지 메인에서는 사이드바 클릭 시 해당 페이지로 이동하는 것이 자연스러울 수 있음
            // 현재는 프레임의 로직을 그대로 가져왔으나, 실제로는 링크 이동이 필요할 수 있음.
            // 여기서는 UI 확인용으로 active 클래스만 토글하거나, 
            // 실제 구현 시에는 location.href = '...' 등으로 처리 권장.
            
            const menuType = this.getAttribute("data-menu");
            console.log("Menu clicked:", menuType);
            
            if(menuType === 'booking') {
                location.href = 'mypageBook1.html';
            } else if (menuType === 'movie-story') {
                location.href = '../mypage_movieStory/mypage_movieStory1.html'; // 경로 확인 필요
            }
          });
        });
      });
      */
    </script>
    <!-- 푸터 -->
    <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>
  </body>
</html>
