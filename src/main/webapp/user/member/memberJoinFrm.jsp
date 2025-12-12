<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<title>2GV, 회원가입</title>
<link rel="shortcut icon" href="http://localhost/sist_prj2_movieWeb/resources/images/favicon.ico">
<link rel="stylesheet" href="../../resources/css/megabox.min.css" media="all">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<style>
/* === 기본 설정 === */
.signup-wrapper {
    font-family: '맑은 고딕', 'Malgun Gothic', sans-serif;
    background-color: white;
    width: 100%;
    max-width: 480px;
    margin: 0 auto;
    padding: 40px 20px;
    box-sizing: bo	rder-box;
    border: 1px solid #eaeaea;
    border-radius: 8px;
}

.signup-title {
    text-align: center;
    font-size: 28px;
    font-weight: 700;
    color: #333;
    margin-bottom: 40px;
}

.form-group {
    margin-bottom: 20px;
}

.form-label {
    display: block;
    font-size: 14px;
    color: #555;
    margin-bottom: 8px;
    font-weight: 500;
}

/* === 인풋 박스 스타일 === */
.form-input {
    width: 100%;
    height: 50px;
    padding: 0 15px;
    font-size: 15px;
    border: none;
    background-color: #F4F5F7;
    border-radius: 6px;
    box-sizing: border-box;
    color: #333;
    outline: none;
    transition: box-shadow 0.2s;
}

.form-input::placeholder {
    color: #adb5bd;
}

.form-input:focus {
    box-shadow: 0 0 0 2px #7A5DE8;
}

/* === 아이디 중복확인 그룹 === */
.id-group {
    display: flex;
    gap: 10px;
}

.btn-check {
    width: 100px;
    background-color: #c4c8d0;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: default;
    flex-shrink: 0;
    transition: background-color 0.2s, transform 0.1s;
}

.btn-check.active {
    background-color: #7A5DE8;
    cursor: pointer;
}

.btn-check.active:active {
    background-color: #684ac2;
    transform: scale(0.96);
}

/* === 비밀번호 그룹 (눈 아이콘) === */
.password-group {
    position: relative;
}

.password-icon {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    opacity: 0.5;
    width: 24px;
    height: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: opacity 0.2s;
}

.password-icon:hover {
    opacity: 1;
}

.icon-hide {
    display: none;
}

.password-icon.view-password .icon-show {
    display: none;
}

.password-icon.view-password .icon-hide {
    display: block;
}

/* === 약관 동의 === */
.terms-group {
    display: flex;
    align-items: center;
    margin: 25px 0;
    font-size: 14px;
    color: #333;
}

.terms-checkbox {
    width: 18px;
    height: 18px;
    margin-right: 10px;
    accent-color: #7A5DE8;
    cursor: pointer;
}

.terms-link {
    color: #7A5DE8;
    text-decoration: none;
    margin-left: 4px;
}

/* === 가입하기 버튼 === */
.btn-submit {
    width: 100%;
    height: 55px;
    background-color: #7A5DE8;
    color: white;
    font-size: 18px;
    font-weight: 600;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.2s;
}

.btn-submit:hover {
    background-color: #684ac2;
}

/* === 모달 팝업 스타일 === */
.modal-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4);
    z-index: 9999;
    justify-content: center;
    align-items: center;
}

.modal-overlay.show {
    display: flex;
}

.modal-window {
    background: white;
    width: 320px;
    border-radius: 4px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    overflow: hidden;
    animation: fadeIn 0.3s ease-out;
}

/* [수정됨] CSS 문법 오류 수정 (@와 keyframes 붙임) */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

.modal-header {
    background-color: #55359E;
    padding: 12px 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
    font-weight: 600;
    font-size: 16px;
}

.modal-close-btn {
    background: none;
    border: none;
    color: white;
    font-size: 20px;
    cursor: pointer;
    padding: 0;
    line-height: 1;
}

.modal-body {
    padding: 30px 20px;
    text-align: center;
    font-size: 14px;
    color: #333;
    line-height: 1.6;
}

.modal-footer {
    padding-bottom: 20px;
    text-align: center;
}

.modal-confirm-btn {
    background-color: #55359E;
    color: white;
    border: none;
    padding: 8px 25px;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    font-weight: 600;
    transition: background-color 0.2s;
}

.modal-confirm-btn:hover {
    background-color: #442a80;
}
</style>
<script type="text/javascript">
$(function(){
	$("#btnCheck").click(function(){
		findId();
	});
	/* $("#btn").click(function(){
		//유효성 검증 후
		$("#joinFrm").submit(); //값을 back-end로 전송
	});//click */
	
	//이벤트 처리
	function findId(){
		//alert( window.screenX+ " / "+window.screenY)
		window.open("checkId.jsp?id="+$("#id").val(),"idWin",
			"width=515,height=405,top="+(window.screenY+150)
			+",left="+(window.screenX+200));
	}
	
	//중복체크 처리를 진행했는지 확인 후 하지 않았다면 중복 확인을 하라고 시킴.
	$("#btn").click(function(){
	    var isChecked = $("#isIdChecked").val();
	    
	    if (isChecked != 'true') { // 혹은 'Y'
	        alert("아이디 중복 확인을 완료해 주세요.");
	        return;
	    }
	    
	    // 중복 확인이 완료되었으므로 폼 제출 진행
	    $("#joinFrm").submit(); 
	});
	
	$("#id").on("input", function() {
        // 아이디 값이 변경되면 중복 체크 상태를 초기화
        $("#isIdChecked").val('false');
        $("#idCheckMsg").html(''); // 메시지 지우기
        $("#id").prop('disabled', false); // 혹시 비활성화되어 있었다면 다시 활성화
        $("#btnCheck").prop('disabled', false); // 버튼 활성화
        // 이 외에도 중복확인 버튼의 스타일 (active 클래스) 등을 재조정해야 합니다.
    });
	
	//비밀번호 유효성 검사
	function validatePassword(password) {
	    // 영문, 숫자 포함, 8자리 이상 정규표현식
	    var regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d\W]{8,}$/;
	    
	    // 비밀번호가 공백이거나 정규표현식에 맞지 않으면 false 반환
	    if (password.trim() === "") {
	        return false;
	    }
	    return regex.test(password);
	}//validatePassword
	
	
});//ready
</script>

</head>

<body>
    <div class="body-wrap">
        <header id="header">
            <jsp:include page="../../fragments/header.jsp" />
        </header>

        <div class="page-util">
            <div class="inner-wrap">
                <div class="location">
                    <span>Home</span>
                    <a href="http://localhost/sist_prj2_movieWeb/user/member/memberLogin.jsp" title="회원">회원</a>
                    <a href="#" title="회원가입">회원가입</a>
                </div>
            </div>
        </div>

        <div class="signup-wrapper" style="margin-bottom: 40px; margin-top: 40px;">
            <h1 class="signup-title">회원가입</h1>

            <form id="joinFrm" name="joinFrm" method="POST" action="memberJoinFrmProcess.jsp">
		<!-- 중복확인 절차를 진행 했는지 확인하기 위한 input -->
				<input type="hidden" name="isIdChecked" id="isIdChecked" value="false">
                <div class="form-group">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-input" name="name" placeholder="실제 성명 입력">
                </div>

                <div class="form-group">
                    <label class="form-label">생년월일</label>
                    <input type="date" class="form-input" name="birth"  placeholder="0000 - 00 - 00" max="9999-12-31" min="1900-01-01">
                </div>

                <div class="form-group">
                    <label class="form-label">아이디</label>
                    <div class="id-group">
                        <input type="text" class="form-input" id="id" placeholder="아이디 입력" name="id">
                        <input type="button" class="btn-check" id="btnCheck" value="중복 확인"/>
                    </div>
                    <div id="idCheckMsg" style="font-size: 13px; color: gray; margin-top: 5px;"></div>
                </div>

                <div class="form-group">
                    <label class="form-label">비밀번호</label>
                    <div class="password-group">
                        <input type="password" name="password" class="form-input" placeholder="영문, 숫자, 특수기호를 포함한 8글자 이상">
                        <div class="password-icon">
                            <svg class="icon-show" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                            <svg class="icon-hide" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">비밀번호 확인</label>
                    <div class="password-group">
                        <input type="password" class="form-input" name="chkPassword" placeholder="영문, 숫자, 특수기호를 포함한 8글자 이상">
                        <div class="password-icon">
                            <svg class="icon-show" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                            <svg class="icon-hide" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="text" class="form-input" name="mail" placeholder="example" style="width:50%;">@
                    <select name="domain" class="form-input" style="width:45%;">
			<option value="google.com">google.com</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="hotmail.com">hotmail.com</option>
			</select>
                </div>

                <div class="form-group">
                    <label class="form-label">휴대폰 번호</label>
                    <input type="tel" name="phone" class="form-input" placeholder="010-1234-5678">
                </div>

                <div class="terms-group">
                    <input type="checkbox" class="terms-checkbox" id="terms" checked>
                    <label for="terms">By signing up, I agree with the <a href="#" class="terms-link">Privacy Policy</a></label>
                </div>
				<input type="button" value="회원가입" class="btn-submit" id="btn"/>
            </form>
        </div>
	
        <div class="modal-overlay" id="signupModal">
            <div class="modal-window">
                <div class="modal-header">
                    <span>알림</span>
                    <button class="modal-close-btn" onclick="closeModal()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                    </button>
                </div>
                <div class="modal-body">
                    회원가입이 성공적으로 완료되었습니다.<br> 로그인 화면으로 이동합니다.
                </div>
                <div class="modal-footer">
                    <button class="modal-confirm-btn" onclick="closeModal()">확인</button>
                </div>
            </div>
        </div>

        <div class="quick-area">
            <a href="#" class="btn-go-top" title="top">top</a>
        </div>

        <footer id="footer">
            <jsp:include page="../../fragments/footer.jsp"></jsp:include>
        </footer>
    </div>

<script>
    // === 1. 아이디 입력 감지 및 버튼 활성화 ===
    const idInput = document.getElementById('id');
    const checkBtn = document.getElementById('btnCheck');

    if(idInput && checkBtn) {
        idInput.addEventListener('input', function() {
            if (this.value.trim().length > 0) {
                checkBtn.classList.add('active');
            } else {
                checkBtn.classList.remove('active');
            }
        });

        checkBtn.addEventListener('click', function() {
            if (!this.classList.contains('active')) return; 
            if (idInput.value.trim() !== "") {
                alert("사용 가능한 아이디입니다.");
            } else {
                alert("아이디를 입력해주세요.");
                idInput.focus();
            }
        });
    }

    // === 2. 비밀번호 눈 모양 토글 ===
    const passwordIcons = document.querySelectorAll('.password-icon');
    passwordIcons.forEach(iconBtn => {
        iconBtn.addEventListener('click', function() {
            const inputField = this.previousElementSibling;
            if (inputField && inputField.tagName === 'INPUT') {
                const currentType = inputField.getAttribute('type');
                if (currentType === 'password') {
                    inputField.setAttribute('type', 'text');
                    this.classList.add('view-password');
                } else {
                    inputField.setAttribute('type', 'password');
                    this.classList.remove('view-password');
                }
            }
        });
    });

    // === 3. 모달 팝업 제어 ===
    const signupBtn = document.getElementById('btnSignup');
    const modal = document.getElementById('signupModal');

    if(signupBtn && modal) {
        signupBtn.addEventListener('click', function(e) {
            e.preventDefault(); 
            modal.classList.add('show'); 
        });
    }

    function closeModal() {
        if(modal) modal.classList.remove('show');
    }
</script>

</body>
</html>