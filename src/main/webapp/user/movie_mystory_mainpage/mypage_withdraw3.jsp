<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../../fragments/siteProperty.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>비밀번호 변경 - 2GV</title>
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
         [비밀번호 변경 페이지 전용 스타일]
         ================================================================
      */

      .pw-change-box {
        max-width: 600px;
        margin: 50px auto;
      }

      .pw-change-title {
        text-align: center;
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 40px;
        color: #333;
      }

      .input-group {
        margin-bottom: 20px;
      }

      .input-label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        color: #666;
        margin-bottom: 8px;
      }

      .input-wrapper {
        position: relative;
        width: 100%;
      }

      .input-field {
        width: 100%;
        height: 45px;
        border: 1px solid #ddd;
        padding: 0 40px 0 15px; /* 오른쪽 패딩은 아이콘 공간 */
        font-size: 14px;
        background-color: #f8f8f8;
        border-radius: 4px;
        outline: none;
      }

      .input-field::placeholder {
        color: #aaa;
      }

      .input-field:focus {
        border-color: #3e2675;
        background-color: white;
      }

      .toggle-pw {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #aaa;
        cursor: pointer;
      }

      .btn-submit-wrap {
        margin-top: 40px;
        text-align: center;
      }

      .btn-submit {
        background-color: #8b62d8; /* 이미지의 보라색 버튼 색상 */
        color: white;
        border: none;
        width: 150px;
        height: 45px;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.2s;
      }

      .btn-submit:hover {
        background-color: #7a52c7;
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
            <span class="current">개인정보 수정</span>
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
          <div class="pw-change-box">
            <h2 class="pw-change-title">비밀번호 변경</h2>

            <div class="input-group">
              <label class="input-label">새 비밀번호</label>
              <div class="input-wrapper">
                <input
                  type="password"
                  class="input-field"
                  placeholder="영문, 숫자, 특수기호를 포함한 8글자 이상"
                />
                <i class="fa-regular fa-eye-slash toggle-pw"></i>
              </div>
            </div>

            <div class="input-group">
              <label class="input-label">비밀번호 확인</label>
              <div class="input-wrapper">
                <input
                  type="password"
                  class="input-field"
                  placeholder="영문, 숫자, 특수기호를 포함한 8글자 이상"
                />
                <i class="fa-regular fa-eye-slash toggle-pw"></i>
              </div>
            </div>

            <div class="btn-submit-wrap">
              <button class="btn-submit" id="btn-submit">비밀번호 변경</button>
            </div>
          </div>
        </main>
      </div>
    </div>

    <!-- 변경 완료 모달 -->
    <div class="modal-overlay" id="success-modal">
      <div class="modal-container">
        <div class="modal-header">
          <span>알림</span>
          <i class="fa-solid fa-xmark close-modal"></i>
        </div>
        <div class="modal-body">
          <p>비밀번호 변경이 성공적으로 완료되었습니다.</p>
          <button class="btn-confirm close-modal">확인</button>
        </div>
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const submitBtn = document.getElementById("btn-submit");
        const modal = document.getElementById("success-modal");
        const closeButtons = document.querySelectorAll(".close-modal");
        const togglePwIcons = document.querySelectorAll(".toggle-pw");

        // 비밀번호 보기 토글
        togglePwIcons.forEach((icon) => {
          icon.addEventListener("click", function () {
            const input = this.previousElementSibling;
            if (input.type === "password") {
              input.type = "text";
              this.classList.remove("fa-eye-slash");
              this.classList.add("fa-eye");
            } else {
              input.type = "password";
              this.classList.remove("fa-eye");
              this.classList.add("fa-eye-slash");
            }
          });
        });

        // 변경 버튼 클릭 -> 성공 모달 표시
        submitBtn.addEventListener("click", function () {
          // 실제로는 여기서 유효성 검사 및 서버 전송 로직 필요
          modal.style.display = "flex";
        });

        // 모달 닫기
        closeButtons.forEach((btn) => {
          btn.addEventListener("click", function () {
            modal.style.display = "none";
          });
        });
      });
    </script>
    <!-- 푸터 -->
    <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>
  </body>
</html>
