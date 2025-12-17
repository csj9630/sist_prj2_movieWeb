<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../fragments/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="MovieWithdraw.MovieWithdrawDAO" %>
<%@ page import="MovieWithdraw.MovieWithdrawDTO" %>
<%
    // 로그인 체크 및 데이터 조회
    String userId = (String)session.getAttribute("userId");
    if(userId == null) userId = "test1"; // 테스트용

    MovieWithdrawDAO dao = MovieWithdrawDAO.getInstance();
    MovieWithdrawDTO dto = dao.selectUser(userId);

    String email = "";
    if(dto != null && dto.getEmail() != null) email = dto.getEmail();
    String[] emailParts = email.split("@");
    String email1 = (emailParts.length > 0) ? emailParts[0] : "";
    String email2 = (emailParts.length > 1) ? emailParts[1] : "";

    String phone = "";
    if(dto != null && dto.getPhone_num() != null) phone = dto.getPhone_num();
    String[] phoneParts = phone.split("-");
    String phone1 = (phoneParts.length > 0) ? phoneParts[0] : "";
    String phone2 = (phoneParts.length > 1) ? phoneParts[1] : "";
    String phone3 = (phoneParts.length > 2) ? phoneParts[2] : "";
%>
<!DOCTYPE html>	
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>개인정보 수정 - 2GV</title>
    <jsp:include page="/fragments/style_css.jsp" />

    <jsp:include page="mypage_withdraw2_style.jsp" />
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
        const pwChangeBtn = document.getElementById("btn-pw-change");
        if(pwChangeBtn) {
            pwChangeBtn.addEventListener("click", function () {
                location.href = "mypage_withdraw3.jsp";
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
        <% request.setAttribute("activeMenu", "profile"); %>
        <%@ include file="../../fragments/sideFrame.jsp" %>

        <!-- 메인 컨텐츠 -->
        <main class="main-content">
          <div class="page-title">개인정보 수정</div>

          <p class="info-guide">* 회원님의 정보를 정확히 입력해주세요.</p>

          <form name="updateForm" action="mypage_withdraw2_process.jsp" method="post">
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
                    value="<%= dto != null ? dto.getUsers_id() : "" %>"
                    readonly
                  />
                  <button type="button" class="btn-withdraw-link" id="btn-withdraw-link">
                    회원탈퇴
                  </button>
                </td>
              </tr>
              <tr>
                <th>이름 <span class="required">*</span></th>
                <td>
                  <input type="text" class="form-input" value="<%= dto != null ? dto.getUsers_name() : "" %>" readonly style="background-color: #f0f0f0;" />
                </td>
              </tr>
              <tr>
                <th>생년월일 <span class="required">*</span></th>
                <td>
                  <input
                    type="text"
                    class="form-input"
                    value="<%= dto != null ? dto.getBirth() : "" %>"
                    readonly
                  />
                </td>
              </tr>
              <tr>
                <th>휴대폰 <span class="required">*</span></th>
                <td>
                  <div class="phone-group">
                    <input type="text" name="phone1" class="phone-input" value="<%= phone1 %>" />
                    <span>-</span>
                    <input type="text" name="phone2" class="phone-input" value="<%= phone2 %>" />
                    <span>-</span>
                    <input type="text" name="phone3" class="phone-input" value="<%= phone3 %>" />
                    <button type="button" class="btn-small" onclick="alert('인증번호가 전송되었습니다.')">인증번호 전송</button>
                  </div>
                </td>
              </tr>
              <tr>
                <th>이메일 <span class="required">*</span></th>
                <td>
                  <input type="text" name="email1" class="form-input" value="<%= email1 %>" style="width: 120px" />
                  @
                  <input type="text" name="email2" class="form-input" value="<%= email2 %>" style="width: 120px" />
                </td>
              </tr>
              <tr>
                <th>비밀번호 <span class="required">*</span></th>
                <td>
                  <button type="button" class="btn-small" style="margin-left: 0" id="btn-pw-change">
                    비밀번호 변경
                  </button>
                </td>
              </tr>
            </tbody>
          </table>

          <div class="btn-group">
            <button type="button" class="btn-cancel" onclick="history.back()">취소</button>
            <button type="button" class="btn-submit" onclick="document.updateForm.submit()">등록</button>
          </div>
          </form>
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

    <!-- 푸터 -->
    <div id="footer"><%@ include file="../../fragments/footer.jsp" %></div>
  </body>
</html>
