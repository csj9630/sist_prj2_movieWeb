package member;

import java.sql.SQLException;


/*+joinUser(UserDTO) : int // 회원가입
+loginUser(String,String) : UserDTO//로그인
+findUsersId(String, String, String, String) : String // 아이디 찾기
+doubleCheckUserId(String) : boolean//유저 아이디 중복 체크
+findUserPwd(String, String, String, int, String) : boolean // 비밀번호 찾기 ( 비밀번호 변경 실패시 false )
+userDetailPage(String) : UserDTO // 유저 상세 페이지 (나의 무비 스토리, 나의 예매 내역)
+userBooks(String) : UserDTO // 예매내역
+userMovieHistory(String, int) : UserDTO // 나의 무비스토리
+editUserInfo(String) : UserDTO // 내정보 수정
+editUserPass(String userId, String userPass) : int // 사용자 비밀번호 수정
+userWithdrawal(String userId) : int // 회원탈퇴
+checkDormant(String) : char // 사용자 휴먼계정 전환
+checkVerificationCode(int) : boolean // 메일 인증번호 확인 메소드
*/

public class UserInfoService {
	private static UserInfoService uiService;
	
	private UserInfoService() {
	}//UserInfoService
	
	public static UserInfoService getInstance() {
		if(uiService == null) {
			uiService=new UserInfoService();
		}//end if
		return uiService;
	}//getInstance
	
	/**
	 * DB에서 아이디를 조회하여 존재하는 id인지 찾음
	 * @param id
	 * @return
	 */
	public boolean searchId(String id) {
		boolean flag = false;
		
		UserDAO uDAO = UserDAO.getInstance();
		try {
			flag=uDAO.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return flag;
	}//searchId
	
}//class
