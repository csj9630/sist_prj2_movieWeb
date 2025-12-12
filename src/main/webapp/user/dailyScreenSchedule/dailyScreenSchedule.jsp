<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- page directive -->
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0050)https://www.megabox.co.kr/theater/time?brchNo=1372 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="shortcut icon" href="http://localhost/sist_prj2_movieWeb/resources/images/favicon.ico"/>

<title>(강남)상영시간표 &gt; 투지브이</title>

<link rel="stylesheet" href="http://localhost/sist_prj2_movieWeb/resources/css/megabox.min.css" media="all" />

<!-- jQuery CDN 시작 -->
<script src="http://localhost/sist_prj2_movieWeb/resources/js/jquery-1.12.4.js"></script>
<script src="http://localhost/sist_prj2_movieWeb/resources/js/jquery-ui.1.12.1.js"></script>
<script src="http://localhost/sist_prj2_movieWeb/resources/js/gsaps.js"></script>
<script src="http://localhost/sist_prj2_movieWeb/resources/js/bootstrap-custom.js"></script>
<script src="http://localhost/sist_prj2_movieWeb/resources/js/bootstrap-select.js"></script>

<script src="http://localhost/sist_prj2_movieWeb/resources/js/commons.js"></script>
<script src="http://localhost/sist_prj2_movieWeb/resources/js/mega.prototype.js"></script>
<script src="http://localhost/sist_prj2_movieWeb/resources/js/megaboxCom.js"></script>
<script src="http://localhost/sist_prj2_movieWeb/resources/js/front.js"></script>

<script type="text/javascript">

</script>

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start': new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0], j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src= 'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f); })(window,document,'script','dataLayer','GTM-WG5DNB7D');</script>

</head>

<body>

	<!-- End Google Tag Manager body 영역에 추가-->
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WG5DNB7D"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->

	<div class="skip" title="스킵 네비게이션">
		<a href="https://www.megabox.co.kr/theater/time?brchNo=1372#contents"
			title="본문 바로가기">본문 바로가기</a> <a
			href="https://www.megabox.co.kr/theater/time?brchNo=1372#footer"
			title="푸터 바로가기">푸터 바로가기</a>
	</div>

	<div class="body-wrap">

<script src="http://localhost/sist_prj2_movieWeb/resources/js/hmac-sha256.js"></script>
<script src="http://localhost/sist_prj2_movieWeb/resources/js/enc-base64-min.js"></script>
<script src="http://localhost/sist_prj2_movieWeb/resources/js/megabox-simpleBokd.js"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() { // HTML이 다 로딩된 후 실행
    
    // 1. 선택자 변경: .date-area 안에 있는 버튼만 가져옵니다.
    const dateButtons = document.querySelectorAll('.date-area button');

    dateButtons.forEach(button => {
        button.addEventListener('click', function() {
            
            // (선택사항) 이미 disabled 상태면 클릭 무시
            if (this.classList.contains('disabled')) return;

            // 2. 기존에 켜져있는(on) 버튼을 찾을 때도 범위를 .date-area 안으로 한정하는 것이 좋습니다.
            const currentOn = document.querySelector('.date-area button.on');
            
            if (currentOn) {
                currentOn.classList.remove('on');
            }

            // 3. 클릭한 버튼 활성화
            this.classList.add('on');
            
            // (추가 팁) 클릭한 날짜 값 확인하기
            const selectedDate = this.getAttribute('date-data');
            console.log("선택한 날짜:", selectedDate); 
        });
    });
});
</script>

		<!-- header -->
		<header id="header">
			<c:import url = "http://localhost/sist_prj2_movieWeb/fragments/header.jsp"/>
		</header>
		<!--// header -->

		<div id="schdlContainer" class="container">
			<div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<span>Home</span> <a href="https://www.megabox.co.kr/theater/list"
							title="극장 페이지로 이동">극장</a> <a
							href="http://localhost/sist_prj2_movieWeb/user/dailyScreenSchedule/dailyScreenSchedule.jsp"
							title="상영시간표 페이지로 이동">상영시간표</a>
					</div>
				</div>
			</div>

			<!-- contents -->
			<div id="contents" class="no-padding">

				<!-- theater-detail-page -->
				<div class="theater-detail-page" style = "height: 130px;">

					<div class="bg-img"
						style="background-image: url(http://localhost/sist_prj2_movieWeb/resources/images/img-theater-detail.jpg);"></div>
					<div class="bg-pattern"></div>
					<div class="bg-mask"></div>

					<!-- theater-all -->
					<div class="theater-all">
						<p class="name" style = "height: 90px">강남</p>
					</div>
					<!--// theater-detail-cont -->
				</div>
				<!--// theater-detail-page -->

				<div class="inner-wrap pt40">

					<div class="tab-cont-wrap">
						
						<div id="tab" class="tab-cont on">
							<%-- Calendar cal = Calendar.getInstance(); --%>
							<a href="http://localhost/sist_prj2_movieWeb/screenSchedule/screenSchedule.jsp"
								class="ir">상영시간표 탭 화면 입니다.</a>
							<h2 class="tit small" style="display: none;">무대인사</h2>
							<div class="movie-greeting" style="display: none;"></div>
							<h2 class="tit small mt40">상영시간표</h2>
							<div class="time-schedule mb30">
								<div class="wrap">
									<button type="button" title="이전 날짜 보기" class="btn-pre"
										disabled="true">
										<i class="iconset ico-cld-pre"></i> <em>이전</em>
									</button>
									<div class="date-list" style = "width: 1040px;">
										<div class="year-area">
											<div class="year" style="left: 30px; z-index: 1; opacity: 1;">2025.11</div>
											<div class="year"
												style="left: 100px; z-index: 1; opacity: 1;">2025.12</div>
										</div>
										<div class="date-area">
											<div class="wrap" style="position: relative; width: 2100px; border: none; left: -70px;">
												<%
												    // 1. 날짜 설정 초기화
												    Calendar cal = Calendar.getInstance(); // 반복문용 (계속 변함)
												    Calendar todayCal = Calendar.getInstance(); // 오늘 날짜 비교용 (고정)
													
												    // 2. 파라미터로 넘어온 선택된 날짜 확인 (없으면 오늘 날짜가 기본값)
												    String selectedDate = request.getParameter("date");
												    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
												    
												    if (selectedDate == null || selectedDate.equals("")) {
												        selectedDate = sdf.format(todayCal.getTime());
												    }
													
												    // 요일 한글 배열
												    String[] dayNames = {"", "일", "월", "화", "수", "목", "금", "토"};
												    String[] dayNamesEn = {"", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
												%>
												
												<div class="date-list" style = "width: 1040px;">
												    <%
												    // 3. 14일치 날짜 생성 반복문
												    for (int i = 0; i < 17; i++) {
												        int year = cal.get(Calendar.YEAR);
												        int month = cal.get(Calendar.MONTH); // 0~11
												        int day = cal.get(Calendar.DATE)-1;
												        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 1(일) ~ 7(토)
												
												        // 날짜 포맷팅 (yyyy.MM.dd)
												        String dateData = String.format("%04d.%02d.%02d", year, month + 1, day);
												        
												        // CSS 클래스 계산 (토요일, 일요일, 그리고 선택된 날짜 'on')
												        String btnClass = "";
												        if (dayOfWeek == Calendar.SATURDAY) btnClass = "sat";
												        else if (dayOfWeek == Calendar.SUNDAY) btnClass = "holi";
												        
												        // 현재 출력중인 날짜가 선택된 날짜와 같으면 'on' 클래스 추가
												        if (dateData.equals(selectedDate)) {
												            btnClass += " on";
												        }
												
												        // 표기할 요일 텍스트 결정 (오늘, 내일, 그 외 요일)
												        String dayText = dayNames[dayOfWeek];
												        
												        // 오늘/내일 로직: 반복중인 cal 날짜와 고정된 todayCal 비교
												        long diffSec = (cal.getTimeInMillis() - todayCal.getTimeInMillis()) / 1000;
												        long diffDays = diffSec / (24*60*60); // 일수 차이 계산
												        
												        if (diffDays == 1) dayText = "오늘";
												        else if (diffDays == 2) dayText = "내일";
												    %>
												    
												    <button class="<%= btnClass %>" type="button" 
												            date-data="<%= dateData %>" 
												            month="<%= month %>" 
												            onclick="changeDate('<%= dateData %>')">
												            
												        <span class="ir"><%= year %>년 <%= month + 1 %>월</span>
												        <em style="pointer-events: none;">
												            <%= day %>
												            <span style="pointer-events: none;" class="ir">일</span>
												        </em>
												        <span class="day-kr" style="pointer-events: none; display: inline-block"><%= dayText %></span>
												        <span class="day-en" style="pointer-events: none; display: none"><%= dayNamesEn[dayOfWeek] %></span>
												    </button>
												
												    <%
												        // 4. 핵심: 하루 증가 (이전 답변의 해결책 적용)
												        cal.add(Calendar.DATE, 1);
												    } // end for
												    %>
												</div>
												<script>
												    function changeDate(date) {
												        // 날짜를 클릭하면 현재 페이지 URL에 '?date=2025.11.30' 형태로 파라미터를 붙여 이동합니다.
												        // 기존 쿼리스트링이 있다면 교체하거나 추가하는 로직이 필요할 수 있습니다.
												        // 가장 간단한 형태:
												        location.href = location.pathname + "?date=" + date;
												    }
												</script>
											</div>
										</div>
									</div>
									<button type="button" title="다음 날짜 보기" class="btn-next"
										disabled="true">
										<i class="iconset ico-cld-next"></i> <em>다음</em>
									</button>
								</div>
							</div>
							<div class="movie-option mb20">
								<div class="rateing-lavel">
									<a href="https://www.megabox.co.kr/theater/time?brchNo=1372"
										class="" title="관람등급안내">관람등급안내</a>
								</div>
							</div>
							<div class="reserve theater-list-box">
								<div class="tab-block tab-layer mb30" style="display: none;">
									<ul></ul>
								</div>
								<div class="theater-list">
									<div class="theater-tit">
										<p class="movie-grade age-all"></p>
										<p>
											<a
												href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=25089000"
												title="주토피아 2 상세보기">주토피아 2</a>
										</p>
										<p class="infomation">
											<span>상영중</span>/상영시간 108분
										</p>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">1관</p>
											<p class="chair">총 116석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D(자막)</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372005"
																rpst-movie-no="25089000" theab-no="01"
																play-de="20251130" play-seq="5" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">18:20</p>
																			<p class="chair">15석</p>
																			<div class="play-time">
																				<p>18:20~20:18</p>
																				<p>5회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
															<td class="" brch-no="1372" play-schdl-no="2511301372006"
																rpst-movie-no="25089000" theab-no="01"
																play-de="20251130" play-seq="6" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">20:40</p>
																			<p class="chair">42석</p>
																			<div class="play-time">
																				<p>20:40~22:38</p>
																				<p>6회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
															<td class="" brch-no="1372" play-schdl-no="2511301372007"
																rpst-movie-no="25089000" theab-no="01"
																play-de="20251130" play-seq="7" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">23:00</p>
																			<p class="chair">114석</p>
																			<div class="play-time">
																				<p>23:00~24:58</p>
																				<p>7회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">3관</p>
											<p class="chair">총 116석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D(자막)</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372042"
																rpst-movie-no="25089000" theab-no="03"
																play-de="20251130" play-seq="5" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">18:50</p>
																			<p class="chair">9석</p>
																			<div class="play-time">
																				<p>18:50~20:48</p>
																				<p>5회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
															<td class="" brch-no="1372" play-schdl-no="2511301372014"
																rpst-movie-no="25089000" theab-no="03"
																play-de="20251130" play-seq="6" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">21:10</p>
																			<p class="chair">69석</p>
																			<div class="play-time">
																				<p>21:10~23:08</p>
																				<p>6회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">4관</p>
											<p class="chair">총 53석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D(자막)</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372020"
																rpst-movie-no="25089000" theab-no="04"
																play-de="20251130" play-seq="5" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">19:25</p>
																			<p class="chair">7석</p>
																			<div class="play-time">
																				<p>19:25~21:23</p>
																				<p>5회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
															<td class="" brch-no="1372" play-schdl-no="2511301372021"
																rpst-movie-no="25089000" theab-no="04"
																play-de="20251130" play-seq="6" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">21:45</p>
																			<p class="chair">46석</p>
																			<div class="play-time">
																				<p>21:45~23:43</p>
																				<p>6회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">7관[Laser]</p>
											<p class="chair">총 46석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D(자막)</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372066"
																rpst-movie-no="25089000" theab-no="07"
																play-de="20251130" play-seq="6" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">20:10</p>
																			<p class="chair">13석</p>
																			<div class="play-time">
																				<p>20:10~22:08</p>
																				<p>6회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="theater-list">
									<div class="theater-tit">
										<p class="movie-grade age-all"></p>
										<p>
											<a
												href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=25081900"
												title="위키드: 포 굿 상세보기">위키드: 포 굿</a>
										</p>
										<p class="infomation">
											<span>상영중</span>/상영시간 137분
										</p>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">2관</p>
											<p class="chair">총 53석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D(자막)</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372072"
																rpst-movie-no="25081900" theab-no="02"
																play-de="20251130" play-seq="6" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">21:35</p>
																			<p class="chair">53석</p>
																			<div class="play-time">
																				<p>21:35~24:02</p>
																				<p>6회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">6관[Laser]</p>
											<p class="chair">총 56석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D(자막)</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372038"
																rpst-movie-no="25081900" theab-no="06"
																play-de="20251130" play-seq="5" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">18:40</p>
																			<p class="chair">2석</p>
																			<div class="play-time">
																				<p>18:40~21:07</p>
																				<p>5회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="theater-list">
									<div class="theater-tit">
										<p class="movie-grade age-12"></p>
										<p>
											<a
												href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=25084800"
												title="나우 유 씨 미 3 상세보기">나우 유 씨 미 3</a>
										</p>
										<p class="infomation">
											<span>상영중</span>/상영시간 112분
										</p>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">2관</p>
											<p class="chair">총 53석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D(자막)</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372039"
																rpst-movie-no="25084800" theab-no="02"
																play-de="20251130" play-seq="5" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">19:15</p>
																			<p class="chair">9석</p>
																			<div class="play-time">
																				<p>19:15~21:17</p>
																				<p>5회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="theater-list">
									<div class="theater-tit">
										<p class="movie-grade age-15"></p>
										<p>
											<a
												href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=25065200"
												title="극장판 체인소 맨: 레제편 상세보기">극장판 체인소 맨: 레제편</a>
										</p>
										<p class="infomation">
											<span>상영중</span>/상영시간 100분
										</p>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">7관[Laser]</p>
											<p class="chair">총 46석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D(자막)</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372071"
																rpst-movie-no="25065200" theab-no="07"
																play-de="20251130" play-seq="7" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">22:25</p>
																			<p class="chair">35석</p>
																			<div class="play-time">
																				<p>22:25~24:15</p>
																				<p>7회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="theater-list">
									<div class="theater-tit">
										<p class="movie-grade age-15"></p>
										<p>
											<a
												href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=25083300"
												title="국보 상세보기">국보</a>
										</p>
										<p class="infomation">
											<span>상영중</span>/상영시간 175분
										</p>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">6관[Laser]</p>
											<p class="chair">총 56석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D(자막)</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372064"
																rpst-movie-no="25083300" theab-no="06"
																play-de="20251130" play-seq="6" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">21:25</p>
																			<p class="chair">45석</p>
																			<div class="play-time">
																				<p>21:25~24:30</p>
																				<p>6회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="theater-list">
									<div class="theater-tit">
										<p class="movie-grade age-12"></p>
										<p>
											<a
												href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=25077300"
												title="세계의 주인 상세보기">세계의 주인</a>
										</p>
										<p class="infomation">
											<span>상영중</span>/상영시간 119분
										</p>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">5관[Laser]</p>
											<p class="chair">총 54석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372067"
																rpst-movie-no="25077300" theab-no="05"
																play-de="20251130" play-seq="5" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">18:10</p>
																			<p class="chair">26석</p>
																			<div class="play-time">
																				<p>18:10~20:19</p>
																				<p>5회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
															<td class="" brch-no="1372" play-schdl-no="2511301372034"
																rpst-movie-no="25077300" theab-no="05"
																play-de="20251130" play-seq="6" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">20:35</p>
																			<p class="chair">44석</p>
																			<div class="play-time">
																				<p>20:35~22:44</p>
																				<p>6회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="theater-list">
									<div class="theater-tit">
										<p class="movie-grade age-15"></p>
										<p>
											<a
												href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=25089400"
												title="넌센스 상세보기">넌센스</a>
										</p>
										<p class="infomation">
											<span>상영중</span>/상영시간 116분
										</p>
									</div>
									<div class="theater-type-box">
										<div class="theater-type">
											<p class="theater-name">5관[Laser]</p>
											<p class="chair">총 54석</p>
										</div>
										<div class="theater-time">
											<div class="theater-type-area">2D</div>
											<div class="theater-time-box">
												<table class="time-list-table">
													<caption>상영시간을 보여주는 표 입니다.</caption>
													<colgroup>
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
														<col style="width: 99px;">
													</colgroup>
													<tbody>
														<tr>
															<td class="" brch-no="1372" play-schdl-no="2511301372065"
																rpst-movie-no="25089400" theab-no="05"
																play-de="20251130" play-seq="7" netfnl-adopt-at="N">
																<div class="td-ab">
																	<div class="txt-center">
																		<a
																			href="https://www.megabox.co.kr/theater/time?brchNo=1372"
																			title="영화예매하기">
																			<div class="ico-box">
																				<i class="iconset ico-off"></i>
																			</div>
																			<p class="time">23:00</p>
																			<p class="chair">54석</p>
																			<div class="play-time">
																				<p>23:00~25:06</p>
																				<p>7회차</p>
																			</div>
																		</a>
																	</div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="box-border v1 mt30" style = "border: 0px solid;">
								<li>지연입장에 의한 관람불편을 최소화하고자 본 영화는 약 10분 후 시작됩니다.</li>
								<li>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</li>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--// contents -->
		</div>
		
		<div class="quick-area" style="display: none;">
			<a href="http://localhost/sist_prj2_movieWeb/screenSchedule/screenSchedule.jsp"
				class="btn-go-top" title="top" style="position: fixed;">top</a>
		</div>
		
		<!-- footer -->
		<footer id="footer">
			<c:import url = "http://localhost/sist_prj2_movieWeb/fragments/footer.jsp"/>
		</footer>
		<!--// footer -->

	</div>
</body>
</html>