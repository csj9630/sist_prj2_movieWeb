<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../fragments/siteProperty.jsp"%>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<title>로그인</title>
<link rel="shortcut icon" href="${commonURL}/resources/images/favicon.ico">
<link rel="stylesheet" href="${commonURL}/resources/css/megabox.min.css" media="all">
<script async="" src="${commonURL}/resources/js/gtm.js.다운로드"></script>
<script type="text/javascript" async="" src="${commonURL}/resources/js/js"></script>
<script async="" src="${commonURL}/resources/js/js(1)"></script>
<script src="${commonURL}/resources/js/megabox.api.min.js"></script>
<script src="${commonURL}/resources/js/megabox.common.min.js"></script>
<script src="${commonURL}/resources/js/ui.common.js"></script>
<script src="${commonURL}/resources/js/front.js"></script>

<style>
    /* === [공통 레이아웃] === */
    body {
        margin: 0;
        background-color: #f9f9f9;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    .main-container-white {
        background-color: white;
        width: 100%;
        flex: 1;
        padding-top: 60px;
        padding-bottom: 60px;
        display: flex;
        justify-content: center;
        align-items: flex-start;
    }

    .wrapper {
        font-family: '맑은 고딕', 'Pretendard', sans-serif;
        background-color: white;
        width: 100%;
        max-width: 480px;
        margin: 0;
        padding: 40px 30px;
        box-sizing: border-box;
        border: 1px solid #eaeaea;
        border-radius: 8px;
    }

    .title { text-align: center; font-size: 24px; font-weight: 700; color: #333; margin-bottom: 30px; }

    .tab-container { display: flex; margin-bottom: 30px; }
    .tab-item { flex: 1; text-align: center; padding: 12px 0; font-size: 15px; text-decoration: none; color: #888; border-bottom: 2px solid #ddd; cursor: default; }
    .tab-item.active { color: #7A5DE8; border-bottom: 2px solid #7A5DE8; font-weight: 600; }

    .form-group { margin-bottom: 15px; }
    
    .form-input {
        width: 100%; height: 50px; padding: 0 15px; font-size: 15px;
        border: none; background-color: #F4F5F7; border-radius: 6px;
        box-sizing: border-box; color: #333; outline: none; transition: box-shadow 0.2s;
    }
    .form-input:focus { box-shadow: 0 0 0 2px #7A5DE8; }

    .btn-submit {
        width: 100%; height: 55px; background-color: #7A5DE8; color: white;
        font-size: 18px; font-weight: 600; border: none; border-radius: 8px;
        cursor: pointer; margin-top: 10px; transition: background-color 0.2s;
    }
    .btn-submit:hover { background-color: #684ac2; }

    .link-container { margin-top: 25px; text-align: center; font-size: 14px; color: #666; }
    .link-container a { text-decoration: none; color: #666; margin: 0 10px; transition: color 0.2s; }
    .link-container a:hover { color: #7A5DE8; font-weight: 600; }
    .divider { color: #ddd; font-size: 12px; }

    /* === 모달(팝업) 스타일 === */
    .modal-overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.4); z-index: 999; justify-content: center; align-items: center; }
    .modal-overlay.show { display: flex; }
    .modal-window { background: white; width: 320px; border-radius: 4px; overflow: hidden; box-shadow: 0 4px 10px rgba(0,0,0,0.2); animation: fadeIn 0.3s ease-out; }
    
    @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }

    .modal-header { background-color: #55359E; color: white; padding: 12px 15px; display: flex; justify-content: space-between; align-items: center; font-weight: 600; }
    .modal-close-btn { background: none; border: none; color: white; font-size: 20px; cursor: pointer; padding: 0; line-height: 1; }
    .modal-body { padding: 30px 20px; text-align: center; font-size: 14px; line-height: 1.6; color: #333; }
    .modal-footer { padding-bottom: 20px; text-align: center; }
    .modal-confirm-btn { background-color: #55359E; color: white; border: none; padding: 8px 25px; border-radius: 4px; cursor: pointer; font-weight: 600; }
</style>
</head>

<body>
    <div class="body-wrap">
        <header id="header">
            <jsp:include page="../../fragments/header.jsp"/>
        </header>

        <div class="page-util">
            <div class="inner-wrap">
                <div class="location">
                    <span>Home</span>
                    <a href="#" title="회원">회원</a>
                    <a href="#" title="로그인">로그인</a>
                </div>
            </div>
        </div>

        <div class="main-container-white">
            <div class="wrapper">
                <h1 class="title">로그인</h1>


                <form id="loginForm" name="loginForm" method="post" action="memberJoinFrmProcess.jsp">
                    <div class="form-group">
                        <input type="text" id="ibxLoginId" class="form-input" placeholder="아이디" title="아이디를 입력하세요">
                    </div>

                    <div class="form-group">
                        <input type="password" id="ibxLoginPwd" class="form-input" placeholder="비밀번호" title="비밀번호를 입력하세요">
                    </div>

                    <button type="button" id="btnLogin" class="btn-submit">로그인</button>

                    <div class="link-container">
                        <a href="memberFindId.jsp">ID 찾기</a>
                        <span class="divider">|</span>
                        <a href="memberFindPw.jsp">PW 찾기</a>
                        <span class="divider">|</span>
                        <a href="memberJoinFrm.jsp">회원가입</a>
                    </div>
                    <div>
                    <a href="${commonURL}/user/booking/quickBookingSeat.jsp">임시 예매페이지</a>
                    </div>
                </form>
            </div>
        </div>

        <div class="modal-overlay" id="loginModal">
            <div class="modal-window">
                <div class="modal-header">
                    <span>알림</span>
                    <button class="modal-close-btn" onclick="closeModal()">✕</button>
                </div>
                <div class="modal-body">
                    로그인 되었습니다.
                </div>
                <div class="modal-footer">
                    <button class="modal-confirm-btn" onclick="closeModal()">확인</button>
                </div>
            </div>
        </div>

        <footer id="footer">
            <jsp:include page="../../fragments/footer.jsp"></jsp:include>
        </footer>
    </div>
    
    <form id="mainForm"></form>

    <script>
        // === 로그인 로직 및 모달 제어 ===
        const btnLogin = document.getElementById('btnLogin');
        const modal = document.getElementById('loginModal');
        const idInput = document.getElementById('ibxLoginId');
        const pwInput = document.getElementById('ibxLoginPwd');

        // 로그인 버튼 클릭 이벤트
        btnLogin.addEventListener('click', function() {
            const idValue = idInput.value.trim();
            const pwValue = pwInput.value.trim();

            // 1. 아이디가 비어있는 경우
            if (idValue === "") {
                alert("아이디를 입력해주세요.");
                idInput.focus();
                return;
            }

            // 2. 비밀번호가 비어있는 경우
            if (pwValue === "") {
                alert("비밀번호를 입력해주세요.");
                pwInput.focus();
                return;
            }

            // 3. 둘 다 값이 있으면 -> 로그인 성공 모달 띄우기
            // (실제 프로젝트에서는 여기서 서버로 form submit을 해야 합니다)
            modal.classList.add('show');
        });

        // 모달 닫기 함수
        function closeModal() {
            modal.classList.remove('show');
            // 로그인 성공 후 메인페이지로 이동하려면 아래 주석 해제
            // location.href = 'main.jsp'; 
        }
    </script>
</body>
</html>