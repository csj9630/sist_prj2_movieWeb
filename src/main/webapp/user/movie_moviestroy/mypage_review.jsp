<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../fragments/siteProperty.jsp"%>
<%@ page import="java.util.*" %>
<%
    // -----------------------------------------------------------
    // [Backend Logic Area]
    // -----------------------------------------------------------

    request.setCharacterEncoding("UTF-8");

    // 1. [Session 처리]
    String userId = "movie_lover_2025"; 

    // 2. [DB 연동 및 데이터 조회]
    List<Map<String, String>> reviewList = new ArrayList<>();

    // 더미 데이터 생성
    String[] movieTitles = {"범죄도시4", "스파이더맨: 어크로스 더 유니버스", "엘리멘탈", "가디언즈 오브 갤럭시 3", "밀수", "서울의 봄"};
    String[] contents = {
        "뭔가 여운이 남아요.. 마동석 액션은 역시 믿고 봅니다.",
        "거미줄에 걸린건 덴지가 아니라 레제일지도.. 연출이 미쳤습니다.",
        "영상미가 너무 예뻐요! 앰버와 웨이드의 케미가 돋보입니다.",
        "로켓의 서사가 완벽했습니다. 시리즈의 완벽한 마무리.",
        "배우들 연기가 좋네요. 여름에 보기 시원한 영화입니다.",
        "심장이 쫄깃해지는 영화. 황정민 연기 소름돋네요."
    };
    String[] scores = {"10", "10", "8", "9", "7", "10"};
    String[] times = {"51분 전", "56분 전", "1시간 전", "2시간 전", "3시간 전", "5시간 전"};

    for(int i=0; i<movieTitles.length; i++) {
        Map<String, String> review = new HashMap<>();
        review.put("title", movieTitles[i]);
        review.put("content", contents[i]);
        review.put("score", scores[i]);
        review.put("time", times[i]);
        reviewList.add(review);
    }
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>나의 관람평</title>
    <link
      rel="stylesheet"
      href="${commonURL}/resources/css/megabox.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />

    <style>
      /* 탭 메뉴 스타일 (Local) */
      .tab-menu {
        display: flex;
        border: 1px solid #ddd;
        border-bottom: none;
        margin-bottom: 30px;
      }

      .tab-item {
        flex: 1;
        text-align: center;
        padding: 15px 0;
        font-size: 15px;
        color: #666;
        background-color: #fff;
        border-right: 1px solid #ddd;
        cursor: pointer;
        transition: all 0.2s;
      }

      .tab-item:last-child {
        border-right: none;
      }

      .tab-item:hover {
        background-color: #f9f9f9;
      }

      .tab-item.active {
        background-color: #503396;
        color: #fff;
        font-weight: 700;
      }

      /* ----------------------------------------------------------- */
      /* [Review List Specific Styles] */
      /* ----------------------------------------------------------- */

      /* Scrollable Container */
      .review-list-container {
        /* 5개 이상이면 스크롤 생기도록 높이 제한 */
        max-height: 650px;
        overflow-y: auto;
        padding-right: 10px; /* 스크롤바 공간 */
      }

      /* Scrollbar Customization */
      .review-list-container::-webkit-scrollbar {
        width: 8px;
      }
      .review-list-container::-webkit-scrollbar-thumb {
        background-color: #ccc;
        border-radius: 4px;
      }
      .review-list-container::-webkit-scrollbar-track {
        background-color: #f1f1f1;
      }

      .review-item {
        display: flex;
        gap: 20px;
        margin-bottom: 20px;
        padding-bottom: 20px;
        border-bottom: 1px solid #eee;
      }

      /* Left: Reviewer Info */
      .reviewer-info {
        width: 80px;
        text-align: center;
        flex-shrink: 0;
      }

      .avatar {
        width: 60px;
        height: 60px;
        background-color: #e0e0e0;
        border-radius: 50%;
        margin: 0 auto 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 30px;
        color: #fff;
      }

      .username {
        font-size: 12px;
        color: #666;
        word-break: break-all;
      }

      /* Right: Review Content */
      .review-content-wrap {
        flex: 1;
      }

      .review-box {
        background-color: #f9f9f9;
        border-radius: 8px;
        padding: 20px;
        position: relative; /* For menu positioning */
        display: flex;
        align-items: center;
        justify-content: space-between;
      }

      .review-left {
        display: flex;
        align-items: center;
        gap: 15px;
        flex: 1;
      }

      .review-badge {
        font-size: 13px;
        color: #6c5ce7;
        font-weight: 600;
      }

      .review-score {
        font-size: 28px;
        color: #3e2675;
        font-weight: 300;
      }

      .review-separator {
        width: 1px;
        height: 20px;
        background-color: #ddd;
      }

      .review-text-group {
        display: flex;
        flex-direction: column;
        gap: 4px;
      }

      .movie-title {
        font-size: 14px;
        font-weight: 700;
        color: #333;
      }

      .review-text {
        font-size: 14px;
        color: #555;
      }

      /* Three-dot Menu */
      .menu-btn {
        color: #999;
        cursor: pointer;
        padding: 5px;
        transition: color 0.2s;
      }
      .menu-btn:hover {
        color: #333;
      }

      .menu-dropdown {
        position: absolute;
        top: 40px;
        right: 10px;
        background: white;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        display: none;
        z-index: 10;
        width: 80px;
      }

      .menu-dropdown.show {
        display: block;
      }

      .menu-dropdown-item {
        padding: 8px 12px;
        font-size: 12px;
        color: #333;
        cursor: pointer;
        transition: background 0.2s;
      }

      .menu-dropdown-item:hover {
        background-color: #f5f5f5;
      }

      .menu-dropdown-item.delete {
        color: #e74c3c;
      }

      /* Meta Info (Time) */
      .review-meta {
        text-align: right;
        margin-top: 5px;
        font-size: 12px;
        color: #999;
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
            <a href="#">나의 메가박스</a>
            <span class="breadcrumb-separator">></span>
          </li>
          <li>
            <span class="current">나의 관람평</span>
          </li>
        </ol>
      </div>
    </nav>

    <!-- 메인 컨텐츠 -->
    <div class="container">
      <div class="page-wrap">
        <!-- 사이드바 (sideFrame.jsp 적용) -->
        <% request.setAttribute("activeMenu", "movie-story"); %>
        <%@ include file="../../fragments/sideFrame.jsp" %>

        <!-- 메인 컨텐츠 -->
        <main class="main-content">
          <h1 class="page-title">나의 무비스토리</h1>

          <!-- 탭 메뉴 -->
          <div class="tab-menu">
            <div class="tab-item" onclick="location.href='mypage_movieStory1.jsp'">무비타임라인</div>
            <div class="tab-item active" onclick="location.href='mypage_review.jsp'">관람평</div>
          </div>

          <div class="review-list-container">
            <% 
                for(Map<String, String> review : reviewList) {
            %>
            <!-- Review Item (Repeated) -->
            <div class="review-item">
              <div class="reviewer-info">
                <div class="avatar"><i class="fa-solid fa-user"></i></div>
                <div class="username"><%= userId %></div>
              </div>
              <div class="review-content-wrap">
                <div class="review-box">
                  <div class="review-left">
                    <span class="review-badge">관람평</span>
                    <span class="review-score"><%= review.get("score") %></span>
                    <span class="review-separator"></span>
                    <div class="review-text-group">
                      <div class="movie-title"><%= review.get("title") %></div>
                      <div class="review-text"><%= review.get("content") %></div>
                    </div>
                  </div>
                  <div class="menu-btn" onclick="toggleMenu(this)">
                    <i class="fa-solid fa-ellipsis-vertical"></i>
                  </div>
                  <div class="menu-dropdown">
                    <div class="menu-dropdown-item">수정</div>
                    <div class="menu-dropdown-item delete">삭제</div>
                  </div>
                </div>
                <div class="review-meta"><%= review.get("time") %></div>
              </div>
            </div>
            <% 
                } // end for
            %>
            
            <% if(reviewList.isEmpty()) { %>
                <div style="text-align:center; padding:50px; color:#999;">작성한 관람평이 없습니다.</div>
            <% } %>

          </div>
        </main>
      </div>
    </div>

    <!-- 푸터 -->
    <div id="footer">
    <%@ include file="../../fragments/footer.jsp" %>
    </div>

    <script>
      // Toggle Menu Dropdown
      function toggleMenu(btn) {
        closeAllMenus();
        const dropdown = btn.nextElementSibling;
        dropdown.classList.toggle("show");
        event.stopPropagation();
      }

      // Close all menus
      function closeAllMenus() {
        const dropdowns = document.querySelectorAll(".menu-dropdown");
        dropdowns.forEach((d) => d.classList.remove("show"));
      }

      // Close menu when clicking outside
      document.addEventListener("click", function () {
        closeAllMenus();
      });
    </script>
  </body>
</html>
