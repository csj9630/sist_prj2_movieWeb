package reserve.seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DBConnection.DbConn;


public class SeatBookingDAO {
	private static SeatBookingDAO sbDAO;

	private SeatBookingDAO() {
		// 생성자 잠금
	}// WebMemerDAO


	public static SeatBookingDAO getInstance() {
		if (sbDAO == null) {
			sbDAO = new SeatBookingDAO();

		} // end if

		return sbDAO;
	}// getInstance
	
	
	/**
	 * 좌석 예약 가능 여부 확인
	 * @param screenCode 상영 코드
	 * @param seatCode 좌석 코드
	 * @return true: 예약 가능, false: 예약 불가
	 */
	public boolean selectSeatStatus(String screenCode, String seatCode) throws SQLException {
		boolean resultFlag = false;

		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1.JNDI 사용객체 생성
			// 2.DataSource 얻기
			// 3.DataSource에서 Connection 얻기
			con = dbCon.getConn();

			// 4.쿼리문 생성객체 얻기
			StringBuilder selectSeatStatus = new StringBuilder();

			selectSeatStatus
			.append("	select count(*) as cnt	")
			.append("	from seat_book sb		")
			.append("	inner join book b on sb.book_num = b.book_num	")
			.append("	where sb.screen_code = ?	")
			.append("	and sb.seat_code = ? 	")
			.append("	and b.book_state in ('예약중', '예약완료', 'T')	");
	
			
			
			pstmt = con.prepareStatement(selectSeatStatus.toString());
			// 5.바인드 변수 값 설정
	        pstmt.setString(1, screenCode);
            pstmt.setString(2, seatCode);

			// 6.쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 0이면 예약 가능
				resultFlag = rs.getInt("CNT") == 0;
			} // end if

		} finally {
			// 7.연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally

		return resultFlag;
	}// selectSeatStatus
	
	/**
	 * BOOK_STATE 업데이트
	 * @param bookNum 예매 번호
	 * @param bookState 변경할 상태 ('예약중', '예약완료', '취소' 등)
	 * @return 업데이트된 행 수 (1: 성공, 0: 실패)
	 */
	public int updateBookState(String bookNum, String bookState) throws SQLException {
		int rowCount = 0;

		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dbCon.getConn();

			StringBuilder updateBookState = new StringBuilder();
			updateBookState
			.append("	update book			")
			.append("	set book_state = ?	")
			.append("	where book_num = ?	");

			pstmt = con.prepareStatement(updateBookState.toString());
			
			// 바인드 변수 값 설정
			pstmt.setString(1, bookState);
			pstmt.setString(2, bookNum);

			// 쿼리 수행
			rowCount = pstmt.executeUpdate();

		} finally {
			dbCon.dbClose(null, pstmt, con);
		} // end finally

		return rowCount;
	}// updateBookState
	
	
}// class
