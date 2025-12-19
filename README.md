# sist_prj2_movieWeb

## 프로젝트 개요
영화 예매 웹 애플리케이션

## 데이터베이스 설정
이 프로젝트는 DBCP(Database Connection Pool)를 사용하여 데이터베이스 연결을 관리합니다.

**⚠️ 중요**: 애플리케이션을 실행하기 전에 DBCP 설정을 완료해야 합니다.

### DBCP 설정 파일
- `src/main/webapp/META-INF/context.xml` - DBCP 리소스 정의
- `src/main/webapp/WEB-INF/web.xml` - DBCP 리소스 참조

### 설정 방법
상세한 DBCP 설정 방법은 [DBCP_CONFIGURATION.md](./DBCP_CONFIGURATION.md) 문서를 참고하세요.

### 빠른 시작
1. `src/main/webapp/META-INF/context.xml` 파일을 열어 데이터베이스 연결 정보를 수정:
   ```xml
   url="jdbc:oracle:thin:@localhost:1521:xe"
   username="your_username"
   password="your_password"
   ```

2. Oracle JDBC 드라이버를 `src/main/webapp/WEB-INF/lib/` 디렉토리에 추가

3. Tomcat 서버에 배포 및 실행
