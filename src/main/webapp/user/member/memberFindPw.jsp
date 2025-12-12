<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="shortcut icon" href="http://localhost/sist_prj2_movieWeb/resources/images/favicon.ico">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../../resources/css/megabox.min.css" media="all">

<style>
    /* === [레이아웃] === */
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

    /* === 내부 요소 스타일 === */
    .title { text-align: center; font-size: 24px; font-weight: 700; color: #333; margin-bottom: 30px; }
    
    .tab-container { display: flex; margin-bottom: 30px; }
    .tab-item { flex: 1; text-align: center; padding: 12px 0; font-size: 15px; text-decoration: none; color: #888; border-bottom: 2px solid #ddd; cursor: pointer; transition: all 0.2s; }
    .tab-item.active { color: #7A5DE8; border-bottom: 2px solid #7A5DE8; font-weight: 600; }

    .form-group { margin-bottom: 20px; }
    .form-label { display: block; font-size: 14px; color: #555; margin-bottom: 8px; font-weight: 500; }
    .form-input { width: 100%; height: 50px; padding: 0 15px; font-size: 15px; border: none; background-color: #F4F5F7; border-radius: 6px; box-sizing: border-box; color: #333; outline: none; }
    .form-input:focus { box-shadow: 0 0 0 2px #7A5DE8; }
    
    .input-with-btn { display: flex; gap: 8px; }
    .input-with-btn .form-input { flex: 1; }
    
    /* 버튼 스타일 */
    .btn-small { width: 80px; height: 50px; border: none; border-radius: 6px; font-size: 13px; font-weight: 600; color: white; cursor: default; transition: background-color 0.2s; }
    
    .btn-gray { background-color: #9aa0a6; } /* 이메일 인증 기본색 */
    .btn-dark { background-color: #6c757d; } /* 인증확인 기본색 */

    /* [활성화] 보라색 스타일 */
    .btn-small.active {
        background-color: #7A5DE8;
        cursor: pointer;
    }

    .auth-code-wrapper { display: flex; align-items: center; gap: 8px; }
    .auth-box-container { display: flex; gap: 4px; flex: 1; justify-content: space-between; }
    .auth-box { width: 100%; height: 50px; text-align: center; font-size: 18px; border: 1px solid #ddd; border-radius: 6px; background-color: #fff; outline: none; padding: 0; }
    .auth-box:focus { border-color: #7A5DE8; box-shadow: 0 0 0 1px #7A5DE8; }

    .password-group { position: relative; }
    .password-icon { position: absolute; right: 15px; top: 50%; transform: translateY(-50%); cursor: pointer; opacity: 0.5; width: 24px; height: 24px; display: flex; align-items: center; justify-content: center; }
    .icon-hide { display: none; }
    .password-icon.view-password .icon-show { display: none; }
    .password-icon.view-password .icon-hide { display: block; }

    .btn-submit { width: 100%; height: 55px; background-color: #7A5DE8; color: white; font-size: 16px; font-weight: 600; border: none; border-radius: 8px; cursor: pointer; margin-top: 10px; }
    .btn-submit:hover { background-color: #684ac2; }

    /* 모달 */
    .modal-overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.4); z-index: 999; justify-content: center; align-items: center; }
    .modal-overlay.show { display: flex; }
    .modal-window { background: white; width: 320px; border-radius: 4px; overflow: hidden; }
    .modal-header { background-color: #55359E; color: white; padding: 12px 15px; display: flex; justify-content: space-between; align-items: center; }
    .modal-close-btn { background: none; border: none; color: white; cursor: pointer; }
    .modal-body { padding: 30px 20px; text-align: center; font-size: 14px; line-height: 1.6; color: #333; }
    .modal-footer { padding-bottom: 20px; text-align: center; }
    .modal-confirm-btn { background-color: #55359E; color: white; border: none; padding: 8px 25px; border-radius: 4px; cursor: pointer; }
</style>
</head>
<body>
    <header id="header"><jsp:include page="../../fragments/header.jsp" /></header>

    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <a href="http://localhost/sist_prj2_movieWeb/user/member/memberLogin.jsp" title="회원">회원</a>
                <a href="#">비밀번호 찾기</a>
            </div>
        </div>
    </div>

    <div class="main-container-white">
        <div class="wrapper">
            <h1 class="title">아이디 / 비밀번호 찾기</h1>

            <div class="tab-container">
                <a href="http://localhost/sist_prj2_movieWeb/user/member/memberFindId.jsp" class="tab-item">아이디 찾기</a>
                <a href="#" class="tab-item active">비밀번호 찾기</a>
            </div>

            <form onsubmit="return false;">
                <div class="form-group">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-input" placeholder="아이디 입력">
                </div>

                <div class="form-group">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-input" placeholder="실제 성명 입력">
                </div>

                <div class="form-group">
                    <label class="form-label">Email</label>
                    <div class="input-with-btn">
                        <input type="email" class="form-input" id="emailInput" placeholder="example.email@gmail.com">
                        <button type="button" class="btn-small btn-gray" id="authReqBtn">인증요청</button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">인증번호</label>
                    <div class="auth-code-wrapper">
                        <div class="auth-box-container">
                            <input type="text" class="auth-box" maxlength="1">
                            <input type="text" class="auth-box" maxlength="1">
                            <input type="text" class="auth-box" maxlength="1">
                            <input type="text" class="auth-box" maxlength="1">
                            <input type="text" class="auth-box" maxlength="1">
                        </div>
                        <button type="button" class="btn-small btn-dark" id="authConfirmBtn">인증확인</button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">새 비밀번호</label>
                    <div class="password-group">
                        <input type="password" class="form-input" placeholder="영문, 숫자, 특수기호를 포함한 8글자 이상">
                        <div class="password-icon">
                            <svg class="icon-show" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                            <svg class="icon-hide" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">비밀번호 확인</label>
                    <div class="password-group">
                        <input type="password" class="form-input" placeholder="영문, 숫자, 특수기호를 포함한 8글자 이상">
                        <div class="password-icon">
                            <svg class="icon-show" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                            <svg class="icon-hide" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn-submit" onclick="showModal()">비밀번호 변경</button>
            </form>
        </div>
    </div>

    <div class="modal-overlay" id="resultModal">
        <div class="modal-window">
            <div class="modal-header"><span>알림</span><button class="modal-close-btn" onclick="closeModal()">✕</button></div>
            <div class="modal-body">비밀번호 변경이 성공적으로 완료되었습니다.<br>로그인 화면으로 이동합니다.</div>
            <div class="modal-footer"><button class="modal-confirm-btn" onclick="closeModal()">확인</button></div>
        </div>
    </div>

    <footer id="footer"><jsp:include page="../../fragments/footer.jsp" /></footer>

    <script>
        // 1. 모달 제어
        function showModal() { document.getElementById('resultModal').classList.add('show'); }
        function closeModal() { document.getElementById('resultModal').classList.remove('show'); }

        // 2. 비밀번호 눈 토글
        document.querySelectorAll('.password-icon').forEach(icon => {
            icon.addEventListener('click', function() {
                const input = this.previousElementSibling;
                if (input.type === 'password') { input.type = 'text'; this.classList.add('view-password'); }
                else { input.type = 'password'; this.classList.remove('view-password'); }
            });
        });

        // 3. [이메일] 입력 시 버튼 활성화
        const emailInput = document.getElementById('emailInput');
        const authReqBtn = document.getElementById('authReqBtn');
        emailInput.addEventListener('input', function() {
            if (this.value.trim().length > 0) {
                authReqBtn.classList.add('active');
                authReqBtn.classList.remove('btn-gray');
            } else {
                authReqBtn.classList.remove('active');
                authReqBtn.classList.add('btn-gray');
            }
        });
     // -----------------------------------------------------------
        // [추가함] 버튼 클릭 시 자바 서블릿 실행 (AJAX)
        // -----------------------------------------------------------
        authReqBtn.addEventListener('click', function() {
            // 버튼이 비활성화(회색) 상태면 클릭 안 되게 막기 (선택사항)
            if (this.classList.contains('btn-gray')) return;

            // 1. 입력한 이메일 가져오기 (이미 선언된 변수 활용)
            const emailVal = emailInput.value;
            
            if(!emailVal) {
                alert("이메일을 입력하세요.");
                return;
            }
            // 2. 서블릿(/quickMail) 찌르기
            // fetch 주소는 본인 프로젝트 이름에 맞게 꼭 확인하세요!
            fetch('/sist_prj2_movieWeb/quickMail', { 
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'email=' + encodeURIComponent(emailVal)
            })
            .then(res => {
                // 성공하면 알림 띄우기
                alert("인증 메일이 발송되었습니다! 메일함을 확인하세요.");
            })
            .catch(err => {
                console.error(err);
                alert("서버 연결 실패");
            });
        });
        // -----------------------------------------------------------
     // 4. [인증번호] 숫자만 입력 & 자동 이동 & 버튼 활성화
        const codeBoxes = document.querySelectorAll('.auth-box');
        const authConfirmBtn = document.getElementById('authConfirmBtn');

        // 인증번호 버튼 상태 업데이트 함수
        function updateAuthBtnState() {
            let allFilled = true;
            codeBoxes.forEach(box => {
                if(box.value.trim() === '') allFilled = false;
            });

            if(allFilled) {
                authConfirmBtn.classList.add('active'); 
                authConfirmBtn.classList.remove('btn-dark'); 
            } else {
                authConfirmBtn.classList.remove('active'); 
                authConfirmBtn.classList.add('btn-dark'); 
            }
        }

        codeBoxes.forEach((box, index) => {
            box.addEventListener('input', (e) => {
                // [핵심] 숫자가 아닌 문자는 아예 입력 안 되게 지워버림 (한글 중복 입력 방지)
                box.value = box.value.replace(/[^0-9]/g, '');

                // 값이 비어있으면(한글이라 지워졌거나 함) 포커스 이동 안 함
                if (box.value === '') {
                    updateAuthBtnState(); // 버튼 상태는 체크
                    return;
                }

                // 한 글자 입력 시 다음 칸으로 이동
                if (box.value.length === 1 && index < codeBoxes.length - 1) {
                    codeBoxes[index + 1].focus();
                }
                
                // 버튼 상태 체크
                updateAuthBtnState();
            });
            
            // 백스페이스 처리
            box.addEventListener('keydown', (e) => {
                if (e.key === 'Backspace') {
                    // 현재 칸이 비어있고, 이전 칸이 있다면 이전 칸으로 이동
                    if (box.value === '' && index > 0) {
                        codeBoxes[index - 1].focus();
                    }
                    setTimeout(updateAuthBtnState, 10);
                }
            });
        });
    </script>
</body>
</html>