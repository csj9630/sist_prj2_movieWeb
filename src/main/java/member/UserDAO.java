package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DBConnection.DbConn;


/*+selectOneUser(String) : UserDTO // 사용자 한명 검색 
+selectUserList() : List<UserDTO> // 모든 사용자 검색 
+insertUser(UsersDTO) : int // 사용자 추가
+updateUser(UsersDTO) : int  // 사용자 정보 변경
+selectMovieHistory(String, int) : List<UserDTO) // 무비스토리 원하는 년도 기준으로 구하기
+updateActive(String) : int // 사용자 활성화 여부 변경
+selectDormantList(Char): UserDTO // 휴면 사용자 검색
+selectDoubleCheckId(String) : String //아이디 중복체크
+insertVerificationCodel(int) : int //메일 인증번호 테이블에 삽입
+selectLogin(String,String) :UserDTO //로그인 
*/
public class UserDAO {
	private static UserDAO mDAO;
	
	private UserDAO() {
	}
	
	public static UserDAO getInstance() {
		if(mDAO == null) {
			mDAO = new UserDAO();
		}//end if
		return mDAO;
	}//getInstance
	
	/**
	 * 사용자 ID 검색(중복체크 등에 사용)
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean selectId(String id) throws SQLException {
		boolean resultFlag=false; 
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1.JNDI 사용객체 생성
		//2.DataSource 얻기
		//3.DataSource에서 Connection 얻기
			con=dbCon.getConn();//1,2,3번 끝.
			System.out.println("con : "+ "con");
		//4.쿼리문 생성객체 얻기
			String selectId="select users_id from users where users_id=?";
			pstmt=con.prepareStatement(selectId);
		//5.바인드변수 값 설정
			pstmt.setString(1, id);
		//6.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			resultFlag=!rs.next();//아이디가 존재하면 true - 사용불가, 아이디가 존재하지 않으면 false - 사용가능.
		}finally {
		//7.연결 끊기.
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return resultFlag;
		
	}//selectId
}//class

