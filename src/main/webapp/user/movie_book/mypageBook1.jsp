<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../../fragments/siteProperty.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>나의 예매내역 - 2GV</title>
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

      .page-title {
        font-size: 24px;
        font-weight: 700;
        color: #333;
        margin-bottom: 20px;
        padding-bottom: 15px;
        border-bottom: 2px solid #3e2675;
      }

      /* 탭 */
      .tabs {
        display: inline-flex;
        border: 1px solid #ddd;
        margin-bottom: 20px;
      }

      .tab-item {
        padding: 10px 30px;
        font-size: 14px;
        cursor: pointer;
        background-color: white;
        border-right: 1px solid #ddd;
        color: #666;
      }

      .tab-item:last-child {
        border-right: none;
      }

      .tab-item.active {
        background-color: #555;
        color: white;
        font-weight: 600;
      }

      /* 검색 영역 */
      .search-box {
        background-color: #f8f8f8;
        padding: 20px;
        margin-bottom: 30px;
      }

      .search-row {
        display: flex;
        align-items: center;
        gap: 15px;
      }

      .search-label {
        font-size: 14px;
        color: #333;
        font-weight: 600;
        min-width: 60px;
      }

      .radio-group {
        display: flex;
        gap: 20px;
      }

      .radio-item {
        display: flex;
        align-items: center;
        gap: 5px;
        cursor: pointer;
      }

      .radio-item input[type="radio"] {
        cursor: pointer;
      }

      .radio-item label {
        cursor: pointer;
        font-size: 13px;
      }

      /* 예매내역 고정 텍스트 표시 (현재 월) */
      .date-display {
        padding: 8px 8px;
        border: 1px solid #ddd;
        font-size: 13px;
        font-family: "Noto Sans KR", sans-serif;
        background-color: white;
        width: 150px;
        height: 35px;
        display: inline-block;
        color: #333;
        box-sizing: border-box;
        vertical-align: middle;
        line-height: 17px;
      }

      /* 지난내역 드롭다운 선택 메뉴 (12개월 옵션, 브라우저 자동 스크롤 지원) */
      .date-select {
        padding: 5px 4px;
        border: 1px solid #ddd;
        font-size: 13px;
        font-family: "Noto Sans KR", sans-serif;
        background-color: white;
        cursor: pointer;
        width: 150px;
        height: 35px;
        color: #333;
        box-sizing: border-box;
        vertical-align: middle;
        line-height: 17px;
        transition: border-color 0.2s, box-shadow 0.2s;
      }

      /* 지난내역 드롭다운 - 포커스 상태 */
      .date-select:focus {
        outline: 2px solid #3e2675;
        outline-offset: 1px;
      }

      /* 지난내역 드롭다운 - 호버 상태 */
      .date-select:hover {
        border-color: #999;
      }

      /* 조회 버튼 */
      .btn-search {
        padding: 8px 20px;
        background-color: #555;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 13px;
        transition: background-color 0.2s;
      }

      /* 조회 버튼 - 호버 상태 */
      .btn-search:hover {
        background-color: #333;
      }

      /* 조회 버튼 - 비활성화 상태 (예매내역일 때) */
      .btn-search:disabled {
        background-color: #ccc;
        cursor: not-allowed;
        opacity: 0.6;
      }

      .btn-search:disabled:hover {
        background-color: #ccc;
      }

      /* 빈 상태 */
      .empty-state {
        text-align: center;
        padding: 60px 20px;
        color: #999;
        font-size: 14px;
      }

      /* 정보 박스 */
      .info-box {
        border: 1px solid #ddd;
        margin-top: 30px;
      }

      .info-box-header {
        background-color: #f8f8f8;
        padding: 12px 15px;
        font-size: 15px;
        font-weight: 600;
        color: #333;
        border-bottom: 1px solid #ddd;
      }

      .info-table {
        width: 100%;
        border-collapse: collapse;
      }

      .info-table th,
      .info-table td {
        border-bottom: 1px solid #ddd;
        padding: 12px 15px;
        font-size: 13px;
        text-align: center;
      }

      .info-table th {
        background-color: #f8f8f8;
        color: #333;
        font-weight: 600;
      }

      .info-table td {
        color: #666;
      }

      .info-table tr:last-child th,
      .info-table tr:last-child td {
        border-bottom: none;
      }

      /* 이용안내 */
      .guide-section {
        margin-top: 30px;
        border: 1px solid #ddd;
      }

      .guide-header {
        background-color: #f8f8f8;
        padding: 12px 15px;
        font-size: 14px;
        font-weight: 600;
        color: #333;
        cursor: pointer;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .guide-content {
        padding: 20px;
        font-size: 13px;
        color: #666;
        line-height: 1.8;
        display: none;
      }

      .guide-content.show {
        display: block;
      }

      .guide-content ul {
        list-style: disc;
        padding-left: 20px;
      }

      .guide-content li {
        margin-bottom: 5px;
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
            <a href="#">나의 예매내역</a>
            <span class="breadcrumb-separator">></span>
          </li>
          <li>
            <span class="current">관람권/상영권</span>
          </li>
        </ol>
      </div>
    </nav>

    <!-- 메인 컨텐츠 -->
    <div class="container">
      <div class="page-wrap">
        <!-- 사이드바 -->
        <% request.setAttribute("activeMenu", "booking"); %>
        <%@ include file="../../fragments/sideFrame.jsp" %>

        <!-- 메인 컨텐츠 -->
        <main class="main-content">
          <!-- 예매/구매내역 컨텐츠 -->
          <div id="booking-content" class="menu-content active">
            <h1 class="page-title">예매</h1>

            <!-- 탭 -->
            <div class="tabs">
              <div class="tab-item active">예매</div>
            </div>

            <!-- 검색 영역 -->
            <div class="search-box">
              <div class="search-row">
                <span class="search-label">구분</span>
                <div class="radio-group">
                  <div class="radio-item">
                    <input type="radio" name="type" id="type1" checked />
                    <label for="type1">예매내역</label>
                  </div>
                  <div class="radio-item">
                    <input type="radio" name="type" id="type2" />
                    <label for="type2">지난내역</label>
                  </div>
                </div>
                <div class="date-display" id="dateDisplay">2025/11월</div>
                <select
                  class="date-select"
                  id="dateSelect"
                  style="display: none"
                >
                  <!-- JavaScript로 동적 생성 -->
                </select>
                <button class="btn-search" id="searchBtn">조회</button>
              </div>
            </div>

            <!-- 빈 상태 -->
            <div class="empty-state">예매 내역이 없습니다.</div>

            <!-- 예매확인/소식 -->
            <div class="info-box">
              <div class="info-box-header">예매확인/소식</div>
              <table class="info-table">
                <thead>
                  <tr>
                    <th>최근결재</th>
                    <th>예매일</th>
                    <th>극장</th>
                    <th>상영일시</th>
                    <th>취소금액</th>
                  </tr>
                </thead>
                <tbody>
                  <%--
                  TODO: JSP 스크립틀릿으로 Java 백엔드 데이터 출력 
                  DTO, DAO, Service를 통해 예매 내역 리스트를 가져와서 반복문으로 출력
                  
                  예시 (스크립틀릿 사용):
                  =
                  <%
                  List<BookingDTO> bookingList = (List<BookingDTO>) request.getAttribute("bookingList");
                    if (bookingList != null && !bookingList.isEmpty()) {
                      for (BookingDTO booking : bookingList) {
                  %>
                        <tr>
                          <td><%= booking.getMovieTitle() %></td>
                          <td><%= booking.getBookingDate() %></td>
                          <td><%= booking.getTheaterName() %></td>
                          <td><%= booking.getScreeningDateTime() %></td>
                          <td><%= booking.getCancelAmount() %>원</td>
                        </tr>
                  <%
                      }
                    } else {
                  %>
                      <tr>
                        <td colspan="5" style="padding: 40px; color: #999">
                          최근내역이 없습니다.
                        </td>
                      </tr>
                  <%
                    }
                  %>
                --%>
                </tbody>
              </table>
            </div>

            <!-- 이용안내 -->
            <div class="guide-section">
              <div class="guide-header" onclick="toggleGuide()">
                <span>이용안내</span>
                <i class="fa-solid fa-chevron-down"></i>
              </div>
              <div class="guide-content" id="guideContent">
                <ul>
                  <li>상영일 기준 7월 전 예매한 내역만 확인이 가능합니다.</li>
                  <li>예매 취소는 최소 상영시간 20분 전까지만 가능합니다.</li>
                  <li>
                    취소 시 결제하신 카드사에 따라 환불 처리 시간이 다를 수
                    있습니다.
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <!-- 나의 무비스토리 컨텐츠 -->
          <div id="movie-story-content" class="menu-content">
            <h1 class="page-title">나의 무비스토리</h1>
            <div class="empty-state">나의 무비스토리 페이지입니다.</div>
          </div>

          <!-- 개인정보 수정 컨텐츠 -->
          <div id="profile-content" class="menu-content">
            <h1 class="page-title">개인정보 수정</h1>
            <div class="empty-state">개인정보 수정 페이지입니다.</div>
          </div>

          <!-- 선호장르 수정 컨텐츠 -->
          <div id="genre-content" class="menu-content">
            <h1 class="page-title">선호장르 수정</h1>
            <div class="empty-state">선호장르 수정 페이지입니다.</div>
          </div>
        </main>
      </div>
    </div>

    <script>
      function toggleGuide() {
        const content = document.getElementById("guideContent");
        content.classList.toggle("show");
      }

      // 12개월 한 달 구간 생성 함수
      function generateMonthOptions() {
        const select = document.getElementById("dateSelect");
        const now = new Date();

        // 기존 옵션 제거
        select.innerHTML = "";

        // 현재 기준으로 이전 12개월 생성
        for (let i = 0; i < 12; i++) {
          const date = new Date(now.getFullYear(), now.getMonth() - i, 1);
          const year = date.getFullYear();
          const month = date.getMonth() + 1;

          const option = document.createElement("option");
          option.value = year + "/" + month;
          option.textContent = year + "년 " + month + "월";

          select.appendChild(option);
        }
      }

      // 메뉴 클릭 이벤트
      document.addEventListener("DOMContentLoaded", function () {
        const menuItems = document.querySelectorAll("[data-menu]");
        const menuContents = document.querySelectorAll(".menu-content");
        const type1Radio = document.getElementById("type1");
        const type2Radio = document.getElementById("type2");
        const dateDisplay = document.getElementById("dateDisplay");
        const dateSelect = document.getElementById("dateSelect");
        const searchBtn = document.getElementById("searchBtn");

        // 현재 날짜로 dateDisplay 설정
        const now = new Date();
        const currentYear = now.getFullYear();
        const currentMonth = now.getMonth() + 1;
        dateDisplay.textContent = currentYear + "년 " + currentMonth + "월";

        // 기본값(예매내역)일 때 조회 버튼 비활성화
        searchBtn.disabled = true;

        // 12개월 옵션 생성
        generateMonthOptions();

        // 라디오 버튼 변경 이벤트
        type1Radio.addEventListener("change", function () {
          if (this.checked) {
            dateDisplay.style.display = "inline-block";
            dateSelect.style.display = "none";
            searchBtn.disabled = true; // 예매내역일 때 조회 버튼 비활성화
          }
        });

        type2Radio.addEventListener("change", function () {
          if (this.checked) {
            dateDisplay.style.display = "none";
            dateSelect.style.display = "inline-block";
            searchBtn.disabled = false; // 지난내역일 때 조회 버튼 활성화
          }
        });

        // 조회 버튼 클릭 이벤트
        searchBtn.addEventListener("click", function () {
          const selectedType = type1Radio.checked ? "예매취소" : "지난내역";
          let selectedValue = "";

          if (type1Radio.checked) {
            selectedValue = dateInput.value;
          } else {
            selectedValue = dateSelect.options[dateSelect.selectedIndex].text;
          }

          console.log(`조회 유형: ${selectedType}`);
          console.log(`선택된 기간: ${selectedValue}`);

          // 여기에 실제 조회 로직 추가 (예: AJAX 요청)
          alert(`${selectedType} - ${selectedValue} 조회합니다.`);
        });

        menuItems.forEach((item) => {
          item.addEventListener("click", function () {
            const menuType = this.getAttribute("data-menu");

            // 모든 메뉴에서 active 제거
            menuItems.forEach((m) => m.classList.remove("active"));

            // 클릭한 메뉴에 active 추가
            this.classList.add("active");

            // 모든 컨텐츠 숨기기
            menuContents.forEach((c) => c.classList.remove("active"));

            // 해당 컨텐츠 보이기
            const targetContent = document.getElementById(
              menuType + "-content"
            );
            if (targetContent) {
              targetContent.classList.add("active");
            }
          });
        });
      });
    </script>
    <!-- 푸터 -->
    <div id="footer">
    <%@ include file="../../fragments/footer.jsp" %>
    </div>
  </body>
</html>
