<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ include file="../../fragments/siteProperty.jsp"%> <%@
    taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- <%@ include
    file="../../fragments/loginChk2.jsp"%> --%>
    <!DOCTYPE html>
    <html lang="ko">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>개인정보 수정 - 2GV</title>
        <jsp:include page="/fragments/style_css.jsp" />
    
        <jsp:include page="style.jsp" />
    <script type="text/javascript">
      window.onload = function() {
        const withdrawLinkBtn = document.getElementById("btn-withdraw-link");
        const submitBtn = document.getElementById("btn-submit");
        const modal = document.getElementById("success-modal");
        const closeButtons = document.querySelectorAll(".close-modal");

        // 회원탈퇴 버튼 클릭 -> 탈퇴 신청 페이지로 이동
        if(withdrawLinkBtn) {
            withdrawLinkBtn.addEventListener("click", function () {
              location.href = "mypage_withdraw4.jsp";
            });
        }

        // 비밀번호 변경 버튼 클릭 -> 비밀번호 변경 페이지로 이동
        const pwChangeBtn = document.querySelector("button.btn-small[style*='margin-left: 0']");
        if(pwChangeBtn) {
            pwChangeBtn.addEventListener("click", function () {
                location.href = "mypage_withdraw3.jsp";
            });
        }

        // 등록 버튼 클릭 -> 성공 모달 표시
        if(submitBtn) {
            submitBtn.addEventListener("click", function () {
              // 실제로는 여기서 폼 유효성 검사 및 서버 전송 로직 필요
              if(modal) modal.style.display = "flex";
            });
        }

        // 모달 닫기
        closeButtons.forEach(function(btn) {
          btn.addEventListener("click", function () {
            if(modal) modal.style.display = "none";
          });
        });

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
    
    <!-- Script moved to head -->
        <!-- 푸터 -->
        <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>
      </body>
    </html>
