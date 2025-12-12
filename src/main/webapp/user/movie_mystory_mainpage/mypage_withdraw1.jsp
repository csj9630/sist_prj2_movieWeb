<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../../fragments/siteProperty.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원정보 인증 - 2GV</title>
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
         [비밀번호 인증 페이지 전용 스타일]
         ================================================================
      */

      .auth-box {
        border: 1px solid #a385e0; /* 연한 보라색 테두리 */
        padding: 60px 40px;
        text-align: center;
        margin-top: 30px;
        border-radius: 4px;
      }

      .auth-message {
        font-size: 15px;
        font-weight: 700;
        color: #333;
        margin-bottom: 20px;
      }

      .auth-form {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
        margin-bottom: 40px;
      }

      .auth-label {
        font-size: 14px;
        font-weight: 700;
        width: 80px;
        text-align: left;
      }

      .auth-input {
        width: 200px;
        height: 35px;
        border: 1px solid #ddd;
        padding: 0 10px;
        font-size: 14px;
      }

      .btn-auth-check {
        height: 35px;
        padding: 0 15px;
        background-color: #ddd;
        border: 1px solid #ccc;
        color: #666;
        font-size: 13px;
        cursor: pointer;
        transition: background-color 0.2s;
      }

      .btn-auth-check:hover {
        background-color: #ccc;
      }

      /* 하단 버튼 그룹 */
      .btn-group {
        display: flex;
        justify-content: center;
        gap: 10px;
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

      .btn-confirm {
        background-color: #ccc;
        color: white;
        border: none;
      }

      .btn-confirm.active {
        background-color: #3e2675;
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
            <a href="#">나의 2GV</a>
            <span class="breadcrumb-separator">></span>
          </li>
          <li>
            <span class="current">회원정보</span>
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
          <div class="page-title">회원정보</div>

          <div class="auth-box">
            <p class="auth-message">
              회원님의 개인정보 보호를 위해 비밀번호로 인증을 하셔야 합니다.
            </p>

            <div class="auth-form">
              <span class="auth-label">비밀번호</span>
              <input type="password" class="auth-input" id="auth-pw" />
              <button class="btn-auth-check" id="btn-check">인증확인</button>
            </div>

            <div class="btn-group">
              <button class="btn-cancel">취소</button>
              <button class="btn-confirm" id="btn-confirm">확인</button>
            </div>
          </div>
        </main>
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const checkBtn = document.getElementById("btn-check");
        const confirmBtn = document.getElementById("btn-confirm");
        const passwordInput = document.getElementById("auth-pw");

        // 인증확인 버튼 클릭
        checkBtn.addEventListener("click", function () {
          if (!passwordInput.value) {
            alert("비밀번호를 입력해주세요.");
            passwordInput.focus();
            return;
          }

          // 간단한 UI 피드백: 인증 성공 시 확인 버튼 활성화
          alert("인증되었습니다.");
          confirmBtn.classList.add("active");
        });

        // 확인 버튼 클릭 -> 탈퇴 폼 페이지로 이동
        confirmBtn.addEventListener("click", function () {
          if (!this.classList.contains("active")) {
            alert("먼저 비밀번호 인증을 진행해주세요.");
            return;
          }

          // 개인정보 수정 페이지로 이동
          location.href = "mypage_withdraw2.jsp";
        });

        // 취소 버튼
        document
          .querySelector(".btn-cancel")
          .addEventListener("click", function () {
            history.back();
          });
      });
    </script>
    <!-- 푸터 -->
    <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>
  </body>
</html>
