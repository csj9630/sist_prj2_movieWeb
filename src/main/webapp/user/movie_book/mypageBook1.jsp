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

    <jsp:include page="style.jsp" />
    <script type="text/javascript">
      // 1. 초기화 (window.onload)
      window.onload = function() {
        initBookingPage();
      };

      // 2. 이용안내 토글 함수 (HTML onclick 호출됨 - 전역 필요)
      function toggleGuide() {
        const content = document.getElementById("guideContent");
        content.classList.toggle("show");
      }

      // 3. 페이지 초기화 로직 분리
      function initBookingPage() {
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
        if(dateDisplay) {
            dateDisplay.textContent = currentYear + "년 " + currentMonth + "월";
        }

        // 기본값(예매내역)일 때 조회 버튼 비활성화
        if(searchBtn) searchBtn.disabled = true;

        // 12개월 옵션 생성
        generateMonthOptions();

        // 라디오 버튼 변경 이벤트
        if(type1Radio) {
            type1Radio.addEventListener("change", function () {
              if (this.checked) {
                dateDisplay.style.display = "inline-block";
                dateSelect.style.display = "none";
                searchBtn.disabled = true; // 예매내역일 때 조회 버튼 비활성화
              }
            });
        }

        if(type2Radio) {
            type2Radio.addEventListener("change", function () {
              if (this.checked) {
                dateDisplay.style.display = "none";
                dateSelect.style.display = "inline-block";
                searchBtn.disabled = false; // 지난내역일 때 조회 버튼 활성화
              }
            });
        }

        // 조회 버튼 클릭 이벤트
        if(searchBtn) {
            searchBtn.addEventListener("click", function () {
              const selectedType = type1Radio.checked ? "예매취소" : "지난내역";
              let selectedValue = "";
    
              if (type1Radio.checked) {
                selectedValue = dateDisplay.innerText; // dateInput.value 수정: dateDisplay 텍스트 사용
              } else {
                selectedValue = dateSelect.options[dateSelect.selectedIndex].text;
              }
    
              console.log("조회 유형: " + selectedType);
              console.log("선택된 기간: " + selectedValue);
    
              // 여기에 실제 조회 로직 추가 (예: AJAX 요청)
              alert(selectedType + " - " + selectedValue + " 조회합니다.");
            });
        }

        // 메뉴 클릭 이벤트 (기존 로직 유지)
        menuItems.forEach(function(item) {
          item.addEventListener("click", function () {
            const menuType = this.getAttribute("data-menu");

            // 모든 메뉴에서 active 제거
            menuItems.forEach(function(m) { m.classList.remove("active"); });

            // 클릭한 메뉴에 active 추가
            this.classList.add("active");

            // 모든 컨텐츠 숨기기
            menuContents.forEach(function(c) { c.classList.remove("active"); });

            // 해당 컨텐츠 보이기
            const targetContent = document.getElementById(menuType + "-content");
            if (targetContent) {
              targetContent.classList.add("active");
            }
          });
        });
      }

      // 4. 12개월 한 달 구간 생성 함수
      function generateMonthOptions() {
        const select = document.getElementById("dateSelect");
        if(!select) return;

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
    </script>
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

    <!-- Script moved to head -->
    <!-- 푸터 -->
    <div id="footer">
    <%@ include file="../../fragments/footer.jsp" %>
    </div>
  </body>
</html>
