<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="shortcut icon" href="http://localhost/sist_prj2_movieWeb/resources/images/favicon.ico">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../../resources/css/megabox.min.css" media="all">
<style>
    /* === [통일된 레이아웃] === */
    body {
        margin: 0;
        background-color: #f9f9f9; /* 기본 배경(회색) */
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    /* 중간 흰색 영역 (위치 고정의 핵심) */
    .main-container-white {
        background-color: white;
        width: 100%;
        flex: 1; /* 남은 공간 채우기 */
        
        /* ★중요★: 카드 길이에 상관없이 무조건 위에서 60px 띄움 */
        padding-top: 60px; 
        padding-bottom: 60px;
        
        display: flex;
        justify-content: center; /* 가로 중앙 정렬 */
        align-items: flex-start; /* 세로 상단 정렬 (이게 없으면 길이가 다를 때 흔들림) */
    }

    /* 카드 스타일 */
    .wrapper {
        font-family: '맑은 고딕', 'Pretendard', sans-serif;
        background-color: white;
        width: 100%;
        max-width: 480px;
        margin: 0; /* 마진 0으로 고정 (위치 제어는 부모가 함) */
        padding: 40px 30px;
        box-sizing: border-box;
        border: 1px solid #eaeaea;
        border-radius: 8px;
        /* box-shadow: 0 4px 10px rgba(0,0,0,0.05); */
    }

    /* === 내부 요소 스타일 (두 파일 공통) === */
    .title { text-align: center; font-size: 24px; font-weight: 700; color: #333; margin-bottom: 30px; }
    
    .tab-container { display: flex; margin-bottom: 30px; }
    .tab-item { flex: 1; text-align: center; padding: 12px 0; font-size: 15px; text-decoration: none; color: #888; border-bottom: 2px solid #ddd; cursor: pointer; transition: all 0.2s; }
    .tab-item.active { color: #7A5DE8; border-bottom: 2px solid #7A5DE8; font-weight: 600; }

    .form-group { margin-bottom: 20px; }
    .form-label { display: block; font-size: 14px; color: #555; margin-bottom: 8px; font-weight: 500; }
    .form-input { width: 100%; height: 50px; padding: 0 15px; font-size: 15px; border: none; background-color: #F4F5F7; border-radius: 6px; box-sizing: border-box; color: #333; outline: none; }
    .form-input:focus { box-shadow: 0 0 0 2px #7A5DE8; }

    .btn-submit { width: 100%; height: 55px; background-color: #7A5DE8; color: white; font-size: 16px; font-weight: 600; border: none; border-radius: 8px; cursor: pointer; margin-top: 10px; }
    .btn-submit:hover { background-color: #684ac2; }

    /* 모달 스타일 */
    .modal-overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.4); z-index: 999; justify-content: center; align-items: center; }
    .modal-overlay.show { display: flex; }
    .modal-window { background: white; width: 320px; border-radius: 4px; overflow: hidden; }
    .modal-header { background-color: #55359E; color: white; padding: 12px 15px; display: flex; justify-content: space-between; align-items: center; font-weight: 600; }
    .modal-close-btn { background: none; border: none; color: white; font-size: 20px; cursor: pointer; }
    .modal-body { padding: 30px 20px; text-align: center; font-size: 14px; line-height: 1.6; color: #333; }
    .modal-footer { padding-bottom: 20px; text-align: center; }
    .modal-confirm-btn { background-color: #55359E; color: white; border: none; padding: 8px 25px; border-radius: 4px; cursor: pointer; font-weight: 600; }
</style>
</head>
<body>
    <header id="header"><jsp:include page="../../fragments/header.jsp" /></header>

    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <a href="http://localhost/sist_prj2_movieWeb/user/member/member_login.jsp" title="회원">회원</a>
                <a href="#">아이디 찾기</a>
            </div>
        </div>
    </div>

    <div class="main-container-white">
        <div class="wrapper">
            <h1 class="title">아이디 / 비밀번호 찾기</h1>

            <div class="tab-container">
                <a href="#" class="tab-item active">아이디 찾기</a>
                <a href="http://localhost/sist_prj2_movieWeb/user/member/member_find_pw.jsp" class="tab-item">비밀번호 찾기</a>
            </div>

            <form onsubmit="return false;">
                <div class="form-group">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-input" placeholder="실제 성명 입력">
                </div>

                <div class="form-group">
                    <label class="form-label">생년월일</label>
                    <input type="text" class="form-input" placeholder="0000 - 00 - 00">
                </div>

                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-input" placeholder="example.email@gmail.com">
                </div>
                
                <div class="form-group">
                    <label class="form-label">휴대폰 번호</label>
                    <input type="tel" class="form-input" placeholder="010-1234-5678">
                </div>

                <button type="submit" class="btn-submit" onclick="showModal()">아이디 찾기</button>
            </form>
        </div>
    </div>

    <div class="modal-overlay" id="resultModal">
        <div class="modal-window">
            <div class="modal-header"><span>알림</span><button class="modal-close-btn" onclick="closeModal()">✕</button></div>
            <div class="modal-body">회원님의 아이디는 <b>[testid11**]</b> 입니다.<br>가입일 : 2023-01-28</div>
            <div class="modal-footer"><button class="modal-confirm-btn" onclick="closeModal()">확인</button></div>
        </div>
    </div>

    <footer id="footer"><jsp:include page="../../fragments/footer.jsp" /></footer>

    <script>
        function showModal() { document.getElementById('resultModal').classList.add('show'); }
        function closeModal() { document.getElementById('resultModal').classList.remove('show'); }
    </script>
</body>
</html>