<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원탈퇴 - 2GV</title>
    <link
      rel="stylesheet"
      href="<%=request.getContextPath()%>/fragments/megabox.min.css"
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
      /* 
         ================================================================
         [mypage_frame.html 스타일 그대로 적용]
         ================================================================
      */
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

      /* 
         ================================================================
         [회원탈퇴 페이지 전용 스타일]
         ================================================================
      */

      .withdraw-guide {
        font-size: 14px;
        color: #333;
        line-height: 1.6;
      }

      .guide-intro {
        margin-bottom: 30px;
        color: #666;
      }

      .guide-section {
        margin-bottom: 30px;
      }

      .guide-section h4 {
        font-size: 16px;
        font-weight: 700;
        margin-bottom: 10px;
        color: #333;
      }

      .guide-section ul {
        list-style: none;
        padding-left: 0;
      }

      .guide-section ul li {
        position: relative;
        padding-left: 10px;
        margin-bottom: 5px;
        color: #666;
        font-size: 13px;
      }

      .guide-section ul li::before {
        content: "•";
        position: absolute;
        left: 0;
        top: 0;
        color: #999;
      }

      .sub-text {
        font-size: 13px;
        color: #888;
        margin-bottom: 10px;
      }

      /* 비밀번호 입력 섹션 */
      .confirm-section {
        margin-top: 40px;
        border-top: 1px solid #eee;
        padding-top: 30px;
      }

      .confirm-section h4 {
        font-size: 16px;
        font-weight: 700;
        margin-bottom: 20px;
      }

      .password-input-box {
        display: flex;
        align-items: center;
        background-color: #f8f8f8;
        padding: 20px;
        border: 1px solid #ddd;
      }

      .password-input-box label {
        font-weight: 700;
        width: 100px;
        font-size: 14px;
      }

      .password-input-box input {
        flex: 1;
        height: 40px;
        border: 1px solid #ddd;
        padding: 0 10px;
        font-size: 14px;
        outline: none;
      }

      .password-input-box input:focus {
        border-color: #3e2675;
      }

      /* 버튼 그룹 */
      .btn-group {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-top: 40px;
      }

      .btn-group button {
        width: 100px;
        height: 45px;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
        border: 1px solid #ddd;
      }

      .btn-cancel {
        background-color: white;
        color: #3e2675;
        border-color: #3e2675;
      }

      .btn-withdraw {
        background-color: #ccc;
        color: white;
        border: none;
      }

      /* 모달 스타일 */
      .modal-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 1000;
        justify-content: center;
        align-items: center;
      }

      .modal-container {
        background-color: white;
        width: 400px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        overflow: hidden;
      }

      .modal-header {
        background-color: #3e2675;
        color: white;
        padding: 15px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: 700;
        font-size: 16px;
      }

      .modal-header i {
        cursor: pointer;
      }

      .modal-body {
        padding: 40px 20px;
        text-align: center;
      }

      .modal-body p {
        font-size: 16px;
        margin-bottom: 30px;
        color: #333;
      }

      .btn-confirm {
        background-color: #3e2675;
        color: white;
        border: none;
        padding: 10px 30px;
        font-size: 14px;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <!-- 헤더 -->
    <jsp:include page="../../fragments/header.jsp" />
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
            <a href="#">나의 2GV</a>
            <span class="breadcrumb-separator">></span>
          </li>
          <li>
            <span class="current">회원탈퇴</span>
          </li>
        </ol>
      </div>
    </nav>

    <!-- 메인 컨텐츠 -->
    <div class="container">
      <div class="page-wrap">
        <!-- 사이드바 -->
        <% request.setAttribute("activeMenu", "profile"); %> <%@ include
        file="../../fragments/sideFrame.jsp" %>

        <!-- 메인 컨텐츠 -->
        <main class="main-content">
          <div class="page-title">회원탈퇴</div>

          <div class="withdraw-guide">
            <p class="guide-intro">
              [주의] 메가박스 회원탈퇴를 신청하기 전에 안내 사항을 꼭
              확인해주세요.
            </p>

            <div class="guide-section">
              <h4>1. 30일간 회원 재가입이 불가능합니다.</h4>
              <ul>
                <li>회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.</li>
              </ul>
            </div>

            <div class="guide-section">
              <h4>2. 다음에 경우에 회원 탈퇴가 제한됩니다.</h4>
              <ul>
                <li>영화예매 내역이 있는 경우</li>
                <li>모바일오더 주문건이 있는 경우</li>
                <li>기명식 기프트카드 잔액이 있을 경우</li>
                <li>기명식 기프트카드가 카드정지 상태인 경우</li>
                <li>기명식 기프트카드 환불신청이 진행중인 경우</li>
              </ul>
            </div>

            <div class="guide-section">
              <h4>3. 탈퇴 후 삭제 내역</h4>
              <p class="sub-text">
                (회원 탈퇴하시면 회원정보와 개인 보유 포인트 등 정보가 삭제되며
                데이터는 복구되지 않습니다.)
              </p>
              <ul>
                <li>메가박스 멤버십 포인트 및 적립/차감 내역</li>
                <li>관람권 및 쿠폰</li>
                <li>영화 관람 내역</li>
                <li>간편 로그인 연동 정보</li>
              </ul>
            </div>

            <div class="confirm-section">
              <h4>
                4. 회원님의 비밀번호를 입력하시고 [탈퇴] 버튼을 클릭해주세요.
              </h4>
              <div class="password-input-box">
                <label for="user-pw">비밀번호</label>
                <input type="password" id="user-pw" />
              </div>
            </div>

            <div class="btn-group">
              <button class="btn-cancel">취소</button>
              <button class="btn-withdraw" id="btn-withdraw">탈퇴</button>
            </div>
          </div>
        </main>
      </div>
    </div>

    <!-- 탈퇴 완료 모달 -->
    <div class="modal-overlay" id="withdraw-modal">
      <div class="modal-container">
        <div class="modal-header">
          <span>알림</span>
          <i class="fa-solid fa-xmark close-modal"></i>
        </div>
        <div class="modal-body">
          <p>회원 탈퇴가 완료되었습니다.</p>
          <button class="btn-confirm close-modal">확인</button>
        </div>
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const withdrawBtn = document.getElementById("btn-withdraw");
        const modal = document.getElementById("withdraw-modal");
        const closeButtons = document.querySelectorAll(".close-modal");
        const passwordInput = document.getElementById("user-pw");

        // 탈퇴 버튼 클릭 시
        withdrawBtn.addEventListener("click", function () {
          // 비밀번호 입력 확인 (간단한 유효성 검사)
          if (!passwordInput.value) {
            alert("비밀번호를 입력해주세요.");
            passwordInput.focus();
            return;
          }

          /* 
            [Backend Logic - JSP/Java]
            // 비밀번호 검증 및 탈퇴 처리 로직
          */

          // UI 시연용: 바로 모달 표시
          modal.style.display = "flex";
        });

        // 모달 닫기 버튼들
        closeButtons.forEach((btn) => {
          btn.addEventListener("click", function () {
            modal.style.display = "none";
          });
        });

        // 취소 버튼 클릭 시
        document
          .querySelector(".btn-cancel")
          .addEventListener("click", function () {
            history.back();
          });
      });
    </script>
    <!-- 푸터 -->
    <%@ include file="../../fragments/footer.jsp" %>
  </body>
</html>
