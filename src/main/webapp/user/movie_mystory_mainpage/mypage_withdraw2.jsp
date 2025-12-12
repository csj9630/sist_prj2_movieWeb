<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../../fragments/siteProperty.jsp"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>개인정보 수정 - 2GV</title>
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
         [개인정보 수정 페이지 전용 스타일]
         ================================================================
      */

      .info-guide {
        font-size: 13px;
        color: #666;
        margin-bottom: 20px;
      }

      .form-table {
        width: 100%;
        border-top: 1px solid #333;
        border-bottom: 1px solid #ddd;
        border-collapse: collapse;
        margin-bottom: 40px;
      }

      .form-table th,
      .form-table td {
        padding: 15px;
        border-bottom: 1px solid #eee;
        font-size: 14px;
      }

      .form-table th {
        background-color: #f8f8f8;
        text-align: left;
        width: 140px;
        font-weight: 600;
        color: #333;
        cursor: default;
      }

      .form-table td {
        color: #666;
      }

      .form-input {
        height: 35px;
        border: 1px solid #ddd;
        padding: 0 10px;
        font-size: 13px;
        width: 250px;
        color: #333;
      }

      .form-input:read-only {
        background-color: #f5f5f5;
        color: #999;
      }

      .required {
        color: #e81010;
        margin-left: 3px;
      }

      .phone-group {
        display: flex;
        align-items: center;
        gap: 5px;
      }

      .phone-input {
        width: 80px;
        height: 35px;
        border: 1px solid #ddd;
        padding: 0 10px;
        font-size: 13px;
        text-align: center;
      }

      .btn-small {
        height: 35px;
        padding: 0 15px;
        background-color: white;
        border: 1px solid #ccc;
        color: #333;
        font-size: 13px;
        cursor: pointer;
        margin-left: 10px;
        transition: all 0.2s;
      }

      .btn-small:hover {
        background-color: #f5f5f5;
        border-color: #999;
      }

      /* 회원탈퇴 버튼 (ID 옆) */
      .btn-withdraw-link {
        height: 35px;
        padding: 0 15px;
        background-color: white;
        border: 1px solid #ccc;
        color: #666;
        font-size: 13px;
        cursor: pointer;
        margin-left: 10px;
        transition: all 0.2s;
      }

      .btn-withdraw-link:hover {
        border-color: #3e2675;
        color: #3e2675;
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

      .btn-submit {
        background-color: #3e2675;
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
          <div class="page-title">개인정보 수정</div>

          <p class="info-guide">* 회원님의 정보를 정확히 입력해주세요.</p>

          <table class="form-table">
            <colgroup>
              <col style="width: 140px" />
              <col />
            </colgroup>
            <tbody>
              <tr>
                <th>아이디</th>
                <td>
                  <input
                    type="text"
                    class="form-input"
                    value="ljw02322"
                    readonly
                  />
                  <button class="btn-withdraw-link" id="btn-withdraw-link">
                    회원탈퇴
                  </button>
                </td>
              </tr>
              <tr>
                <th>이름 <span class="required">*</span></th>
                <td>
                  <input type="text" class="form-input" value="이지원" />
                </td>
              </tr>
              <tr>
                <th>생년월일 <span class="required">*</span></th>
                <td>
                  <input
                    type="text"
                    class="form-input"
                    value="2001년 09월 13일"
                    readonly
                  />
                </td>
              </tr>
              <tr>
                <th>휴대폰 <span class="required">*</span></th>
                <td>
                  <div class="phone-group">
                    <input type="text" class="phone-input" value="010" />
                    <span>-</span>
                    <input type="text" class="phone-input" value="9457" />
                    <span>-</span>
                    <input type="text" class="phone-input" value="2249" />
                    <button class="btn-small">인증번호 전송</button>
                  </div>
                </td>
              </tr>
              <tr>
                <th>이메일 <span class="required">*</span></th>
                <td>
                  <input
                    type="text"
                    class="form-input"
                    value="ljw_0232@naver.com"
                    style="width: 300px"
                  />
                </td>
              </tr>
              <tr>
                <th>비밀번호 <span class="required">*</span></th>
                <td>
                  <button class="btn-small" style="margin-left: 0">
                    비밀번호 변경
                  </button>
                </td>
              </tr>
            </tbody>
          </table>

          <div class="btn-group">
            <button class="btn-cancel">취소</button>
            <button class="btn-submit" id="btn-submit">등록</button>
          </div>
        </main>
      </div>
    </div>

    <!-- 수정 완료 모달 -->
    <div class="modal-overlay" id="success-modal">
      <div class="modal-container">
        <div class="modal-header">
          <span>알림</span>
          <i class="fa-solid fa-xmark close-modal"></i>
        </div>
        <div class="modal-body">
          <p>회원 정보 수정이 성공적으로 완료되었습니다.</p>
          <button class="btn-confirm close-modal">확인</button>
        </div>
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const withdrawLinkBtn = document.getElementById("btn-withdraw-link");
        const submitBtn = document.getElementById("btn-submit");
        const modal = document.getElementById("success-modal");
        const closeButtons = document.querySelectorAll(".close-modal");

        // 회원탈퇴 버튼 클릭 -> 탈퇴 신청 페이지로 이동
        withdrawLinkBtn.addEventListener("click", function () {
          location.href = "mypage_withdraw4.jsp";
        });

        // 비밀번호 변경 버튼 클릭 -> 비밀번호 변경 페이지로 이동
        document
          .querySelector("button.btn-small[style*='margin-left: 0']")
          .addEventListener("click", function () {
            location.href = "mypage_withdraw3.jsp";
          });

        // 등록 버튼 클릭 -> 성공 모달 표시
        submitBtn.addEventListener("click", function () {
          // 실제로는 여기서 폼 유효성 검사 및 서버 전송 로직 필요
          modal.style.display = "flex";
        });

        // 모달 닫기
        closeButtons.forEach((btn) => {
          btn.addEventListener("click", function () {
            modal.style.display = "none";
          });
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
