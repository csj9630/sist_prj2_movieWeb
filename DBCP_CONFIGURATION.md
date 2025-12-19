# DBCP (Database Connection Pool) 설정 가이드

## 개요
이 프로젝트는 DBCP(Database Connection Pool)를 사용하여 데이터베이스 연결을 관리합니다.
DBCP를 사용하면 데이터베이스 연결을 재사용하여 성능을 향상시킬 수 있습니다.

## 설정 파일 위치

### 1. context.xml
- **경로**: `src/main/webapp/META-INF/context.xml`
- **역할**: Tomcat 서버의 DBCP 리소스를 정의하는 파일
- **JNDI 이름**: `jdbc/dbcp`

### 2. web.xml
- **경로**: `src/main/webapp/WEB-INF/web.xml`
- **역할**: 애플리케이션에서 DBCP 리소스를 참조하기 위한 설정

## DBCP 사용 방법

### DbConn 클래스를 통한 연결
프로젝트에는 3개의 DbConn 클래스가 있습니다:
1. `DBConnection.DbConn` - 범용 DB 연결 클래스 (src/main/java/DBConnection/DbConn.java)
2. `moviestory.util.DbConn` - 영화 스토리 기능용 (주석 포함, src/main/java/moviestory/util/DbConn.java)
3. `screenInfo.DbConn` - 상영 정보 기능용 (src/main/java/screenInfo/DbConn.java)

모든 DbConn 클래스는 동일한 방식으로 작동:
```java
// 1. DbConn 인스턴스 생성 (싱글톤 패턴)
DbConn db = DbConn.getInstance("jdbc/dbcp");

// 2. Connection 얻기
Connection con = db.getConn();

// 3. DB 작업 수행
PreparedStatement pstmt = con.prepareStatement("SELECT ...");
ResultSet rs = pstmt.executeQuery();

// 4. 리소스 해제
db.dbClose(rs, pstmt, con);
```

### DAO 클래스 예시
현재 프로젝트의 모든 DAO 클래스들은 DBCP를 사용합니다:
- `movie_mypage.MypageDAO`
- `movie_mypage_book.BookDAO`
- `MovieWithdraw.MovieWithdrawDAO`
- `screenInfo.ScreenInfoDAO`
- `movie.booking.ScreenBookDAO`
- `movie.MovieDAO`
- `movie.detail.DetailDAO`
- `movie.image.ImageDAO`
- `movie.review.ReviewDAO`
- `movie.trailer.TrailerDAO`
- `member.UserDAO`
- `moviestory.dao.MovieReviewDAO`
- `moviestory.dao.MovieTimelineDAO`

## 설정 변경 방법

### 데이터베이스 연결 정보 수정
`src/main/webapp/META-INF/context.xml` 파일에서 다음 항목을 수정:

```xml
<Resource 
    name="jdbc/dbcp"
    auth="Container"
    type="javax.sql.DataSource"
    driverClassName="oracle.jdbc.driver.OracleDriver"
    url="jdbc:oracle:thin:@localhost:1521:xe"
    username="your_username"        <!-- ⚠️ 실제 DB 사용자명으로 반드시 변경 -->
    password="your_password"        <!-- ⚠️ 실제 DB 비밀번호로 반드시 변경 -->
    maxTotal="20"                   <!-- 최대 연결 수 -->
    maxIdle="10"                    <!-- 유휴 연결 수 -->
    maxWaitMillis="10000"           <!-- 연결 대기 시간 (ms) -->
    ...
/>
```

### 주요 설정 파라미터 설명

| 파라미터 | 설명 | 권장값 |
|---------|------|--------|
| `maxTotal` | 풀에서 관리할 최대 연결 수 | 20-50 |
| `maxIdle` | 풀에 유지할 유휴 연결 수 | 10-20 |
| `minIdle` | 풀에 유지할 최소 유휴 연결 수 | 5-10 |
| `maxWaitMillis` | 연결을 얻기 위한 최대 대기 시간 (밀리초) | 10000 |
| `removeAbandonedOnBorrow` | 버려진 연결 제거 활성화 | true |
| `removeAbandonedTimeout` | 연결을 버려진 것으로 간주하는 시간 (초) | 60 |
| `testOnBorrow` | 연결을 빌릴 때 유효성 검사 | true |
| `validationQuery` | 연결 유효성 검사 쿼리 | SELECT 1 FROM DUAL |

## 필수 라이브러리

DBCP를 사용하려면 다음 라이브러리가 필요합니다:

### Oracle JDBC Driver
- **파일**: `ojdbc8.jar` 또는 `ojdbc11.jar`
- **위치**: `src/main/webapp/WEB-INF/lib/`
- **다운로드**: [Oracle JDBC Downloads](https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)

### Apache Commons DBCP (옵션)
Tomcat에는 기본적으로 DBCP 구현이 포함되어 있지만, 추가 기능이 필요한 경우:
- commons-dbcp2.jar
- commons-pool2.jar

## 트러블슈팅

### 1. "Cannot create JNDI resource" 오류
- context.xml 파일의 위치가 올바른지 확인 (META-INF 폴더)
- JNDI 이름이 일치하는지 확인 ("jdbc/dbcp")

### 2. "No suitable driver found" 오류
- Oracle JDBC 드라이버가 WEB-INF/lib에 있는지 확인
- driverClassName이 올바른지 확인

### 3. 연결 시간 초과
- 데이터베이스 서버가 실행 중인지 확인
- URL, username, password가 올바른지 확인
- 방화벽 설정 확인

### 4. "Connection pool exhausted" 오류
- maxTotal 값을 증가
- 연결을 사용 후 반드시 close() 호출하는지 확인
- dbClose() 메서드가 finally 블록에서 호출되는지 확인

## 보안 고려사항

⚠️ **매우 중요**: 데이터베이스 접속 정보는 민감한 보안 정보입니다!

1. **비밀번호 보호**: context.xml의 비밀번호는 평문으로 저장되므로 주의
   - ❌ 절대로 기본값(your_username, your_password)으로 배포하지 마세요
   - ✅ 프로덕션 환경에서는 암호화된 비밀번호 사용 권장
   - ✅ 환경 변수나 외부 설정 파일(JNDI) 사용 고려
   - ✅ Tomcat의 Resource 암호화 기능 활용

2. **접근 권한**: context.xml 파일의 접근 권한 제한
   ```bash
   chmod 600 src/main/webapp/META-INF/context.xml
   ```

3. **.gitignore 설정**: 실제 DB 정보가 포함된 파일은 버전 관리에서 제외
   - context.xml을 .gitignore에 추가하고 context.xml.template 사용 권장
   - 또는 실제 정보가 담긴 context.xml은 서버에만 배치

4. **배포 체크리스트**:
   - [ ] username이 실제 값으로 변경되었는가?
   - [ ] password가 실제 값으로 변경되었는가?
   - [ ] url이 프로덕션 서버 정보로 설정되었는가?
   - [ ] 실제 비밀번호가 Git에 커밋되지 않았는가?

## 모니터링

### 연결 풀 상태 확인
Tomcat Manager를 통해 DBCP 상태를 모니터링할 수 있습니다:
- 활성 연결 수
- 유휴 연결 수
- 대기 중인 요청 수

### 로깅
`logAbandoned="true"` 설정으로 버려진 연결을 추적할 수 있습니다.

## 참고 자료
- [Apache Tomcat JDBC Connection Pool](https://tomcat.apache.org/tomcat-9.0-doc/jdbc-pool.html)
- [Oracle JDBC Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/21/jjdbc/)
- [Apache Commons DBCP](https://commons.apache.org/proper/commons-dbcp/)
