<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="screenInfo.ScreenInfoService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- page directive -->
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../fragments/siteProperty.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0050)https://www.megabox.co.kr/theater/time?brchNo=1372 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="shortcut icon" href="${commonURL}/resources/images/favicon.ico"/>

<title>(강남)상영시간표 &gt; 투지브이</title>

<link rel="stylesheet" href="${commonURL}/resources/css/megabox.min.css" media="all" />

<!-- jQuery CDN 시작 -->
<script src="${commonURL}/resources/js/jquery-1.12.4.js"></script>
<script src="${commonURL}/resources/js/jquery-ui.1.12.1.js"></script>
<script src="${commonURL}/resources/js/gsaps.js"></script>
<script src="${commonURL}/resources/js/bootstrap-custom.js"></script>
<script src="${commonURL}/resources/js/bootstrap-select.js"></script>

<script src="${commonURL}/resources/js/commons.js"></script>
<script src="${commonURL}/resources/js/mega.prototype.js"></script>
<script src="${commonURL}/resources/js/megaboxCom.js"></script>
<script src="${commonURL}/resources/js/front.js"></script>

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

<script src="${commonURL}/resources/js/hmac-sha256.js"></script>
<script src="${commonURL}/resources/js/enc-base64-min.js"></script>
<script src="${commonURL}/resources/js/megabox-simpleBokd.js"></script>
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
			<c:import url = "${commonURL}/fragments/header.jsp"/>
		</header>
		<!--// header -->

		<div id="schdlContainer" class="container">
			<div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<span>Home</span> <a href="https://www.megabox.co.kr/theater/list"
							title="극장 페이지로 이동">극장</a> <a
							href="${commonURL}/user/dailyScreenSchedule/dailyScreenSchedule.jsp"
							title="상영시간표 페이지로 이동">상영시간표</a>
					</div>
				</div>
			</div>

			<!-- contents -->
			<div id="contents" class="no-padding">

				<!-- theater-detail-page -->
				<div class="theater-detail-page" style = "height: 130px;">

					<div class="bg-img"
						style="background-image: url(${commonURL}/resources/images/img-theater-detail.jpg);"></div>
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
							<a href="${commonURL}/screenSchedule/screenSchedule.jsp"
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
												    String[] dayNames = {"", "토", "일", "월", "화", "수", "목", "금"};
												    String[] dayNamesEn = {"", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"};
												%>
												
												<div class="date-list" style = "width: 1190px;">
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
												        if (dayOfWeek == Calendar.SUNDAY) btnClass = "sat";
												        else if (dayOfWeek == Calendar.MONDAY) btnClass = "holi";
												        
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
								<%
								    // 1. 파라미터 받기
								    selectedDate = request.getParameter("date");
								    if (selectedDate == null || selectedDate.isEmpty()) {
								        selectedDate = new SimpleDateFormat("yyyy.MM.dd").format(new Date());
								    }
								
								    // 2. Service 호출하여 데이터 가져오기
								    ScreenInfoService sis = ScreenInfoService.getInstance();
								    // 복잡한 로직 없이 결과만 딱 받아옵니다.
								    Map<String, Map<String, List<Map<String, String>>>> movieScheduleMap = 
								    		sis.getMovieSchedule(selectedDate);
								%>
								
								<div class="schedule-output-area">
								<%
								    // 데이터가 비어있을 경우 처리
								    if (movieScheduleMap.isEmpty()) {
								%>
								        <div class="no-data">상영 스케줄이 없습니다.</div>
								<%
								    } else {
								        // 기존의 3중 for문 반복 출력 로직 그대로 사용
								        for (Map.Entry<String, Map<String, List<Map<String, String>>>> movieEntry : movieScheduleMap.entrySet()) {
								        	String currentMovieName = movieEntry.getKey();
								            Map<String, List<Map<String, String>>> theaterGroup = movieEntry.getValue();
								            
								            // 첫 번째 상영 시간표에서 영화 정보 (상영시간 등)를 가져옵니다.
								            // 그룹화 구조상 첫 번째 상영관의 첫 번째 스케줄 정보를 사용합니다.
								            Map<String, String> firstSchedule = null;
								            for (List<Map<String, String>> schedules : theaterGroup.values()) {
								                if (!schedules.isEmpty()) {
								                    firstSchedule = schedules.get(0);
								                    break;
								                }
								            }
								            
								            // null 체크 (데이터가 없는 경우를 대비)
								            if (firstSchedule == null) continue;
								            String runningTime = firstSchedule.get("RUNNING_TIME");
								            // String movieCode = firstSchedule.get("MOVIE_CODE"); // 영화 상세 페이지 URL 등에 사용 가능
									        %>
									            <div class="theater-list">
									                <div class="theater-tit">
									                    <p class="movie-grade age-all"></p> <p>
									                        <a href="/movie-detail?movieCode=<%= firstSchedule.get("MOVIE_CODE") %>" title="<%= currentMovieName %> 상세보기">
									                            <%= currentMovieName %>
									                        </a>
									                    </p>
									                    <p class="infomation">
									                        <span>상영중</span>/상영시간 <%= runningTime %>분
									                    </p>
									                </div>
									                
									                <%
									                // 2. 중간 반복문: 상영관별 반복 (theater-type-box)
									                for (Map.Entry<String, List<Map<String, String>>> theaterEntry : theaterGroup.entrySet()) {
									                    String currentTheaterName = theaterEntry.getKey();
									                    List<Map<String, String>> scheduleList = theaterEntry.getValue();
									                    
									                    // 첫 번째 상영 시간표에서 상영관 좌석 정보를 가져옵니다.
									                    String totalSeat = scheduleList.get(0).get("TOTAL_SEAT"); 
									                %>
									                <div class="theater-type-box">
									                    <div class="theater-type">
									                        <p class="theater-name"><%= currentTheaterName %></p>
									                        <p class="chair">총 <%= totalSeat %>석</p>
									                    </div>
									                    <div class="theater-time">
									                        <div class="theater-type-area">2D(자막)</div> <div class="theater-time-box">
									                            <table class="time-list-table">
									                                <tbody>
									                                    <tr>
									                                    <%
									                                    // 3. 내부 반복문: 상영 시간별 반복 (td)
									                                    // 한 줄에 8개씩 출력하는 로직이 필요할 경우 여기서 복잡해집니다.
									                                    // 여기서는 간단하게 한 줄에 모두 출력한다고 가정합니다.
									                                    int playCount = 1; // 회차 계산용 임시 변수
									                                    for (Map<String, String> schedule : scheduleList) {
									                                        String screenOpen = schedule.get("SCREEN_OPEN"); // 예: 18:20
									                                        String remainSeat = schedule.get("REMAIN_SEAT"); // 예: 15석
									                                        // 상영 종료 시간 계산 로직이 필요합니다. (SCREEN_OPEN + RUNNING_TIME)
									                                        
									                                        // TODO: 종료 시간, 회차 계산 로직을 실제 데이터로 대체하세요.
									                                        String endTime = "20:18";
									                                        String sqlDate = selectedDate.replace('.', '-');
									                                    %>
									                                        <td class="" 
									                                            play-de="<%= sqlDate.replace("-", "") %>" 
									                                            play-seq="<%= playCount %>" 
									                                            rpst-movie-no="<%= firstSchedule.get("MOVIE_CODE") %>"
									                                            theab-no="XX" > <div class="td-ab">
									                                                <div class="txt-center">
									                                                    <a href="/reserve" title="영화예매하기">
									                                                        <div class="ico-box">
									                                                            <i class="iconset ico-off"></i> </div>
									                                                        <p class="time"><%= screenOpen %></p>
									                                                        <p class="chair"><%= remainSeat %></p>
									                                                        <div class="play-time">
									                                                            <p><%= screenOpen %>~<%= endTime %></p>
									                                                            <p><%= playCount %>회차</p>
									                                                        </div>
									                                                    </a>
									                                                </div>
									                                            </div>
									                                        </td>
									                                    <%
									                                        playCount++;
									                                    } // End of 상영 시간 반복
									                                    %>
									                                    </tr>
									                                </tbody>
									                            </table>
									                        </div>
									                    </div>
									                </div>
									                <%
									                } // End of 상영관 반복
									                %>
									            </div>
									        <%
									        }
									    }
									%>
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
			<a href="${commonURL}/screenSchedule/screenSchedule.jsp"
				class="btn-go-top" title="top" style="position: fixed;">top</a>
		</div>
		
		<!-- footer -->
		<footer id="footer">
			<c:import url = "${commonURL}/fragments/footer.jsp"/>
		</footer>
		<!--// footer -->

	</div>
</body>
</html>