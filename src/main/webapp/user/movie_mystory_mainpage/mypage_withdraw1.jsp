<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../fragments/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원정보 인증 - 2GV</title>
    <jsp:include page="/fragments/style_css.jsp" />

    <jsp:include page="mypage_withdraw1_style.jsp" />
    <script type="text/javascript">
      // 초기화
      window.onload = function() {
        // 취소 버튼
        const cancelBtn = document.querySelector(".btn-cancel");
        if(cancelBtn) {
            cancelBtn.addEventListener("click", function () {
                history.back();
            });
        }
        
        // 비밀번호 입력창에서 엔터 키 입력 시 submitAuth 호출
        const passInput = document.querySelector('input[name="pass"]');
        if(passInput) {
            passInput.addEventListener("keypress", function(e) {
                if(e.key === 'Enter') {
                    e.preventDefault(); // 기본 폼 제출 방지
                    submitAuth();
                }
            });
        }
      };

      function submitAuth() {
            const pass = document.querySelector('input[name="pass"]').value;
            if(!pass) {
                alert("비밀번호를 입력해주세요.");
                return;
            }
            document.authForm.submit();
      }
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
        <% request.setAttribute("activeMenu", "profile"); %>
        <%@ include file="../../fragments/sideFrame.jsp" %>

        <!-- 메인 컨텐츠 -->
        <main class="main-content">
          <div class="page-title">회원정보</div>

          <div class="auth-box">
            <p class="auth-message">
              회원님의 개인정보 보호를 위해 비밀번호를 입력해주세요.
            </p>

            <form name="authForm" action="mypage_withdraw1_process.jsp" method="post">
                <div class="auth-form">
                  <span class="auth-label">비밀번호</span>
                  <input type="password" name="pass" class="auth-input" placeholder="비밀번호" />
                  <button type="button" class="btn-auth-check" onclick="submitAuth()">인증</button>
                </div>
            </form>

            <div class="btn-group">
              <button type="button" class="btn-cancel" onclick="history.back()">취소</button>
              <button type="button" class="btn-confirm" onclick="submitAuth()">확인</button>
            </div>
          </div>
        </main>
      </div>
    </div>

    <!-- 푸터 -->
    <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>
  </body>
</html>
