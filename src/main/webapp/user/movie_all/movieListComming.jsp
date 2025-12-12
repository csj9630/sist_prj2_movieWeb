<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<link rel="shortcut icon" href="http://192.168.10.75/projectMovieBook/index/images/favicon.ico"> <!-- 상단 favicon 이미지  -->
<link rel="stylesheet"
	href="../resources/css/megabox.min.css" media="all"> <!-- 전체적인 css -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style type="text/css">
.bokdBtn {
	width: 230px !important;
	height: 42px !important;
	line-height: 42px !important;
	text-align: center;
	padding: 0 !important;
}
</style>
<script type="text/javascript">
$(function() {
	$(".btnOnAir").click(find);
	$("#btnAddMovie").click(function(){
		
	})
});

function find(){

}
</script>
</head>

<body>
<header id="header">
<jsp:include page="../../fragments/header.jsp"/>
</header>
<div class="container">
	<!-- 좌측 상단 홈/영화/전체영화  -->
	<div class="page-util">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span>
                <a href="#" title="영화 페이지로 이동">영화</a>
                <a href="#" title="전체영화 페이지로 이동">전체영화</a>
			</div>			
		</div>
	</div>

	<!-- contents -->
	<div id="contents" class="">
		<!-- inner-wrap -->
		<div class="inner-wrap">
			<h2 class="tit">전체영화</h2>

			<div class="tab-list fixed">
				<ul id="topMenu">
					<li><a href="movieList.jsp" title="박스오피스 탭으로 이동">박스오피스</a></li>
					<!-- 상영 예정작으로  -->
					<li class="on"><a href="" title="상영예정작 탭으로 이동">상영예정작</a></li>					
				</ul>
			</div>

			<!-- movie-list-util -->
			<div class="movie-list-util mt40">
				<!-- 박스오피스 -->
				<div class="topSort" style="display: block;">

					<div class="onair-condition">
						<button type="button" title="개봉작만 보기" class="btn-onair btnOnAir" onclick="location.href='movieList.jsp?filter=opened'">개봉작만</button>
					</div>
				</div>
				<!--// 박스오피스 -->

				<!-- 상영예정작 -->
				<div class="topSort" style="display: none;">
					<div class="movie-sorting sortTab">
						<span><button type="button" class="btn on" sort-type="rfilmDe">개봉일순</button></span>
						<span><button type="button" class="btn" sort-type="title">가나다순</button></span>
					</div>
				</div>
				<!--// 상영예정작 -->

				<!-- 검색결과 없을 때 -->
				<p class="no-result-count"><strong id="totCnt">160</strong>개의 영화가 검색되었습니다.</p>
				<!--// 검색결과 없을 때 -->

				<div class="movie-search">
					<input type="text" title="영화명을 입력하세요" id="ibxMovieNmSearch" name="ibxMovieNmSearch" placeholder="영화명 검색" class="input-text">
					<button type="button" class="btn-search-input" id="btnSearch">검색</button>
				</div>
			</div>
			<!--// movie-list-util -->

			<!-- 페이지 로딩이 오래 걸리시 나오는 페이지 -->
			<div class="bg-loading" style="display: none;">
				<div class="spinner-border" role="status">
					<span class="sr-only">Loading...</span>
				</div>
			</div>

			<!-- movie-list -->
			<div class="movie-list">
				<ol class="list" id="movieList">
					<li tabindex="0" class="no-img">
						<div class="movie-list-info">
							<!-- 포스터 왼쪽 상단의 순위 -->
							<p class="rank" style="">
								1<span class="ir">위</span>
							</p>
							<!-- 포스터 사진 -->
							<img
								src="./MEET PLAY SHARE, 메가박스_files/YiSbqEf6OvFcDoLoQCipDojOHqMCwKG4_420.jpg"
								alt="주토피아 2" class="poster lozad" onerror="noImg(this)">
							<div class="movie-score">
								<a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn"
									data-no="25089000" title="주토피아 2 상세보기">
									<div class="summary">더 화려해진 세계, 더 넓어진 주토피아! 디즈니의 가~~장
										사랑스러운 콤비 '주디'와 '닉'이 돌아온다! 미스터리한 뱀 ‘게리’가 나타난 순간, 주토피아가 다시 흔들리기
										시작했다! 혼란에 빠진 도시를 구하기 위해 환상의 콤비 ‘주디’ &amp; ‘닉’이 잠입 수사에 나서고 상상 그
										이상의 진실과 위협을 마주하게 되는데...! 11월, 초특급 추적 어드벤처가 펼쳐진다!</div>
									<div class="my-score big">
										<div class="preview">
											<p class="tit">관람평</p>
											<p class="number">
												9.3<span class="ir">점</span>
											</p>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="tit-area">
							<p class="movie-grade age-all">,</p>
							<p title="주토피아 2" class="tit">주토피아 2</p>
						</div>
						<div class="rate-date">
							<span class="rate">예매율 53%</span> <span class="date">개봉일
								2025.11.26</span>
						</div>
						<div class="btn-util">
							<p class="txt movieStat1" style="display: none">상영예정</p>
							<p class="txt movieStat2" style="display: none">11월 개봉예정</p>
							<p class="txt movieStat5" style="display: none">개봉예정</p>
							<p class="txt movieStat6" style="display: none">상영종료</p>
							<div class="case col-2 movieStat3" style="">
								<a href="https://www.megabox.co.kr/movie#"
									class="button purple bokdBtn book-btn" data-no="25089000"
									title="영화 예매하기" style="width:300px">예매</a>
							</div>
							<!-- 상영 예정/예매 오픈 전 -->
							<div class="case movieStat4" style="display: none">
								<a href="https://www.megabox.co.kr/movie#"
									class="button purple bokdBtn" data-no="25089000"
									title="영화 예매하기">예매</a>
							</div>
						</div>
					</li>
					<li tabindex="0" class="no-img"><div class="movie-list-info">
							<p class="rank" style="">
								2<span class="ir">위</span>
							</p>
							<img
								src="./MEET PLAY SHARE, 메가박스_files/DKYhkABpLAlpTChUcbPRDUqBX4r6e5BO_420.jpg"
								alt="위키드: 포 굿" class="poster lozad" onerror="noImg(this)">
							<div class="movie-score" style="opacity: 0;">
								<a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn"
									data-no="25081900" title="위키드: 포 굿 상세보기">
									<div class="summary">“너로 인해 완전히 달라졌어, 내가” 전혀 다르지만 서로에게 가장
										소중한 친구가 된 ‘엘파바’(신시아 에리보)와 ‘글린다’(아리아나 그란데). 쉬즈에서의 마법같았던 둘의 우정은
										오즈의 마법사와 그를 둘러싼 비밀들을 알게 되면서 다른 길을 선택할 수밖에 없게 내몰린다. 사람들의 시선을 더
										이상 두려워하지 않게 된 사악한 마녀 ‘엘파바’와 사람들의 사랑을 받으면서도 모든 걸 잃을까 두려운 착한 마녀
										‘글린다’. 서로 대척점에 서게 된 두 사람은 거대한 여정의 끝에서 운명을 영원히 바꿀 선택을 마주하게 된다.

									</div>
									<div class="my-score big">
										<div class="preview">
											<p class="tit">관람평</p>
											<p class="number">
												8.4<span class="ir">점</span>
											</p>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="tit-area">
							<p class="movie-grade age-all">,</p>
							<p title="위키드: 포 굿" class="tit">위키드: 포 굿</p>
						</div>
						<div class="rate-date">
							<span class="rate">예매율 7%</span> <span class="date">개봉일
								2025.11.19</span>
						</div>
						<div class="btn-util">
							<p class="txt movieStat1" style="display: none">상영예정</p>
							<p class="txt movieStat2" style="display: none">11월 개봉예정</p>
							<p class="txt movieStat5" style="display: none">개봉예정</p>
							<p class="txt movieStat6" style="display: none">상영종료</p>
							<div class="case col-2 movieStat3" style="">
								<a href="https://www.megabox.co.kr/movie#"
									class="button purple bokdBtn" data-no="25081900"
									title="영화 예매하기">예매</a> 
							</div>
							<div class="case movieStat4" style="display: none">
								<a href="https://www.megabox.co.kr/movie#"
									class="button purple bokdBtn" data-no="25081900"
									title="영화 예매하기">예매</a>
							</div>
						</div></li>
					<li tabindex="0" class="no-img"><div class="movie-list-info">
							<p class="rank" style="">
								3<span class="ir">위</span>
							</p>
							<img
								src="./MEET PLAY SHARE, 메가박스_files/QbA0Xu2pYIIskq4gziFxbiq6eL9N2i0w_420.jpg"
								alt="정보원" class="poster lozad" onerror="noImg(this)">
							<div class="movie-score">
								<a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn"
									data-no="25087700" title="정보원 상세보기">
									<div class="summary">“나 오늘 거기 털고 옷 벗는다” 공들인 작전 실패로 강등당한 후
										열정도, 의지도, 수사 감각도 모두 잃은 형사 오남혁. 이제 그가 바라는 것은 오로지 한탕과 은퇴뿐. 밀수
										조직에 심어둔 정보원 조태봉을 이용해 인생 역전을 꿈꾸지만 의리도, 믿음도 없는 조태봉은 숨겨뒀던 돈을 챙겨
										빠르게 손절을 하고, 뒤늦게 밀수 조직 사무실에 도착한 오남혁은 낯선 무리에게 납치를 당한다. 이 일로 얼떨결에
										목숨이 걸린 범죄 사건에 휘말리게 된 오남혁과 조태봉은 각자의 목적을 위해 동상이몽 공조 수사를 시작하는데…</div>
									<div class="my-score equa" style="display: none;">
										<div class="preview">
											<p class="tit">관람평</p>
											<p class="number">
												0<span class="ir">점</span>
											</p>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="tit-area">
							<p class="movie-grade age-15">,</p>
							<p title="정보원" class="tit">정보원</p>
						</div>
						<div class="rate-date">
							<span class="rate">예매율 5.6%</span> <span class="date">개봉일
								2025.12.03</span>
						</div>
						<div class="btn-util">
							<p class="txt movieStat1" style="display: none">상영예정</p>
							<p class="txt movieStat2" style="display: none">12월 개봉예정</p>
							<p class="txt movieStat5" style="display: none">개봉예정</p>
							<p class="txt movieStat6" style="display: none">상영종료</p>
							<div class="case col-2 movieStat3" style="display: none">
								<a href="https://www.megabox.co.kr/movie#"
									class="button purple bokdBtn" data-no="25087700"
									title="영화 예매하기">예매</a> 
							</div>
							<div class="case movieStat4" style="">
								<a href="https://www.megabox.co.kr/movie#"
									class="button purple bokdBtn" data-no="25087700"
									title="영화 예매하기">예매</a>
							</div>
						</div></li>
					<li tabindex="0" class="no-img"><div class="movie-list-info">
							<p class="rank" style="">
								4<span class="ir">위</span>
							</p>
							<img
								src="./MEET PLAY SHARE, 메가박스_files/zRSHfdUWIaRvX73R2mpB6a5WHEyqilwA_420.jpg"
								alt="극장판 주술회전: 시부야사변 X 사멸회유" class="poster lozad"
								onerror="noImg(this)">
							<div class="movie-score" style="opacity: 0;">
								<a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn"
									data-no="25084600" title="극장판 주술회전: 시부야사변 X 사멸회유 상세보기">
									<div class="summary">2018년 10월 31일 시부야 역 주변에 갑자기 ‘장막’이
										내려지고, 다수의 일반인이 갇히게 된다. 그곳에 홀로 뛰어든 현대 최강의 주술사, 고죠 사토루. 그러나 그곳에는
										고죠의 봉인을 꾀하는 주저사·주령들이 기다리고 있었다. 시부야에 집결하는 이타도리 유지를 비롯한 수많은
										주술사들. 전례 없는 대규모 주술전 「시부야사변」이 시작된다—. 그리고 싸움은, 최악의 주술사 카모 노리토시가
										꾸민 데스 게임 「사멸회유」로 이어진다. 「시부야사변」을 거쳐, 마굴로 변한 전국 10개의 결계(콜로니).

										대혼란의 한가운데, 이타도리의 사형 집행인으로 특급 주술사 옷코츠 유타가 나타난다. 절망 속에서도 싸움을
										계속하는 이타도리. 무정하게도 칼날을 겨누는 옷코츠. 가속해가는 저주의 혼돈. 같은 스승을 둔 이타도리와
										옷코츠, 두 사람의 사투가 시작된다——.</div>
									<div class="my-score equa" style="display: none;">
										<div class="preview">
											<p class="tit">관람평</p>
											<p class="number">
												0<span class="ir">점</span>
											</p>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="tit-area">
							<p class="movie-grade age-15">,</p>
							<p title="극장판 주술회전: 시부야사변 X 사멸회유" class="tit">극장판 주술회전: 시부야사변
								X 사멸회유</p>
						</div>
						<div class="rate-date">
							<span class="rate">예매율 5.1%</span> <span class="date">개봉일
								2025.12.03</span>
						</div>
						<div class="btn-util">
							<p class="txt movieStat1" style="display: none">상영예정</p>
							<p class="txt movieStat2" style="display: none">12월 개봉예정</p>
							<p class="txt movieStat5" style="display: none">개봉예정</p>
							<p class="txt movieStat6" style="display: none">상영종료</p>
							<div class="case col-2 movieStat3" style="display: none">
								<a href="https://www.megabox.co.kr/movie#"
									class="button purple bokdBtn" data-no="25084600"
									title="영화 예매하기">예매</a> 
							</div>
							<div class="case movieStat4" style="">
								<a href="https://www.megabox.co.kr/movie#"
									class="button purple bokdBtn" data-no="25084600"
									title="영화 예매하기">예매</a>
							</div>
						</div></li>
				</ol>
			</div>
			<!--// movie-list -->

			<!-- 더보기 버튼 -->
			<div class="btn-more v1" id="addMovieDiv" style="">
				<button type="button" class="btn" id="btnAddMovie">더보기 <i class="iconset ico-btn-more-arr"></i></button>
			</div>

			<!-- 검색결과 없을 때 -->
			<div class="movie-list-no-result" id="noDataDiv" style="display: none;">
				<p>현재 상영중인 영화가 없습니다.</p>
			</div>
		</div>
	</div>
</div>
<footer id="footer">
	<jsp:include page="../fragments/footer.jsp"></jsp:include>
</footer>
</body>