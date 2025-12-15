<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ include file="../../fragments/siteProperty.jsp"%> <%@
    taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- <%@ include
    file="../../fragments/loginChk2.jsp"%> --%>
    <!DOCTYPE html>
    <html lang="ko">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>비밀번호 변경 - 2GV</title>
        <jsp:include page="/fragments/style_css.jsp" />
    
        <jsp:include page="style.jsp" />
    <script type="text/javascript">
      window.onload = function() {
        const submitBtn = document.getElementById("btn-submit");
        const modal = document.getElementById("success-modal");
        const closeButtons = document.querySelectorAll(".close-modal");
        const togglePwIcons = document.querySelectorAll(".toggle-pw");

        // 비밀번호 보기 토글
        togglePwIcons.forEach(function(icon) {
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
        if(submitBtn) {
            submitBtn.addEventListener("click", function () {
              // 실제로는 여기서 유효성 검사 및 서버 전송 로직 필요
              if(modal) modal.style.display = "flex";
            });
        }

        // 모달 닫기
        closeButtons.forEach(function(btn) {
          btn.addEventListener("click", function () {
            if(modal) modal.style.display = "none";
          });
        });
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
    
    <!-- Script moved to head -->
        <!-- 푸터 -->
        <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>
      </body>
    </html>
