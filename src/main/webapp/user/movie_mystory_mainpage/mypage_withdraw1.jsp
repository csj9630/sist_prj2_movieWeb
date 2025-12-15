<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ include file="../../fragments/siteProperty.jsp"%> <%@
    taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- <%@ include
    file="../../fragments/loginChk2.jsp"%> --%>
    <!DOCTYPE html>
    <html lang="ko">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>회원정보 인증 - 2GV</title>
        <jsp:include page="/fragments/style_css.jsp" />
    
        <jsp:include page="style.jsp" />
    <script type="text/javascript">
      // 초기화
      window.onload = function() {
        const checkBtn = document.getElementById("btn-check");
        const confirmBtn = document.getElementById("btn-confirm");
        const passwordInput = document.getElementById("auth-pw");

        // 인증확인 버튼 클릭
        if(checkBtn) {
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
        }

        // 확인 버튼 클릭 -> 탈퇴 폼 페이지로 이동
        if(confirmBtn) {
            confirmBtn.addEventListener("click", function () {
              if (!this.classList.contains("active")) {
                alert("먼저 비밀번호 인증을 진행해주세요.");
                return;
              }
              // 개인정보 수정 페이지로 이동
              location.href = "mypage_withdraw2.jsp";
            });
        }

        // 취소 버튼
        const cancelBtn = document.querySelector(".btn-cancel");
        if(cancelBtn) {
            cancelBtn.addEventListener("click", function () {
                history.back();
            });
        }
      };
    </script>
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
    
        <!-- Script moved to head -->
        <!-- 푸터 -->
        <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>
      </body>
    </html>
