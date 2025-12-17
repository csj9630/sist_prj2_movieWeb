// ==================== 데이터 ====================
// 영화 데이터 (샘플)
const movies = [
    {
        id: 1,
        title: '위키드: 포굿',
        grade: 'all',
        liked: false
    },
    {
        id: 2,
        title: '주토피아 2',
        grade: 'all',
        liked: false
    },
    {
        id: 3,
        title: '나우 유 씨 미 3',
        grade: '12',
        liked: false
    },
    {
        id: 4,
        title: '극장판 제이슨 맨: 래제겐',
        grade: '15',
        liked: false
    },
    {
        id: 5,
        title: '가타카 1도시 레이더 PICK',
        grade: '15',
        liked: false
    },
    {
        id: 6,
        title: '정복왕',
        grade: '15',
        liked: false
    },
    {
        id: 7,
        title: '나혼자 프린스',
        grade: '12',
        liked: false
    },
    {
        id: 8,
        title: '국보',
        grade: '15',
        liked: false
    },
    {
        id: 9,
        title: '부코니아',
        grade: '19',
        liked: false
    },
    {
        id: 10,
        title: '극장판 귀멸의 칼날: 무한성편',
        grade: '15',
        liked: false
    },
    {
        id: 11,
        title: '인조직의 소녀',
        grade: '15',
        liked: false
    },
    {
        id: 12,
        title: '프레데터: 축출의 땅',
        grade: '15',
        liked: false
    },
    {
        id: 13,
        title: '빼빼이어 하터 D',
        grade: '15',
        liked: false
    },
    {
        id: 14,
        title: '사랑과 고기',
        grade: '12',
        liked: false
    },
    {
        id: 15,
        title: '반지의 제왕 : 반지원정대',
        grade: '12',
        liked: false
    }
];

// 상영 시간표 데이터 (영화별, 날짜별)
const schedules = {
    1: { // 위키드: 포굿
        '2025-12-22': [
            { theater: '안성스타필드', screen: '2관 [Laser]', time: '10:00', seats: 227, available: 166, type: 'morning', format: '2D Dolby(자막)' },
            { theater: '안성스타필드', screen: '2관 [Laser]', time: '10:50', seats: 227, available: 250, type: 'morning', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '4관 [Laser]', time: '11:40', seats: 181, available: 178, type: 'brunch', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '2관 [Laser]', time: '12:45', seats: 227, available: 229, type: 'brunch', format: '2D Dolby(자막)' },
            { theater: '안성스타필드', screen: '3관 [Laser]', time: '13:35', seats: 262, available: 255, type: 'normal', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '4관 [Laser]', time: '14:25', seats: 181, available: 171, type: 'normal', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '1관 [Laser]', time: '15:30', seats: 262, available: 255, type: 'normal', format: '(한국수어) 2D(자막)' },
        ],
        '2025-12-23': [
            { theater: '안성스타필드', screen: '1관 [Laser]', time: '09:30', seats: 227, available: 200, type: 'morning', format: '2D Dolby(자막)' },
            { theater: '안성스타필드', screen: '3관 [Laser]', time: '12:20', seats: 262, available: 240, type: 'brunch', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '2관 [Laser]', time: '15:30', seats: 227, available: 180, type: 'normal', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '4관 [Laser]', time: '18:40', seats: 181, available: 120, type: 'normal', format: '2D Dolby(자막)' },
        ]
    },
    2: { // 주토피아 2
        '2025-12-22': [
            { theater: '안성스타필드', screen: '5관', time: '09:00', seats: 150, available: 145, type: 'morning', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '5관', time: '11:30', seats: 150, available: 130, type: 'brunch', format: '2D(더빙)' },
            { theater: '안성스타필드', screen: '6관', time: '14:00', seats: 120, available: 100, type: 'normal', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '5관', time: '16:30', seats: 150, available: 90, type: 'normal', format: '2D(더빙)' },
            { theater: '안성스타필드', screen: '6관', time: '19:00', seats: 120, available: 80, type: 'normal', format: '2D(자막)' },
        ],
        '2025-12-23': [
            { theater: '안성스타필드', screen: '5관', time: '10:00', seats: 150, available: 140, type: 'morning', format: '2D(더빙)' },
            { theater: '안성스타필드', screen: '6관', time: '13:30', seats: 120, available: 110, type: 'normal', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '5관', time: '17:00', seats: 150, available: 95, type: 'normal', format: '2D(더빙)' },
        ]
    },
    3: { // 나우 유 씨 미 3
        '2025-12-22': [
            { theater: '안성스타필드', screen: '7관', time: '11:00', seats: 100, available: 95, type: 'brunch', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '7관', time: '14:30', seats: 100, available: 85, type: 'normal', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '8관', time: '17:45', seats: 90, available: 70, type: 'normal', format: '2D(자막)' },
            { theater: '안성스타필드', screen: '7관', time: '20:50', seats: 100, available: 60, type: 'normal', format: '2D(자막)' },
        ]
    }
};

// ==================== 전역 변수 ====================
let selectedDate = null;
let selectedMovieId = null;
let selectedGrade = 'all';
let selectedTimeSlot = null;
let dateScrollPosition = 0;
let timeScrollPosition = 0;

// ==================== 초기화 ====================
$(document).ready(function() {
    initDates();
    renderMovieList();
    bindEvents();
});

// ==================== 날짜 초기화 ====================
function initDates() {
    const dateList = $('#dateList');
    const today = new Date();
    
    // 오늘부터 14일간의 날짜 생성
    for (let i = 0; i < 14; i++) {
        const date = new Date(today);
        date.setDate(today.getDate() + i);
        
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        const dayOfWeek = date.getDay();
        const dateStr = `${year}-${month}-${day}`;
        
        const dayNames = ['일', '월', '화', '수', '목', '금', '토'];
        const dayName = i === 0 ? '오늘' : i === 1 ? '내일' : dayNames[dayOfWeek];
        
        let dayClass = '';
        if (dayOfWeek === 0) dayClass = 'sunday';
        else if (dayOfWeek === 6) dayClass = 'saturday';
        
        const dateItem = `
            <div class="date-item ${dayClass}" data-date="${dateStr}">
                <div class="year-month">${year}.${month}</div>
                <div class="day">${parseInt(day)}</div>
                <div class="day-name">${dayName}</div>
            </div>
        `;
        
        dateList.append(dateItem);
    }
    
    // 첫 번째 날짜 자동 선택
    const firstDate = dateList.find('.date-item').first();
    firstDate.addClass('active');
    selectedDate = firstDate.data('date');
}

// ==================== 영화 목록 렌더링 ====================
function renderMovieList(grade = 'all') {
    const movieList = $('#movieList');
    movieList.empty();
    
    const filteredMovies = grade === 'all' 
        ? movies 
        : movies.filter(m => m.grade === grade);
    
    filteredMovies.forEach(movie => {
        const gradeClass = movie.grade === 'all' ? 'all' : `age-${movie.grade}`;
        const gradeText = movie.grade === 'all' ? '전체' : movie.grade;
        
        const movieItem = `
            <div class="movie-item" data-id="${movie.id}">
                <span class="grade-badge ${gradeClass}">${gradeText}</span>
                <span class="movie-title">${movie.title}</span>
                <button class="like-btn">${movie.liked ? '♥' : '♡'}</button>
            </div>
        `;
        
        movieList.append(movieItem);
    });
}

// ==================== 상영 시간표 렌더링 ====================
function renderSchedule() {
    const scheduleList = $('#scheduleList');
    
    // 선택된 영화와 날짜가 없으면 안내 메시지
    if (!selectedMovieId || !selectedDate) {
        scheduleList.html(`
            <div class="no-selection">
                <div class="no-selection-icon">🎬</div>
                <p>날짜와 영화를 선택하시면<br>상영시간표를 확인하실 수 있습니다.</p>
            </div>
        `);
        return;
    }
    
    // 해당 영화의 상영 시간표 가져오기
    const movieSchedules = schedules[selectedMovieId];
    if (!movieSchedules || !movieSchedules[selectedDate]) {
        scheduleList.html(`
            <div class="no-selection">
                <div class="no-selection-icon">😢</div>
                <p>선택하신 날짜에 상영 일정이 없습니다.</p>
            </div>
        `);
        return;
    }
    
    let scheduleData = movieSchedules[selectedDate];
    
    // 시간대 필터 적용
    if (selectedTimeSlot) {
        scheduleData = scheduleData.filter(s => {
            const hour = parseInt(s.time.split(':')[0]);
            return hour === parseInt(selectedTimeSlot);
        });
        
        if (scheduleData.length === 0) {
            scheduleList.html(`
                <div class="no-selection">
                    <div class="no-selection-icon">⏰</div>
                    <p>선택하신 시간대에 상영 일정이 없습니다.</p>
                </div>
            `);
            return;
        }
    }
    
    // 극장별로 그룹화
    const theaterGroups = {};
    scheduleData.forEach(schedule => {
        if (!theaterGroups[schedule.theater]) {
            theaterGroups[schedule.theater] = [];
        }
        theaterGroups[schedule.theater].push(schedule);
    });
    
    // HTML 생성
    scheduleList.empty();
    
    Object.keys(theaterGroups).forEach(theater => {
        const times = theaterGroups[theater];
        
        let timeSlotsHtml = '';
        times.forEach(time => {
            const typeIcon = time.type === 'morning' ? '<i class="icon morning">조</i>' :
                           time.type === 'brunch' ? '<i class="icon brunch">브</i>' :
                           time.type === 'night' ? '<i class="icon night">심</i>' : '';
            
            timeSlotsHtml += `
                <button class="time-button" onclick="bookTicket(${selectedMovieId}, '${selectedDate}', '${time.time}')">
                    ${typeIcon ? `<span class="time-badge">${typeIcon}</span>` : ''}
                    <div class="time">${time.time}</div>
                    <div class="screen-info">${time.screen}</div>
                    <div class="screen-info">${time.format}</div>
                    <div class="seat-info">
                        <span class="available">${time.available}</span>/${time.seats}
                    </div>
                </button>
            `;
        });
        
        const scheduleHtml = `
            <div class="schedule-item">
                <div class="schedule-header">
                    <span class="theater-name">${theater}</span>
                    <span class="screen-type">DOLBY CINEMA</span>
                </div>
                <div class="time-slots-list">
                    ${timeSlotsHtml}
                </div>
            </div>
        `;
        
        scheduleList.append(scheduleHtml);
    });
}

// ==================== 이벤트 바인딩 ====================
function bindEvents() {
    // 날짜 선택
    $(document).on('click', '.date-item', function() {
        $('.date-item').removeClass('active');
        $(this).addClass('active');
        selectedDate = $(this).data('date');
        renderSchedule();
    });
    
    // 날짜 이전/다음
    $('#prevDate').on('click', function() {
        scrollDates(-1);
    });
    
    $('#nextDate').on('click', function() {
        scrollDates(1);
    });
    
    // 영화 등급 필터
    $('.filter-btn').on('click', function() {
        $('.filter-btn').removeClass('active');
        $(this).addClass('active');
        selectedGrade = $(this).data('grade');
        renderMovieList(selectedGrade);
    });
    
    // 영화 선택
    $(document).on('click', '.movie-item', function() {
        $('.movie-item').removeClass('active');
        $(this).addClass('active');
        selectedMovieId = $(this).data('id');
        renderSchedule();
    });
    
    // 좋아요 버튼
    $(document).on('click', '.like-btn', function(e) {
        e.stopPropagation();
        const movieId = $(this).closest('.movie-item').data('id');
        const movie = movies.find(m => m.id === movieId);
        if (movie) {
            movie.liked = !movie.liked;
            $(this).text(movie.liked ? '♥' : '♡');
        }
    });
    
    // 시간대 선택
    $(document).on('click', '.time-slot', function() {
        if ($(this).is(':disabled')) return;
        
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            selectedTimeSlot = null;
        } else {
            $('.time-slot').removeClass('active');
            $(this).addClass('active');
            selectedTimeSlot = $(this).data('hour');
        }
        
        renderSchedule();
    });
    
    // 시간대 이전/다음
    $('#prevTime').on('click', function() {
        scrollTimeSlots(-1);
    });
    
    $('#nextTime').on('click', function() {
        scrollTimeSlots(1);
    });
}

// ==================== 날짜 스크롤 ====================
function scrollDates(direction) {
    const dateList = $('#dateList');
    const itemWidth = 88; // 80px width + 8px gap
    const visibleCount = Math.floor($('.date-wrapper').width() / itemWidth);
    const maxScroll = $('.date-item').length - visibleCount;
    
    dateScrollPosition += direction;
    dateScrollPosition = Math.max(0, Math.min(dateScrollPosition, maxScroll));
    
    const translateX = -dateScrollPosition * itemWidth;
    dateList.css('transform', `translateX(${translateX}px)`);
    
    // 버튼 활성화/비활성화
    $('#prevDate').prop('disabled', dateScrollPosition === 0);
    $('#nextDate').prop('disabled', dateScrollPosition >= maxScroll);
}

// ==================== 시간대 스크롤 ====================
function scrollTimeSlots(direction) {
    const timeSlots = $('#timeSlots');
    const itemWidth = 58; // 50px width + 8px gap
    const visibleCount = Math.floor($('.time-slots-wrapper').width() / itemWidth);
    const maxScroll = $('.time-slot').length - visibleCount;
    
    timeScrollPosition += direction;
    timeScrollPosition = Math.max(0, Math.min(timeScrollPosition, maxScroll));
    
    const translateX = -timeScrollPosition * itemWidth;
    timeSlots.css('transform', `translateX(${translateX}px)`);
}

// ==================== 예매하기 ====================
function bookTicket(movieId, date, time) {
    const movie = movies.find(m => m.id === movieId);
    alert(`예매 진행\n\n영화: ${movie.title}\n날짜: ${date}\n시간: ${time}`);
    
    // 실제로는 좌석 선택 페이지로 이동
    // window.location.href = `/booking/seat?movieId=${movieId}&date=${date}&time=${time}`;
}

// ==================== 유틸리티 함수 ====================
function formatDate(dateStr) {
    const date = new Date(dateStr);
    const month = date.getMonth() + 1;
    const day = date.getDate();
    return `${month}월 ${day}일`;
}
