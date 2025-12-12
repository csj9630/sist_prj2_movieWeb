<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="true" %> <%@ include
file="../../fragments/siteProperty.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>나의 무비스토리</title>
    <link
      rel="stylesheet"
      href="<%=request.getContextPath()%>/resources/css/megabox.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <!-- Swiper CSS -->
    <link
      rel="stylesheet"	
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />

    <style>
      /* ----------------------------------------------------------- */
      /* [Movie Story Specific Styles] */
      /* ----------------------------------------------------------- */

      /* [디자인] 전체를 감싸는 박스 (보더 포함) */
      .year-selector-wrap {
        display: flex;
        align-items: center;
        border: 1px solid #ddd; /* 전체 테두리 */
        height: 60px;
        background: #fff;
        padding: 0 10px; /* 화살표와 테두리 사이 간격 */
        margin-bottom: 30px;
      }

      /* Swiper 영역 (가운데 5칸) */
      .swiper.year-swiper {
        flex: 1; /* 남은 공간 다 차지 */
        height: 100%;
        margin: 0 10px; /* 화살표와의 간격 */
        cursor: default;
      }

      .swiper-initialized:not(.swiper-locked) {
        cursor: grab;
      }

      /* 슬라이드(연도) 개별 스타일 */
      .swiper-slide {
        text-align: center;
        line-height: 60px; /* 세로 중앙 정렬 */
        font-size: 16px;
        color: #333;
        cursor: pointer;
        position: relative;
      }

      /* 선택된 연도 스타일 (보라색 밑줄) */
      .swiper-slide-thumb-active {
        font-weight: bold;
        color: #000;
      }
      /* 밑줄을 가상요소로 만들어서 디자인 디테일 살리기 */
      .swiper-slide-thumb-active::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 4px;
        background-color: #6c5ce7; /* 보라색 */
      }

      /* 화살표 커스텀 */
      .nav-btn {
        width: 30px;
        height: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #999;
        cursor: pointer;
        z-index: 10;
        font-weight: bold;
        font-family: monospace; /* 화살표 모양 유지를 위해 */
      }
      /* Swiper 내장 클래스 활용하지만 위치는 flex로 제어 */
      .swiper-button-disabled {
        opacity: 0.3;
        cursor: default;
      }

      /* ----------------------------------------------------------- */
      /* [Timeline List Styles] */
      /* ----------------------------------------------------------- */
      .timeline-list {
        position: relative;
        /* [스크롤 적용] 높이를 고정하고 넘치면 스크롤 발생 */
        height: 700px;
        overflow-y: auto;
        padding-top: 30px; /* 뱃지가 잘리지 않도록 여백 추가 */
        padding-bottom: 50px;
        padding-right: 10px; /* 스크롤바 공간 확보 */
        border-top: 1px solid #eee;
        border-bottom: 1px solid #eee; /* 하단 마감 선 */
      }

      /* 스크롤바 커스텀 (Webkit) */
      .timeline-list::-webkit-scrollbar {
        width: 8px;
      }

      .timeline-list::-webkit-scrollbar-thumb {
        background-color: #ccc;
        border-radius: 4px;
      }

      .timeline-list::-webkit-scrollbar-track {
        background-color: #f1f1f1;
      }

      .timeline-item {
        position: relative;
        padding-top: 40px;
        padding-bottom: 20px;
        border-top: 2px solid #5bb0ba; /* 이미지의 청록색 선 */
        margin-bottom: 20px;
      }

      /* 날짜 뱃지 */
      .date-badge {
        position: absolute;
        top: -15px;
        left: 50%;
        transform: translateX(-50%);
        background-color: #5bb0ba;
        color: white;
        padding: 5px 20px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: bold;
        z-index: 1;
      }

      .movie-content {
        display: flex;
        gap: 20px;
        align-items: flex-start;
        padding: 0 20px;
      }

      .poster {
        width: 100px;
        height: 140px;
        background: #eee;
        border-radius: 4px;
        object-fit: cover;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }

      .info {
        flex: 1;
      }

      .info h3 {
        margin: 0 0 5px 0;
        font-size: 18px;
        color: #333;
      }

      .info p {
        margin: 5px 0;
        color: #666;
        font-size: 14px;
      }

      .tag {
        display: inline-block;
        border: 1px solid #999;
        border-radius: 15px;
        padding: 2px 10px;
        font-size: 12px;
        color: #666;
        margin-bottom: 8px;
      }

      /* 탭 메뉴 스타일 */
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
          <li><span class="current">나의 무비스토리</span></li>
        </ol>
      </div>
    </nav>

    <!-- 메인 컨텐츠 -->
    <div class="container">
      <div class="page-wrap">
        <!-- 사이드바 (sideFrame.jsp 적용) -->
        <% request.setAttribute("activeMenu", "movie-story"); %> <%@ include
        file="../../fragments/sideFrame.jsp" %>

        <!-- 메인 컨텐츠 -->
        <main class="main-content">
          <!-- 나의 무비스토리 컨텐츠 (Active) -->
          <div id="movie-story-content" class="menu-content active">
            <h1 class="page-title">나의 무비스토리</h1>

            <!-- 탭 메뉴 -->
            <div class="tab-menu">
              <div
                class="tab-item active"
                onclick="location.href='mypage_movieStory1.jsp'"
              >
                무비타임라인
              </div>
              <div class="tab-item" onclick="location.href='mypage_review.jsp'">
                관람평
              </div>
            </div>

            <!-- 연도 선택기 (Swiper) -->
            <div class="year-selector-wrap">
              <div class="nav-btn swiper-button-prev-custom">&lt;</div>

              <div class="swiper year-swiper">
                <div class="swiper-wrapper" id="yearWrapper"></div>
              </div>

              <div class="nav-btn swiper-button-next-custom">&gt;</div>
            </div>

            <!-- 결과 영역 (타임라인 리스트) -->
            <div class="timeline-list" id="movieList">
              <!-- JS로 동적 생성됨 -->
            </div>
          </div>

          <!-- 다른 메뉴 컨텐츠 (Hidden) -->
          <div id="booking-content" class="menu-content">
            <h1 class="page-title">예매/구매내역</h1>
            <div class="empty-state">예매/구매내역 페이지입니다.</div>
          </div>

          <div id="profile-content" class="menu-content">
            <h1 class="page-title">개인정보 수정</h1>
            <div class="empty-state">개인정보 수정 페이지입니다.</div>
          </div>

          <div id="genre-content" class="menu-content">
            <h1 class="page-title">선호장르 수정</h1>
            <div class="empty-state">선호장르 수정 페이지입니다.</div>
          </div>
        </main>
      </div>
    </div>

    <!-- 푸터 -->
    <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script>
      // -----------------------------------------------------------
      // [Movie Story Logic]
      // -----------------------------------------------------------

      // 1. 설정
      var startYear = 2018;
      var currentYear = 2025;
      var yearWrapper = document.getElementById("yearWrapper");

      // 2. 연도 데이터 생성
      for (var y = startYear; y <= currentYear; y++) {
        var slide = document.createElement("div");
        slide.classList.add("swiper-slide");
        slide.innerText = y;
        slide.setAttribute("data-year", y);
        yearWrapper.appendChild(slide);
      }

      // 3. 영화 데이터 생성 (가짜 데이터)
      var movieData = [];
      var titles = [
        "범죄도시4",
        "파묘",
        "노량: 죽음의 바다",
        "서울의 봄",
        "콘크리트 유토피아",
        "밀수",
        "엘리멘탈",
        "가디언즈 오브 갤럭시 3",
      ];
      var theaters = ["별내 6관", "왕십리 IMAX", "용산 4DX", "강남 2관"];

      for (var y = startYear; y <= currentYear; y++) {
        if (y === 2025) {
          // 2025년: 6개 생성
          for (var i = 1; i <= 6; i++) {
            movieData.push({
              year: y,
              // [중요] 백틱과 ${} 사용 금지 -> 문자열 합치기(+) 사용
              date: y + ".0" + i + ".15",
              title: titles[i % titles.length] + " (" + y + ")",
              theater: theaters[i % theaters.length],
              img:
                "https://via.placeholder.com/100x140?text=Movie+" + y + "-" + i,
            });
          }
        } else {
          // 나머지 연도: 1개 생성
          movieData.push({
            year: y,
            date: y + ".05.05",
            title: "영화 제목 " + y,
            theater: "별내 1관",
            img: "https://via.placeholder.com/100x140?text=Movie+" + y,
          });
        }
      }

      // 4. 영화 리스트 렌더링 함수
      function renderMovies(selectedYear) {
        var listContainer = document.getElementById("movieList");
        listContainer.innerHTML = ""; // 기존 내용 초기화

        // 선택된 연도 필터링 (== 사용)
        var filteredMovies = movieData.filter(function (m) {
          return m.year == selectedYear;
        });

        if (filteredMovies.length === 0) {
          listContainer.innerHTML =
            '<div style="text-align:center; padding:50px; color:#999;">' +
            selectedYear +
            "년에는 관람 내역이 없습니다.</div>";
          return;
        }

        // HTML 생성
        filteredMovies.forEach(function (movie) {
          // [핵심 수정] 타임라인 선과 뱃지 디자인 유지 + JS 변수 연결 방식 변경
          var html =
            '<div class="timeline-item">' +
            '<div class="date-badge">' +
            movie.date +
            "</div>" +
            '<div class="movie-content">' +
            '<img src="' +
            movie.img +
            '" class="poster" alt="포스터">' +
            '<div class="info">' +
            '<span class="tag">본영화</span>' +
            "<h3>" +
            movie.title +
            "</h3>" +
            "<p>" +
            movie.theater +
            "</p>" +
            "<p>" +
            movie.date +
            " 관람</p>" +
            "</div>" +
            "</div>" +
            "</div>";

          listContainer.insertAdjacentHTML("beforeend", html);
        });
      }

      // 5. Swiper 초기화
      var swiper = new Swiper(".year-swiper", {
        slidesPerView: 5,
        spaceBetween: 0,
        centeredSlides: false,
        watchOverflow: true,
        slideToClickedSlide: true,
        navigation: {
          nextEl: ".swiper-button-next-custom",
          prevEl: ".swiper-button-prev-custom",
        },
        on: {
          init: function (sw) {
            var lastIndex = sw.slides.length - 1;
            sw.slideTo(lastIndex, 0);
            updateActiveStyle(sw.slides[lastIndex]);
          },
          click: function (sw) {
            updateActiveStyle(sw.clickedSlide);
          },
        },
      });

      // 스타일 및 데이터 갱신 함수
      function updateActiveStyle(slideElement) {
        if (!slideElement) return;

        var slides = document.querySelectorAll(".swiper-slide");
        for (var k = 0; k < slides.length; k++) {
          slides[k].classList.remove("swiper-slide-thumb-active");
        }

        slideElement.classList.add("swiper-slide-thumb-active");

        var year = slideElement.getAttribute("data-year");
        renderMovies(year);
      }

      // -----------------------------------------------------------
      // [Sidebar Menu Logic]
      // -----------------------------------------------------------
      document.addEventListener("DOMContentLoaded", function () {
        var menuItems = document.querySelectorAll("[data-menu]");
        var menuContents = document.querySelectorAll(".menu-content");

        // IE 호환성 등을 고려하여 forEach call 방식 사용
        Array.prototype.forEach.call(menuItems, function (item) {
          item.addEventListener("click", function () {
            var menuType = this.getAttribute("data-menu");

            Array.prototype.forEach.call(menuItems, function (m) {
              m.classList.remove("active");
            });
            this.classList.add("active");

            Array.prototype.forEach.call(menuContents, function (c) {
              c.classList.remove("active");
            });

            var targetContent = document.getElementById(menuType + "-content");
            if (targetContent) {
              targetContent.classList.add("active");
            }
          });
        });
      });
    </script>
  </body>
</html>
