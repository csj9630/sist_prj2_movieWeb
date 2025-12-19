# DBCP 설정 확인 보고서

## 요약
이 프로젝트의 DBCP(Database Connection Pool) 설정 상태를 확인하고 필요한 설정 파일을 추가했습니다.

## 확인 결과

### ✅ DBCP를 사용하는 코드가 존재함
프로젝트에는 DBCP를 사용하기 위한 코드가 이미 구현되어 있습니다:

#### 1. DbConn 클래스 (3개)
다음 위치에 DBCP를 통해 Connection을 얻는 DbConn 클래스가 존재:
- `src/main/java/DBConnection/DbConn.java`
- `src/main/java/moviestory/util/DbConn.java` (주석 포함)
- `src/main/java/screenInfo/DbConn.java`

모든 DbConn 클래스는 JNDI 이름 **"jdbc/dbcp"**를 사용하여 DataSource를 조회:
```java
// DBCP에서 DataSource 얻기
DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
```

#### 2. DAO 클래스들 (13개)
다음 DAO 클래스들이 DbConn을 통해 DBCP를 사용:
- movie_mypage.MypageDAO
- movie_mypage_book.BookDAO
- MovieWithdraw.MovieWithdrawDAO
- screenInfo.ScreenInfoDAO
- movie.booking.ScreenBookDAO
- movie.MovieDAO
- movie.detail.DetailDAO
- movie.image.ImageDAO
- movie.review.ReviewDAO
- movie.trailer.TrailerDAO
- member.UserDAO
- moviestory.dao.MovieReviewDAO
- moviestory.dao.MovieTimelineDAO

### ❌ DBCP 설정 파일이 없었음
다음 필수 설정 파일들이 존재하지 않았음:
- ❌ `META-INF/context.xml` - DBCP 리소스 정의 파일
- ❌ `WEB-INF/web.xml` - DBCP 리소스 참조 파일

### ❌ DBCP 라이브러리 확인
`WEB-INF/lib/` 디렉토리에 Oracle JDBC 드라이버가 없음:
- 필요 파일: `ojdbc8.jar` 또는 `ojdbc11.jar`

## 추가한 설정 파일

### 1. context.xml
**위치**: `src/main/webapp/META-INF/context.xml`

Tomcat의 DBCP 리소스를 정의하는 파일로, 다음 설정을 포함:
- JNDI 이름: `jdbc/dbcp`
- 데이터베이스 드라이버: Oracle JDBC
- 커넥션 풀 설정 (최대 연결 수, 유휴 연결 수 등)
- 연결 검증 쿼리

**⚠️ 주의**: 실제 환경에 맞게 수정 필요:
- `url`: 데이터베이스 접속 URL
- `username`: 데이터베이스 사용자명
- `password`: 데이터베이스 비밀번호

### 2. web.xml
**위치**: `src/main/webapp/WEB-INF/web.xml`

애플리케이션에서 DBCP 리소스를 참조하기 위한 설정 파일:
- 리소스 참조 이름: `jdbc/dbcp`
- 타입: `javax.sql.DataSource`

### 3. DBCP_CONFIGURATION.md
**위치**: `DBCP_CONFIGURATION.md`

DBCP 설정에 대한 상세 가이드 문서:
- 설정 파일 설명
- 사용 방법
- 파라미터 설명
- 필수 라이브러리
- 트러블슈팅
- 보안 고려사항

### 4. README.md 업데이트
프로젝트 README에 DBCP 설정 관련 정보 추가

## 다음 단계

애플리케이션을 실행하기 전에 다음 작업이 필요합니다:

### 1. Oracle JDBC 드라이버 추가 ⚠️
```bash
# ojdbc8.jar 파일을 다운로드하여 다음 위치에 복사
src/main/webapp/WEB-INF/lib/ojdbc8.jar
```

### 2. 데이터베이스 연결 정보 수정 ⚠️
`src/main/webapp/META-INF/context.xml` 파일을 열어 다음 항목 수정:
```xml
url="jdbc:oracle:thin:@[호스트]:[포트]:[SID]"
username="실제_사용자명"
password="실제_비밀번호"
```

### 3. Tomcat 서버 재시작
설정 변경 후 Tomcat 서버를 재시작하여 새로운 DBCP 설정을 적용

## 결론

✅ **DBCP 설정이 완료되었습니다.**

- 코드는 이미 DBCP를 사용하도록 구현되어 있었음
- 누락된 설정 파일(context.xml, web.xml)을 추가함
- 상세한 설정 가이드 문서를 작성함
- README를 업데이트하여 사용자에게 안내함

사용자는 데이터베이스 연결 정보만 수정하면 바로 DBCP를 사용할 수 있습니다.
