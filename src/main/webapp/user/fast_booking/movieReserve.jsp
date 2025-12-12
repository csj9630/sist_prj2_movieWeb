<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<link rel="shortcut icon"
	href="http://192.168.10.75/projectMovieBook/index/images/favicon.ico">
<link rel="stylesheet"
	href="../resources/css/megabox.min.css" media="all">
<style type="text/css">
/* ========================================================= */
/* 네임스페이스 전용 리셋 */
/* ========================================================= */
.reserve *, .reserve *::before, .reserve *::after {
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

/* 전체 컨테이너 */
.reserve {
	width: 1200px;
	margin: 30px auto;
	background: #fff;
	padding: 20px 12px 30px;
}

.reserve-title {
	font-size: 22px;
	font-weight: 700;
	margin-bottom: 18px;
	color: #222;
}

.wrap {
	border: 1px solid #d8d9db;
}
/* ========================================================= */
/* 날짜바 */
/* ========================================================= */
.reserve-date-bar {
	display: flex;
	align-items: center;
	height: 54px;
	border: 1px solid #d8d9db;
	border-top: 3px solid #503396;
	background: #fff;
	padding: 0 15px;
	position: relative;
}

.reserve-date-prev, .reserve-date-next {
	width: 34px;
	height: 34px;
	border: none;
	background: none;
	font-size: 15px;
	cursor: pointer;
	color: #333;
}

.reserve-date-prev:hover, .reserve-date-next:hover {
	color: #503396;
}

/* 년도 바 */
.reserve-year-strip {
	position: absolute;
	top: -20px;
	left: 20px;
	right: 20px;
	display: flex;
	justify-content: space-between;
	font-size: 13px;
	color: #777;
}

/* 날짜 리스트 */
.reserve-date-list {
	flex: 1;
	margin: 0 12px;
	overflow: hidden;
}

.reserve-date-wrap {
	display: flex;
	gap: 20px;
	padding: 0 10px;
}

.reserve-date-btn {
	border: none;
	background: none;
	cursor: pointer;
	min-width: 40px;
	display: flex;
	flex-direction: column;
	align-items: center;
	color: #222;
	position: relative;
}

.reserve-date-btn em {
	font-size: 15px;
	font-weight: 700;
	margin-bottom: 2px;
}

.reserve-day-label {
	font-size: 11px;
	color: #666;
}

/* 비활성 날짜 */
.reserve-date-btn.disabled {
	color: #aaa;
	cursor: default;
}

.reserve-date-btn.disabled .reserve-day-label {
	color: #aaa;
}

/* 선택 날짜 */
.reserve-date-btn.selected {
	color: #503396;
}

.reserve-date-btn.selected .reserve-day-label {
	color: #503396;
}

.reserve-date-btn.selected::after {
	content: "";
	position: absolute;
	bottom: -6px;
	width: 70%;
	height: 3px;
	background: #503396;
	border-radius: 3px;
	left: 50%;
	transform: translateX(-50%);
}

/* 달력 버튼 */
.reserve-calendar-btn {
	margin-left: 10px;
	border: none;
	background: none;
	cursor: pointer;
	font-size: 14px;
	color: #333;
}

/* ========================================================= */
/* 메인 2단 레이아웃 */
/* ========================================================= */
.reserve-main {
	display: flex;
	gap: 25px;
	margin-top: 22px;
}

/* ========================================================= */
/* 영화 선택 패널 */
/* ========================================================= */
.reserve-movie-section {
	width: 350px;
}

.reserve-movie-title {
	font-size: 17px;
	font-weight: 700;
	margin-bottom: 6px;
	padding-bottom: 4px;
	border-bottom: 1px solid #ddd;
}

/* 등급 필터 탭 */
.reserve-filter-tabs {
	display: flex;
	margin-bottom: 10px;
}

.reserve-filter-tab {
	flex: 1;
	padding: 6px 0;
	border: 1px solid #dcdcdc;
	background: #f5f5f5;
	cursor: pointer;
	text-align: center;
	font-size: 13px;
}

.reserve-filter-tab.active {
	background: #503396;
	color: #fff;
	font-weight: 700;
}

/* 영화 리스트 박스 */
.reserve-movie-list {
	height: 450px;
	border: 1px solid #ddd;
	border-radius: 6px;
	overflow-y: auto;
	background: white;
}

.reserve-movie-item {
	width: 100%;
	display: flex;
	gap: 10px;
	align-items: center;
	padding: 10px 12px;
	background: #fff;
	cursor: pointer;
	border: none;
	font-size: 14px;
	text-align: left;
}

.reserve-movie-item:hover {
	background: #f7f2ff;
}

.reserve-movie-item.active {
	background: #e8e1ff;
}

/* 등급 배지 */
.reserve-movie-badge {
	display: inline-flex;
	padding: 2px 6px;
	color: #fff;
	border-radius: 4px;
	font-size: 11px;
	font-weight: 700;
}

.badge-all {
	background: #00a85a;
}

.badge-12 {
	background: #ffb400;
}

.badge-15 {
	background: #ff6f00;
}

.badge-19 {
	background: #e02020;
}

/* ========================================================= */
/* 시간 선택 섹션 */
/* ========================================================= */
.reserve-time-section {
	flex: 1;
}

.reserve-time-title {
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid #ddd;
	font-size: 17px;
	font-weight: 700;
}

.reserve-time-legend {
	display: flex;
	gap: 8px;
	font-size: 13px;
	color: #666;
}

/* 시간 선택 */
.reserve-hour-row {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 12px 0;
}

.reserve-hour-wrap {
	display: flex;
	gap: 10px;
	overflow-x: auto;
}

.reserve-hour-btn {
	min-width: 46px;
	padding: 6px 0;
	border-radius: 4px;
	background: #f2f2f2;
	cursor: pointer;
	border: none;
	font-size: 14px;
}

.reserve-hour-btn.active {
	background: #503396;
	color: #fff;
}

/* ========================================================= */
/* 시간표 패널 */
/* ========================================================= */
.reserve-schedule-box {
	border: 1px solid #ddd;
	border-radius: 6px;
	height: 450px;
	margin-top: 10px;
	background: white;
	overflow: hidden;
}

.reserve-no-result {
	text-align: center;
	padding: 80px 0;
	color: #666;
	font-size: 14px;
	line-height: 1.6;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- ========================================================= -->
<!-- JS (날짜/영화/시간 선택용) -->
<!-- ========================================================= -->
<script type="text/javascript">
$(function() {
	$(".reserve-date-next").click(function(){
		var $list = $(".reserve-date-list");
        var amount = 100; // 한 번 이동할 픽셀 수

        $list.animate({
            scrollLeft: $list.scrollLeft() + amount
        }, 100);
	});
	
	$(".reserve-date-prev").click(function() {
        var $list = $(".reserve-date-list");
        var amount = 100;

        $list.animate({
            scrollLeft: $list.scrollLeft() - amount
        }, 100);
    });
})

function selectReserveDate(btn) {
    document.querySelectorAll(".reserve-date-btn").forEach(b => b.classList.remove("selected"));
    btn.classList.add("selected");
}

function selectReserveMovie(btn) {
    document.querySelectorAll(".reserve-movie-item").forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
}

function selectReserveHour(btn) {
    document.querySelectorAll(".reserve-hour-btn").forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
}
</script>
</head>

<body>
	<header id="header">
		<jsp:include page="../../fragments/header.jsp" />
	</header>
	<div class="reserve">

		<h2 class="reserve-title">빠른 예매</h2>

		<!-- ============================ 날짜바 ============================ -->
		<div class="wrap">
			<div class="reserve-date-bar">
				<button class="reserve-date-prev">&lt;</button>

				<div class="reserve-date-list">

					<!-- 년도 -->
					<div class="reserve-year-strip">
						<span>2025.11</span><span>2025.12</span>
					</div>

					<!-- 날짜 -->
					<div class="reserve-date-scroller">
						<div class="reserve-date-wrap">

							<%
							Calendar cal = Calendar.getInstance();
							String[] yoil = { "일", "월", "화", "수", "목", "금", "토" };
							
							int todayDate = cal.get(Calendar.DAY_OF_MONTH);
						    int lastDate  = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

							for (int i = todayDate; i <= lastDate; i++) {
								cal.set(2025, Calendar.DECEMBER, i);
								boolean disabled = i < todayDate;
								boolean selected = i == todayDate;
							%>
							<button type="button"
								class="reserve-date-btn <%=disabled ? "disabled" : ""%> <%=selected ? "selected" : ""%>"
								onclick="selectReserveDate(this)">
								<em><%=i%></em> <span class="reserve-day-label"><%=yoil[cal.get(Calendar.DAY_OF_WEEK) - 1]%></span>
							</button>
							<%
							}
							%>

						</div>
					</div>

				</div>

				<button class="reserve-date-next">&gt;</button>
				<button class="reserve-calendar-btn">달력보기</button>
			</div>

			<!-- ============================ 2단 패널 ============================ -->
			<div class="reserve-main">

				<!-- 영화 패널 -->
				<div class="reserve-movie-section">
					<div class="reserve-movie-title">
						<p>영화</p>
					</div>

					<div class="reserve-filter-tabs">
						<button class="reserve-filter-tab active">ALL</button>
						<button class="reserve-filter-tab">12</button>
						<button class="reserve-filter-tab">15</button>
						<button class="reserve-filter-tab">19</button>
					</div>

					<div class="reserve-movie-list">
						<button class="reserve-movie-item active"
							onclick="selectReserveMovie(this)">
							<span class="reserve-movie-badge badge-all">ALL</span> 주토피아 2
						</button>

						<button class="reserve-movie-item"
							onclick="selectReserveMovie(this)">
							<span class="reserve-movie-badge badge-15">15</span> 정보원
						</button>

						<button class="reserve-movie-item"
							onclick="selectReserveMovie(this)">
							<span class="reserve-movie-badge badge-19">19</span> 윗집 사람들
						</button>
					</div>
				</div>

				<!-- 시간 패널 -->
				<div class="reserve-time-section">

					<div class="reserve-time-title">
						<p>시간</p>
						<div class="reserve-time-legend">
							<span>🌅 조조</span> <span>☕ 브런치</span> <span>🌙 심야</span>
						</div>
					</div>

					<div class="reserve-hour-row">
						<div class="reserve-hour-wrap">

							<button class="reserve-hour-btn disabled">08</button>
							<button class="reserve-hour-btn">09</button>
							<button class="reserve-hour-btn active"
								onclick="selectReserveHour(this)">10</button>
							<button class="reserve-hour-btn"
								onclick="selectReserveHour(this)">11</button>
							<button class="reserve-hour-btn"
								onclick="selectReserveHour(this)">12</button>

						</div>
					</div>

					<div class="reserve-schedule-box">
						<div class="reserve-no-result">
							영화와 날짜, 시간을 선택하시면<br> 상영시간표를 비교하여 볼 수 있습니다.
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	<footer id="footer">
		<jsp:include page="../fragments/footer.jsp"></jsp:include>
	</footer>

</body>
</html>
