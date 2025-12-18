<%@page import="movie.MovieDTO"%>
<%@page import="java.util.List"%>
<%@page import="movie.MovieService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../fragments/siteProperty.jsp"%>
<head>
<!-- 상단 favicon 이미지  -->
<link rel="shortcut icon"
	href="${commonURL}/resources/images/favicon.ico">
	
<!--//------ bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<!-- ----------bootstrap CDN---// -->	
	
	
<!-- 전체적인 css -->
<link rel="stylesheet" href="${commonURL}/resources/css/megabox.min.css"
	media="all">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="${commonURL}/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	

<style type="text/css">
.quick-reserve-area .movie-choice {
	width: 600px;
}


.schedule-row {
    cursor: pointer;
    transition: all 0.2s ease;
}




/* 매진된 행 */
.schedule-row.full {
    cursor: not-allowed;
    opacity: 0.6;
}


/********* 영화 시간표 테이블 스타일********** */
.schedule-table-wrapper {
    background: #fff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
	width:100%;
	
	/* 시간표에 스크롤바 추가 */
	max-height: 100%;
	max-width: 100%;
	overflow-y: auto;
}

.schedule-table {
    margin-bottom: 0;
    table-layout: fixed;
}

.schedule-thead {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.schedule-thead th {
    font-weight: 600;
    border: none;
    padding: 16px 12px;
    font-size: 14px;
    text-align: center;
    vertical-align: middle;
}

/* 각 컬럼 너비 설정 */
.time-col {
    width: 10%;
}

.movie-col {
    width: 35%;  /* 영화명 컬럼 넓게 */
}

.theater-col {
    width: 15%;
}

.seat-col {
    width: 13%;
}

.schedule-tbody .schedule-row {
    transition: all 0.3s ease;
    border-bottom: 1px solid #f0f0f0;
}

.schedule-tbody .schedule-row:hover {
    background-color: #f8f9ff;
    transform: translateX(4px);
    box-shadow: 0 2px 4px rgba(102, 126, 234, 0.1);
    cursor: pointer;
}

.schedule-tbody td {
    padding: 14px 12px;
    vertical-align: middle;
    text-align: center;
    font-size: 14px;
}

/* 시작시간 강조 */
.start-time {
    font-weight: 700;
    color: #667eea;
    font-size: 16px;
}

/* 종료시간 */
.end-time {
    color: #666;
    font-size: 13px;
}

/* 영화명 강조 */
.movie-name {
    font-weight: 600;
    color: #333;
    text-align: left;
    padding-left: 20px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

/* 상영관 */
.theater-name {
    color: #555;
    font-weight: 500;
}

/* 남은 좌석 */
.remaining-seats {
    font-weight: 700;
    font-size: 15px;
    color: #28a745;
}

/* 전체 좌석 */
.total-seats {
    color: #999;
    font-size: 13px;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .schedule-thead th,
    .schedule-tbody td {
        padding: 10px 8px;
        font-size: 12px;
    }
    
    .start-time {
        font-size: 14px;
    }
    
    .movie-name {
        padding-left: 12px;
    }
    
    .movie-col {
        width: 30%;
    }
}

/* 날짜 다음 버튼 */
.btn-next {
    overflow-x: auto;
    white-space: nowrap;
}

.date-list {
    display: flex;
    flex-wrap: nowrap;       /* 🔥 줄바꿈 금지 */
    white-space: nowrap;
}

.date-list button {
    flex: 0 0 75px;            /* 🔥 버튼 폭 고정 */
    width: 75px;
    text-align: center;
}
</style>
<script type="text/javascript">

//----전역 변수 선언
// 현재 선택된 날짜를 저장할 변수
var selectedDate = null;

// 현재 선택된 영화를 저장할 변수
var selectedMovieNo = null;
var selectedMovieName = null;

var initMovieHtml = null;


//------------▶️▶️▶️▶️▶️▶️ 날짜 선택 + 영화 선택 => 시간표 출력 ----------------------------
$(function() {
    initMovieHtml = $(".all-list").html();
    
    //현재 날짜 버튼 on인 곳의 날짜 정보를 저장함.
    selectedDate = $(".date-list .on ").attr("date-data");

    
    // 날짜 클릭
    $(document).on("click", ".date-list button", function() {
        // 이미 선택된 날짜를 다시 클릭한 경우
        if ($(this).hasClass("on")) {
            $(this).removeClass("on");
            selectedDate = null;
            //console.log("날짜 선택 해제");
        } else {
            // 새로운 날짜 선택
            $(".date-list button").removeClass("on");
            $(this).addClass("on");
            selectedDate = $(this).attr("date-data");
            console.log("선택된 날짜:", selectedDate);
        }

        // 시간표 조회 호출
        loadSchedule();
    });

    // 영화 클릭
    $(document).on("click", "#movieList .btn", function() {
        // 이미 선택된 영화를 다시 클릭한 경우
        if ($(this).hasClass("on")) {
            $(this).removeClass("on");
            selectedMovieNo = null;
            selectedMovieName = null;
            //console.log("영화 선택 해제");
        } else {
            // 새로운 영화 선택
            $("#movieList .btn").removeClass("on");
            $(this).addClass("on");
            selectedMovieNo = $(this).attr("movie-no");
            selectedMovieName = $(this).attr("movie-nm");
            console.log("선택된 영화:", selectedMovieName);
        }

        // 시간표 조회 호출
        loadSchedule();
    });

    // 전체 영화 버튼
    $(document).on("click", "#movieAll", function () {
        $(".btn-tab").removeClass("on");
        $(".all-list").html(initMovieHtml);
        
        // 영화 선택 초기화
        selectedMovieNo = null;
        selectedMovieName = null;
        $("#movieList .btn").removeClass("on");
        
        // 시간표 영역 초기화
        $('.result').html('<div class="no-result"><p class="txt">영화를 선택하시면 상영시간표를 확인할 수 있습니다.</p></div>');

        // 스크롤 다시 적용
        $("#movieList").mCustomScrollbar({
            axis: "y",
            theme: "light"
        });
    });

    // 연령별 필터 버튼들 (ALL, 12, 15, 19)
    $("#movieAgeAll, #movieAge12, #movieAge15, #movieAge19").click(function() {
        // 영화 선택 초기화
        selectedMovieNo = null;
        selectedMovieName = null;
        
        // 시간표 영역 초기화
        $('.result').html('<div class="no-result"><p class="txt">영화를 선택하시면 상영시간표를 확인할 수 있습니다.</p></div>');
    });

});//$(function()


// 날짜와 영화가 모두 선택되었을 때 시간표 조회
function loadSchedule() {
    if (selectedDate && selectedMovieNo) {
       //console.log("시간표 조회 시작");
       //console.log("날짜:", selectedDate, "영화:", selectedMovieNo);
        
        // 로딩 표시
        $('.result').html('<div class="no-result"><p class="txt">시간표를 불러오는 중...</p></div>');

        $.ajax({
            url: "getSchedule.jsp",
            type: "GET",
            data: {
                date: selectedDate,
                movieNo: selectedMovieNo
            },
            dataType: "json",
            success: function(data) {
                //console.log("✅ 시간표 데이터:", data);
                displaySchedule(data);
            },
            error: function(xhr, status, error) {
                console.error("❌ 에러 발생:", error);
                console.error("Response:", xhr.responseText);
                $('.result').html('<div class="no-result"><p class="txt">시간표를 불러올 수 없습니다.</p></div>');
            }
        });
    } else {
        //console.log("날짜 또는 영화가 선택되지 않았습니다.");
        
        // 선택 안내 메시지
        if (!selectedDate && !selectedMovieNo) {
            $('.result').html('<div class="no-result"><p class="txt">날짜와 영화를 선택하시면<br>상영시간표를 비교하여 볼 수 있습니다.</p></div>');
        } else if (!selectedDate) {
            $('.result').html('<div class="no-result"><p class="txt">날짜를 선택해주세요.</p></div>');
        } else if (!selectedMovieNo) {
            $('.result').html('<div class="no-result"><p class="txt">영화를 선택해주세요.</p></div>');
        }
    }
}//loadSchedule

function movePrev(){
	$(".date-list").stop().animate({
        scrollLeft: "-=75"
    }, 75);
}

function moveNext(){
    $(".date-list").stop().animate({
        scrollLeft: "+=75"
    }, 75);
}

function displaySchedule(data) {
	var displayHTML = '';

	// 데이터가 없을 때
	if(!data || data.length === 0) {
	    displayHTML = '<div class="no-result">';
	    displayHTML += '  <i class="iconset ico-movie-time"></i>';
	    displayHTML += '  <p class="txt">해당 날짜에 상영 일정이 없습니다.</p>';
	    displayHTML += '</div>';
	    $('.result').html(displayHTML);
	    return;
	}

	// 테이블 시작
	displayHTML += '<div class="schedule-table-wrapper">';
	displayHTML += '<table class="table table-hover schedule-table">';
	displayHTML += '  <thead class="schedule-thead">';
	displayHTML += '    <tr>';
	displayHTML += '      <th class="time-col">시작시간</th>';
	displayHTML += '      <th class="time-col">종료시간</th>';
	displayHTML += '      <th class="movie-col">영화명</th>';
	displayHTML += '      <th class="theater-col">상영관</th>';
	displayHTML += '      <th class="seat-col">남은 좌석</th>';
	displayHTML += '      <th class="seat-col">전체 좌석</th>';
	displayHTML += '    </tr>';
	displayHTML += '  </thead>';
	displayHTML += '  <tbody class="schedule-tbody">';

	// 데이터 반복
	$.each(data, function(index, item) {
	    var isFull = item.rem_seat === 0;
	    var rowClass = 'schedule-row';

	    if (isFull) {
	        rowClass += ' full';
	    }

	    // tr에 data 속성 추가
	    displayHTML += '    <tr class="' + rowClass + '" ';
	    displayHTML += '        data-screen-code="' + item.screen_code + '" ';
	    displayHTML += '        data-movie-code="' + item.movie_code + '" ';
	    displayHTML += '        data-movie-name="' + item.movie_name + '" ';
	    displayHTML += '        data-theater-name="' + item.theather_name + '" ';
	    displayHTML += '        data-screen-open="' + item.screen_open + '" ';
	    displayHTML += '        data-screen-end="' + item.screen_end + '" ';
	    displayHTML += '        data-rem-seat="' + item.rem_seat + '" ';
	    displayHTML += '        data-total-seat="' + item.total_seat + '" ';
	    displayHTML += '        data-is-full="' + isFull + '">';

	    displayHTML += '      <td class="start-time">' + item.screen_open + '</td>';
	    displayHTML += '      <td class="end-time">' + item.screen_end + '</td>';
	    displayHTML += '      <td class="movie-name">' + item.movie_name + '</td>';
	    displayHTML += '      <td class="theater-name">' + item.theather_name + '</td>';
	    displayHTML += '      <td class="remaining-seats">' + item.rem_seat + '</td>';
	    displayHTML += '      <td class="total-seats">' + item.total_seat + '</td>';

	    displayHTML += '    </tr>';
	});

	displayHTML += '  </tbody>';
	displayHTML += '</table>';
	displayHTML += '</div>';

	$('.result').html(displayHTML);
    
    // tr 클릭 이벤트 추가
    $('.schedule-row').on('click', function() {
        var isFull = $(this).data('is-full');
        
        if (isFull === true || isFull === 'true') {
            alert('매진된 상영시간입니다.');
            return;
        }
        
        // 클릭한 행의 데이터 가져오기
        var scheduleData = {
            screenCode: $(this).data('screen-code'),
            movieCode: $(this).data('movie-code'),
            movieName: $(this).data('movie-name'),
            theaterName: $(this).data('theater-name'),
            screenOpen: $(this).data('screen-open'),
            screenEnd: $(this).data('screen-end'),
            remSeat: $(this).data('rem-seat'),
            totalSeat: $(this).data('total-seat'),
            date: selectedDate
        };
        
        
        console.log('선택된 스케줄:', scheduleData);
        
        
        // 예매 페이지로 이동
        //goReservation(scheduleData);
        //임시로 영화 상세로 이동.
		location.href='${commonURL}/user/movie/detail.jsp?name='+scheduleData.movieCode;
    });
}//displaySchedule
		
//-------------------------날짜 선택 + 영화 선택 => 시간표 출력 ◀️◀️◀️◀️◀️◀️◀️◀️◀️◀️◀️◀️◀️◀️◀️----------------------------


	$(function() {
		initMovieHtml = $(".all-list").html()
		//스크롤바 커스텀
		$("#movieList").mCustomScrollbar({
			axis : "y",
			theme : "light",
		});
		
		//전체 영화 버튼
		$(document).on("click", "#movieAll", function () {
			$(".btn-tab").removeClass("on");           // 모든 버튼에서 on 제거
		    $(".all-list").html(initMovieHtml);

		    // 스크롤 다시 적용
		    $("#movieList").mCustomScrollbar({
		        axis: "y",
		        theme: "light"
		    });
		});

		//ALL 버튼
		$("#movieAgeAll").click(function() {
			$("#movieList").mCustomScrollbar({
		        axis: "y",
		        theme: "light"
		    });
			
			$.ajax({
				url:"movieAgeAll.jsp",
				type:"GET",
				dataType:"JSON",
				error:function(xhr){
					alert("개봉작 데이터를 불러올 수 없습니다.");
					console.log(xhr.statusText + "/" + xhr.status);
				},
				success:function(jsonArr){
					var html = '<ul>';

				    $.each(jsonArr, function (idx, obj) {

				        html += '<li>'
				            + '    <button type="button" class="btn"'
				            + '        movie-nm="' + obj.moviename + '"'
				            + '        movie-no="' + obj.moviecode + '">'
				            + '        <span class="movie-grade small age-' + obj.moviegrade + '">'
				            +              obj.moviegrade + '세 이상 관람가'
				            + '        </span>'
				            + '        <i class="iconset ico-heart-small"></i>'
				            + '        <span class="txt">' + obj.moviename + '</span>'
				            + '    </button>'
				            + '</li>';
				    	});

				    	html += '</ul>';

				    	$("#movieList").html(html);
				    	
				    	$(".btn-tab").removeClass("on");           // 모든 버튼에서 on 제거
				        $("#movieAgeAll").addClass("on");          // 현재 버튼에만 on 추가
				}//success
				
			});//ajax
			
		});//click

		//12세 버튼
		$("#movieAge12").click(function() {
			$.ajax({
				url:"movieAgeTwelve.jsp",
				type:"GET",
				dataType:"JSON",
				error:function(xhr){
					alert("개봉작 데이터를 불러올 수 없습니다.");
					console.log(xhr.statusText + "/" + xhr.status);
				},
				success:function(jsonArr){
					var html = '<ul>';
				
				    $.each(jsonArr, function (idx, obj) {

				        html += '<li>'
				            + '    <button type="button" class="btn"'
				            + '        movie-nm="' + obj.moviename + '"'
				            + '        movie-no="' + obj.moviecode + '">'
				            + '        <span class="movie-grade small age-' + obj.moviegrade + '">'
				            +              obj.moviegrade + '세 이상 관람가'
				            + '        </span>'
				            + '        <i class="iconset ico-heart-small"></i>'
				            + '        <span class="txt">' + obj.moviename + '</span>'
				            + '    </button>'
				            + '</li>';
				    	});

				    	html += '</ul>';

				    	$("#movieList").html(html);
				    	
				    	$(".btn-tab").removeClass("on");           // 모든 버튼에서 on 제거
				        $("#movieAge12").addClass("on");          // 현재 버튼에만 on 추가
				}//success
				
			});//ajax
		});

		//15세 버튼
		$("#movieAge15").click(function() {
			$.ajax({
				url:"movieAgeFifteen.jsp",
				type:"GET",
				dataType:"JSON",
				error:function(xhr){
					alert("개봉작 데이터를 불러올 수 없습니다.");
					console.log(xhr.statusText + "/" + xhr.status);
				},
				success:function(jsonArr){
					var html = '<ul>';

				    $.each(jsonArr, function (idx, obj) {

				        html += '<li>'
				            + '    <button type="button" class="btn"'
				            + '        movie-nm="' + obj.moviename + '"'
				            + '        movie-no="' + obj.moviecode + '">'
				            + '        <span class="movie-grade small age-' + obj.moviegrade + '">'
				            +              obj.moviegrade + '세 이상 관람가'
				            + '        </span>'
				            + '        <i class="iconset ico-heart-small"></i>'
				            + '        <span class="txt">' + obj.moviename + '</span>'
				            + '    </button>'
				            + '</li>';
				    	});

				    	html += '</ul>';


				    	$("#movieList").html(html);
				    	
				    	$(".btn-tab").removeClass("on");           // 모든 버튼에서 on 제거
				        $("#movieAge15").addClass("on");          // 현재 버튼에만 on 추가
				}//success
				
			});//ajax
		});

		//19세 버튼
		$("#movieAge19").click(function() {
			$.ajax({
				url:"movieAgeNineteen.jsp",
				type:"GET",
				dataType:"JSON",
				error:function(xhr){
					alert("개봉작 데이터를 불러올 수 없습니다.");
					console.log(xhr.statusText + "/" + xhr.status);
				},
				success:function(jsonArr){
					var html = '<ul>';

				    $.each(jsonArr, function (idx, obj) {

				        html += '<li>'
				            + '    <button type="button" class="btn"'
				            + '        movie-nm="' + obj.moviename + '"'
				            + '        movie-no="' + obj.moviecode + '">'
				            + '        <span class="movie-grade small age-' + obj.moviegrade + '">'
				            +              obj.moviegrade + '세 이상 관람가'
				            + '        </span>'
				            + '        <i class="iconset ico-heart-small"></i>'
				            + '        <span class="txt">' + obj.moviename + '</span>'
				            + '    </button>'
				            + '</li>';
				    	});

				    	html += '</ul>';

				    	$("#movieList").html(html);
				    	
				    	$(".btn-tab").removeClass("on");           // 모든 버튼에서 on 제거
				        $("#movieAge19").addClass("on");          // 현재 버튼에만 on 추가
				}//success
				
			});//ajax
		});

	});
</script>
</head>
<body>
	<header id="header">
		<jsp:include page="../../fragments/header.jsp" />
	</header>
	<div class="inner-wrap"
		style="padding-top: 40px; padding-bottom: 100px;">
		<input type="hidden" id="playDe" name="playDe" value="2025.12.14">
		<input type="hidden" id="crtDe" name="crtDe" value="2025.12.14">

		<div class="quick-reserve">
			<div class="tit-util">
				<h2 class="tit">빠른예매</h2>
			</div>
			<!-- mege-quick-reserve-inculde : 다른 페이지에서 iframe 으로 설정될 영역 -->
			<div class="mege-quick-reserve-inculde">

				<!-- time-schedule -->
				<div class="time-schedule quick">
					<div class="wrap">

						<!-- 이전날짜 -->
						<button type="button" title="이전 날짜 보기" class="btn-pre" onclick="movePrev()">
							<i class="iconset ico-cld-pre"></i> <em>이전</em>
						</button>
						<!--// 이전날짜 -->

						<div class="date-list">
							<!-- 년도, 월 표시 -->
							<div class="year-area">
								<div class="year" style="left: 30px; z-index: 1; opacity: 1;">2025.12</div>
								<div class="year" style="left: 450px; z-index: 1; opacity: 0;"></div>
							</div>

							<div class="date-area" id="formDeList">
								<div class="wrap"
									style="position: relative; width: 2100px; border: none;">
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
									String[] dayNames = { "", "일", "월", "화", "수", "목", "금", "토" };
									String[] dayNamesEn = { "", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
									%>
									<div class="date-list" style="width: 1040px;">
										<%
										// 3. 14일치 날짜 생성 반복문
										for (int i = 0; i < 17; i++) {
											int year = cal.get(Calendar.YEAR);
											int month = cal.get(Calendar.MONTH); // 0~11
											int day = cal.get(Calendar.DATE);
											int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 1(일) ~ 7(토)

											// 날짜 포맷팅 (yyyy.MM.dd)
											String dateData = String.format("%04d.%02d.%02d", year, month + 1, day);

											
											// CSS 클래스 계산 (토요일, 일요일, 그리고 선택된 날짜 'on')
											String btnClass = "";
											if (dayOfWeek == Calendar.SATURDAY)
												btnClass = "sat";
											else if (dayOfWeek == Calendar.SUNDAY)
												btnClass = "holi";

											// 현재 출력중인 날짜가 선택된 날짜와 같으면 'on' 클래스 추가
											if (dateData.equals(selectedDate)) {
												btnClass += " on";
											}

											// 표기할 요일 텍스트 결정 (오늘, 내일, 그 외 요일)
											String dayText = dayNames[dayOfWeek];

											// 오늘/내일 로직: 반복중인 cal 날짜와 고정된 todayCal 비교
											long diffSec = (cal.getTimeInMillis() - todayCal.getTimeInMillis()) / 1000;
											long diffDays = diffSec / (24 * 60 * 60); // 일수 차이 계산

											if (diffDays == 0)
												dayText = "오늘";
											else if (diffDays == 1)
												dayText = "내일";
										%>

										<button class="<%=btnClass%>" type="button"
											date-data="<%=dateData%>" month="<%=month+1%>"
											<%-- onclick="changeDate('<%=dateData%>')" --%>>

											<span class="ir"><%=year%>년 <%=month + 1%>월</span> <em
												style="pointer-events: none;"> <%=day%> <span
												style="pointer-events: none;" class="ir">일</span>
											</em> <span class="day-kr"
												style="pointer-events: none; display: inline-block"><%=dayText%></span>
											<span class="day-en"
												style="pointer-events: none; display: none"><%=dayNamesEn[dayOfWeek]%></span>
										</button>

										<%
										// 4. 핵심: 하루 증가 (이전 답변의 해결책 적용)
										cal.add(Calendar.DATE, 1);
										} // end for
										%>
									</div>
								</div>
							</div>
						</div>

						<!-- 다음날짜 -->
						<button type="button" title="다음 날짜 보기" class="btn-next" onclick="moveNext()">
							<i class="iconset ico-cld-next"></i> <em>다음</em>
						</button>
						<!--// 다음날짜 -->

						<!-- 달력보기 -->
						<!-- <div class="bg-line">
							<input type="hidden" id="datePicker" value="2025.12.14"
								class="hasDatepicker">
							<button type="button" id="calendar" onclick="$(&#39;#datePicker&#39;).datepicker(&#39;show&#39;)" class="btn-calendar-large" title="달력보기"> 달력보기</button>
						</div> -->
						<!--// 달력보기 -->
					</div>
				</div>
				<!--// time-schedule -->

				<!-- quick-reserve-area -->
				<div class="quick-reserve-area "  >

					<!-- movie-choice : 영화 선택  -->
					<div class="movie-choice" style="width:30%;"  >
						<p class="tit">영화</p>

						<!-- list-area -->
						<div class="list-area"  >
							<%
							MovieService ms = MovieService.getInstance();
							List<MovieDTO> list = ms.showAllMovie();

							request.setAttribute("movies", list);
							%>
							<!-- all : 전체 -->
							<div class="all-list">
								<button type="button" class="btn-tab on" style="width:100%; id="movieAll">전체</button>

								<div class="list">
									<div id="movieList" class="scroll m-scroll">
										<ul>
											<c:forEach var="m" items="${movies}">
												<li>
													<button type="button"  class="btn" movie-nm="${m.moviename}"
														movie-no="${m.moviecode}">
														<span class="movie-grade small age-${m.moviegrade}">
															${m.moviegrade}세 이상 관람가 </span> <i
															class="iconset ico-heart-small"></i> <span class="txt">${m.moviename}</span>
													</button>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<!--// all : 전체 -->
<!-- 
							<div class="other-list">
								전체이용가
								<button type="button" class="btn-tab" id="movieAgeAll">
									<span class="movie-grade small age-all"></span>
								</button>
								<div class="list">
									<div id="movieListAgeAll" class="scroll m-scroll">
										ajax에서 추가할 영역
									</div>
								</div>
								12세 이용가
								<button type="button" class="btn-tab" id="movieAge12"
									style="left: 220px;">
									<span class="movie-grade small age-12"></span>
								</button>
								<div class="list">
									<div id="movieListAgeTwelve" class="scroll m-scroll">
										ajax에서 추가할 영역
									</div>
								</div>
								15세 이용가
								<button type="button" class="btn-tab" id="movieAge15"
									style="left: 330px;">
									<span class="movie-grade small age-15"></span>
								</button>
								<div class="list">
									<div id="movieListAgeFifteen" class="scroll m-scroll">
										ajax에서 추가할 영역
									</div>
								</div>
								19세 이용가
								<button type="button" class="btn-tab" id="movieAge19"
									style="left: 440px;">
									<span class="movie-grade small age-19"></span>
								</button>
								<div class="list">
									<div id="movieListAgeNineteen" class="scroll m-scroll">
										ajax에서 추가할 영역
									</div>
								</div>
							</div>
 -->
						</div>
						<!--// list-area -->
					</div>
					<!--// movie-choice : 영화 선택  -->

					<!-- time-choice : 상영시간표 선택 -->
					<div class="time-choice" style="width:70%;">
						<div class="tit-area">
							<p class="tit">시간</p>

						<!-- 	<div class="right legend">
								<i class="iconset ico-sun" title="조조"></i> 조조 <i
									class="iconset ico-brunch" title="브런치"></i> 브런치 <i
									class="iconset ico-moon" title="심야"></i> 심야
							</div> -->
						</div>

					<div class="movie-schedule-area"  >
						<!--*********************여기다가 시간표 추가***********************************  -->

						
			
							

							<!-- 영화, 영화관 선택 안했을때 -->
							<!---->
<!-- 							<div class="no-result" id="playScheduleNonList">
								<i class="iconset ico-movie-time"></i>

								<p class="txt">
									영화와 극장을 선택하시면<br> 상영시간표를 비교하여 볼 수 있습니다.
								</p>
							</div> -->


							<!-- 영화, 영화관 선택 했을때 -->
							<div class="result" >
						
								<!-- <div
									class="scroll m-scroll mCustomScrollbar _mCS_4 mCS_no_scrollbar"
									id="playScheduleList" style="display: none;">
									<div id="mCSB_4"
										class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
										style="max-height: 760px;" tabindex="0">
										<div id="mCSB_4_container"
											class="mCSB_container mCS_no_scrollbar_y"
											style="position: relative; top: 0; left: 0;" dir="ltr"></div>
										<div id="mCSB_4_scrollbar_vertical"
											class="mCSB_scrollTools mCSB_4_scrollbar mCS-light mCSB_scrollTools_vertical">
											<div class="mCSB_draggerContainer">
												<div id="mCSB_4_dragger_vertical" class="mCSB_dragger"
													style="position: absolute; min-height: 30px; display: none; top: 0px;">
													<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
												</div>
												<div class="mCSB_draggerRail"></div>
											</div>
										</div>
									</div>
								</div> -->

							</div>
						</div>
						<!--// movie-schedule-area : 시간표 출력 영역-->

					</div>
					<!--// time-choice : 상영시간표 선택 -->
				</div>
				<!--// quick-reserve-area -->
			</div>
			<!--// mege-quick-reserve-inculde : 다른 페이지에서 iframe 으로 설정될 영역 -->

		</div>
		<!--// quick-reserve -->

	</div>
	<!--// inner-wrap -->
	<footer id="footer">
		<jsp:include page="../../fragments/footer.jsp"></jsp:include>
	</footer>
</body>