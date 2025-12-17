# 영화 예매 JavaScript 코드 상세 설명

## 📚 목차
1. [데이터 구조](#1-데이터-구조)
2. [전역 변수](#2-전역-변수)
3. [핵심 로직: 상영 시간표 표시](#3-핵심-로직-상영-시간표-표시)
4. [이벤트 처리](#4-이벤트-처리)
5. [초기화 과정](#5-초기화-과정)

---

## 1. 데이터 구조

### 1-1. 영화 데이터 (movies 배열)
```javascript
const movies = [
    {
        id: 1,              // 영화 고유 ID (상영 시간표와 연결하는 키)
        title: '위키드: 포굿',  // 영화 제목
        grade: 'all',       // 관람등급 ('all', '12', '15', '19')
        liked: false        // 좋아요 여부
    },
    // ... 더 많은 영화
];
```

**설명:**
- `id`: 상영 시간표 데이터(`schedules`)와 연결하는 **핵심 키값**
- `grade`: 등급 필터링에 사용 (전체/12세/15세/19세 버튼)
- `liked`: 사용자가 좋아요를 눌렀는지 여부

### 1-2. 상영 시간표 데이터 (schedules 객체)
```javascript
const schedules = {
    // 첫 번째 키: 영화 ID
    1: {
        // 두 번째 키: 날짜 (YYYY-MM-DD 형식)
        '2025-11-22': [
            {
                theater: '안성스타필드',      // 극장명
                screen: '2관 [Laser]',       // 상영관
                time: '10:00',               // 상영 시작 시간
                seats: 227,                  // 전체 좌석 수
                available: 166,              // 잔여 좌석 수
                type: 'morning',             // 시간대 타입 (morning/brunch/night/normal)
                format: '2D Dolby(자막)'     // 상영 포맷
            },
            // ... 같은 날짜의 다른 시간대들
        ],
        '2025-11-23': [ /* 다음 날 상영 시간표 */ ]
    },
    2: { /* 다른 영화의 상영 시간표 */ }
};
```

**데이터 구조의 핵심:**
```
schedules[영화ID][날짜] = 상영 시간 배열
```

**예시로 이해하기:**
```javascript
// "위키드: 포굿" (ID: 1) 영화의 2025-11-22 상영 시간표 가져오기
const movieSchedule = schedules[1]['2025-11-22'];
// 결과: 해당 날짜의 모든 상영 시간 배열
```

---

## 2. 전역 변수

```javascript
let selectedDate = null;        // 선택된 날짜 (예: '2025-11-22')
let selectedMovieId = null;     // 선택된 영화 ID (예: 1)
let selectedGrade = 'all';      // 선택된 등급 필터
let selectedTimeSlot = null;    // 선택된 시간대 (예: '10')
let dateScrollPosition = 0;     // 날짜 스크롤 위치
let timeScrollPosition = 0;     // 시간대 스크롤 위치
```

**왜 전역 변수를 사용하나?**
- 여러 함수에서 현재 선택 상태를 공유해야 하기 때문
- 사용자가 날짜를 바꾸거나 영화를 바꿀 때마다 시간표를 다시 그려야 함

---

## 3. 핵심 로직: 상영 시간표 표시

### 3-1. renderSchedule() 함수 - 전체 흐름

```javascript
function renderSchedule() {
    const scheduleList = $('#scheduleList');  // 시간표를 표시할 HTML 요소
    
    // ========== STEP 1: 유효성 검사 ==========
    // 날짜나 영화가 선택되지 않았으면 안내 메시지 표시
    if (!selectedMovieId || !selectedDate) {
        scheduleList.html(`
            <div class="no-selection">
                <div class="no-selection-icon">🎬</div>
                <p>날짜와 영화를 선택하시면<br>상영시간표를 확인하실 수 있습니다.</p>
            </div>
        `);
        return;  // 함수 종료
    }
    
    // ========== STEP 2: 데이터 가져오기 ==========
    // schedules 객체에서 선택된 영화의 데이터 가져오기
    const movieSchedules = schedules[selectedMovieId];
    
    // 해당 영화의 데이터가 없거나, 선택된 날짜의 데이터가 없으면
    if (!movieSchedules || !movieSchedules[selectedDate]) {
        scheduleList.html(`
            <div class="no-selection">
                <div class="no-selection-icon">😢</div>
                <p>선택하신 날짜에 상영 일정이 없습니다.</p>
            </div>
        `);
        return;
    }
    
    // ========== STEP 3: 시간표 데이터 가져오기 ==========
    // 이 부분이 핵심! 
    // schedules[영화ID][날짜]로 해당 날짜의 모든 상영 시간을 가져옴
    let scheduleData = movieSchedules[selectedDate];
    
    // ========== STEP 4: 시간대 필터 적용 (선택사항) ==========
    if (selectedTimeSlot) {
        // 사용자가 특정 시간대를 선택했다면 필터링
        scheduleData = scheduleData.filter(s => {
            const hour = parseInt(s.time.split(':')[0]);  // '10:00'에서 '10' 추출
            return hour === parseInt(selectedTimeSlot);   // 선택된 시간대와 비교
        });
        
        // 필터링 후 결과가 없으면 안내 메시지
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
    
    // ========== STEP 5: 극장별로 그룹화 ==========
    const theaterGroups = {};
    
    scheduleData.forEach(schedule => {
        // 극장명을 키로 사용하여 그룹화
        if (!theaterGroups[schedule.theater]) {
            theaterGroups[schedule.theater] = [];
        }
        theaterGroups[schedule.theater].push(schedule);
    });
    
    // ========== STEP 6: HTML 생성 및 표시 ==========
    scheduleList.empty();  // 기존 내용 삭제
    
    // 각 극장별로 HTML 생성
    Object.keys(theaterGroups).forEach(theater => {
        const times = theaterGroups[theater];
        
        let timeSlotsHtml = '';
        times.forEach(time => {
            // 시간대 타입에 따라 아이콘 결정
            const typeIcon = time.type === 'morning' ? '<i class="icon morning">조</i>' :
                           time.type === 'brunch' ? '<i class="icon brunch">브</i>' :
                           time.type === 'night' ? '<i class="icon night">심</i>' : '';
            
            // 각 시간 버튼 HTML 생성
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
        
        // 극장별 섹션 HTML
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
```

### 3-2. 상영 시간표 표시 로직 시각화

```
사용자 동작: 날짜 선택 + 영화 선택
           ↓
    renderSchedule() 함수 호출
           ↓
    ┌─────────────────────────────────┐
    │ 1. 유효성 검사                    │
    │    - 날짜 선택됨? selectedDate   │
    │    - 영화 선택됨? selectedMovieId│
    └─────────────────────────────────┘
           ↓
    ┌─────────────────────────────────┐
    │ 2. 데이터 가져오기                │
    │    schedules[영화ID][날짜]       │
    │    예: schedules[1]['2025-11-22']│
    └─────────────────────────────────┘
           ↓
    ┌─────────────────────────────────┐
    │ 3. 시간대 필터 적용 (선택사항)    │
    │    10시를 선택했다면             │
    │    10:00~10:59 사이만 필터링     │
    └─────────────────────────────────┘
           ↓
    ┌─────────────────────────────────┐
    │ 4. 극장별로 그룹화                │
    │    같은 극장끼리 묶기             │
    └─────────────────────────────────┘
           ↓
    ┌─────────────────────────────────┐
    │ 5. HTML 생성 및 화면에 표시       │
    │    - 극장명 표시                 │
    │    - 각 시간 버튼 생성           │
    │    - 좌석 정보 표시              │
    └─────────────────────────────────┘
```

---

## 4. 이벤트 처리

### 4-1. 날짜 선택 이벤트

```javascript
// 날짜 아이템을 클릭했을 때
$(document).on('click', '.date-item', function() {
    // STEP 1: 기존 선택 해제
    $('.date-item').removeClass('active');
    
    // STEP 2: 클릭한 날짜에 active 클래스 추가 (보라색 강조)
    $(this).addClass('active');
    
    // STEP 3: 전역 변수에 선택된 날짜 저장
    // data-date 속성에서 날짜 값을 가져옴 (예: '2025-11-22')
    selectedDate = $(this).data('date');
    
    // STEP 4: 상영 시간표 다시 그리기
    renderSchedule();
});
```

**동작 순서:**
1. 사용자가 날짜 클릭
2. 클릭한 날짜가 `selectedDate` 변수에 저장됨
3. `renderSchedule()` 함수가 자동으로 호출됨
4. `renderSchedule()`에서 `schedules[selectedMovieId][selectedDate]`로 시간표 조회
5. 화면에 시간표 표시

### 4-2. 영화 선택 이벤트

```javascript
// 영화 아이템을 클릭했을 때
$(document).on('click', '.movie-item', function() {
    // STEP 1: 기존 선택 해제
    $('.movie-item').removeClass('active');
    
    // STEP 2: 클릭한 영화에 active 클래스 추가 (보라색 배경)
    $(this).addClass('active');
    
    // STEP 3: 전역 변수에 선택된 영화 ID 저장
    // data-id 속성에서 영화 ID를 가져옴 (예: 1)
    selectedMovieId = $(this).data('id');
    
    // STEP 4: 상영 시간표 다시 그리기
    renderSchedule();
});
```

**동작 순서:**
1. 사용자가 영화 클릭
2. 클릭한 영화의 ID가 `selectedMovieId` 변수에 저장됨
3. `renderSchedule()` 함수가 자동으로 호출됨
4. `renderSchedule()`에서 `schedules[selectedMovieId][selectedDate]`로 시간표 조회
5. 화면에 시간표 표시

### 4-3. 시간대 필터 이벤트

```javascript
// 시간 슬롯(06, 07, 08... 버튼)을 클릭했을 때
$(document).on('click', '.time-slot', function() {
    // 비활성화된 버튼이면 무시
    if ($(this).is(':disabled')) return;
    
    // 이미 선택된 버튼을 다시 클릭하면 선택 해제
    if ($(this).hasClass('active')) {
        $(this).removeClass('active');
        selectedTimeSlot = null;  // 필터 해제
    } else {
        // 새로운 시간대 선택
        $('.time-slot').removeClass('active');  // 기존 선택 해제
        $(this).addClass('active');             // 새로 선택
        selectedTimeSlot = $(this).data('hour'); // 예: '10'
    }
    
    // 필터를 적용하여 시간표 다시 그리기
    renderSchedule();
});
```

**필터링 동작:**
```javascript
// renderSchedule() 함수 내부
if (selectedTimeSlot) {
    scheduleData = scheduleData.filter(s => {
        const hour = parseInt(s.time.split(':')[0]);
        return hour === parseInt(selectedTimeSlot);
    });
}
```

**예시:**
- 사용자가 "10" 버튼 클릭
- `selectedTimeSlot = '10'`
- 시간표에서 10:00, 10:30, 10:50 같은 10시대 상영만 필터링
- 09:00, 11:00 등은 표시되지 않음

---

## 5. 초기화 과정

### 5-1. 페이지 로드 시 실행 순서

```javascript
$(document).ready(function() {
    initDates();          // 1. 날짜 목록 생성
    renderMovieList();    // 2. 영화 목록 표시
    bindEvents();         // 3. 이벤트 리스너 등록
});
```

### 5-2. initDates() - 날짜 초기화

```javascript
function initDates() {
    const dateList = $('#dateList');
    const today = new Date();
    
    // 오늘부터 14일간 반복
    for (let i = 0; i < 14; i++) {
        // 날짜 계산
        const date = new Date(today);
        date.setDate(today.getDate() + i);  // i일 후의 날짜
        
        // 날짜 포맷 생성
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        const dateStr = `${year}-${month}-${day}`;  // '2025-11-22'
        
        // 요일 계산
        const dayOfWeek = date.getDay();  // 0(일)~6(토)
        const dayNames = ['일', '월', '화', '수', '목', '금', '토'];
        const dayName = i === 0 ? '오늘' : i === 1 ? '내일' : dayNames[dayOfWeek];
        
        // 토요일/일요일 클래스
        let dayClass = '';
        if (dayOfWeek === 0) dayClass = 'sunday';
        else if (dayOfWeek === 6) dayClass = 'saturday';
        
        // HTML 생성
        const dateItem = `
            <div class="date-item ${dayClass}" data-date="${dateStr}">
                <div class="year-month">${year}.${month}</div>
                <div class="day">${parseInt(day)}</div>
                <div class="day-name">${dayName}</div>
            </div>
        `;
        
        dateList.append(dateItem);
    }
    
    // 첫 번째 날짜(오늘) 자동 선택
    const firstDate = dateList.find('.date-item').first();
    firstDate.addClass('active');
    selectedDate = firstDate.data('date');
}
```

---

## 6. 전체 흐름 정리

### 시나리오: 사용자가 "11월 22일"과 "위키드: 포굿"을 선택하는 경우

```
1. 페이지 로드
   ↓
   initDates() 실행
   - 오늘(11/22)이 자동 선택됨
   - selectedDate = '2025-11-22'
   ↓
   renderMovieList() 실행
   - 영화 목록 15개 표시
   ↓
   
2. 사용자가 "위키드: 포굿" 클릭
   ↓
   영화 선택 이벤트 발생
   - selectedMovieId = 1
   ↓
   renderSchedule() 호출
   ↓
   schedules[1]['2025-11-22'] 조회
   ↓
   결과: 7개의 상영 시간 표시
   [
     { time: '10:00', theater: '안성스타필드', ... },
     { time: '10:50', theater: '안성스타필드', ... },
     { time: '11:40', theater: '안성스타필드', ... },
     { time: '12:45', theater: '안성스타필드', ... },
     { time: '13:35', theater: '안성스타필드', ... },
     { time: '14:25', theater: '안성스타필드', ... },
     { time: '15:30', theater: '안성스타필드', ... }
   ]
   ↓
   화면에 시간 버튼들이 표시됨
   
3. (선택사항) 사용자가 "10" 시간대 클릭
   ↓
   selectedTimeSlot = '10'
   ↓
   renderSchedule() 재호출
   ↓
   10시대만 필터링
   ↓
   결과: 2개의 상영 시간만 표시
   [
     { time: '10:00', ... },
     { time: '10:50', ... }
   ]
```

---

## 7. 핵심 포인트 요약

### 🎯 데이터 연결 구조
```javascript
// 이것이 전체 시스템의 핵심!
schedules[영화ID][날짜] = 상영시간 배열

// 예시
schedules[1]['2025-11-22'] = [
    { time: '10:00', ... },
    { time: '10:50', ... }
]
```

### 🔄 상태 관리
```javascript
// 전역 변수로 현재 선택 상태를 관리
selectedMovieId  // 어떤 영화?
selectedDate     // 어떤 날짜?
selectedTimeSlot // 어떤 시간대? (필터)

// 이 3개 변수가 변경될 때마다 renderSchedule()이 호출됨
```

### 📊 렌더링 흐름
```javascript
// 1. 사용자 행동 → 2. 변수 업데이트 → 3. renderSchedule() → 4. 화면 갱신

날짜 클릭 → selectedDate 변경 → renderSchedule() → 시간표 표시
영화 클릭 → selectedMovieId 변경 → renderSchedule() → 시간표 표시
시간 클릭 → selectedTimeSlot 변경 → renderSchedule() → 필터링된 시간표
```

이제 이 로직을 이해하셨다면 실제 백엔드와 연동할 때도 같은 구조를 사용하면 됩니다!
