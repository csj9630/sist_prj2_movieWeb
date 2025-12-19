package seat.booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DbConn;


public class SeatBookDAO {
	private static SeatBookDAO sbDAO;

	private SeatBookDAO() {

	}
	
	public static SeatBookDAO getInstance() {
		if (sbDAO == null) {
			sbDAO = new SeatBookDAO();
		} // end if
		return sbDAO;
	}//getInstance
	
	//빠른 예매 페이지에서 페이지 로딩시 좌석 그리기
	public List<SeatBookDTO> selectAllSeatBook(String id) throws SQLException {
		List<SeatBookDTO> list = new ArrayList<SeatBookDTO>();

		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1. JNDI사용객체 생성
			// 2. DataSource 얻기
			// 3. Connection 얻기
			con = dbCon.getConn();
			// 4. 쿼리문생성객체 얻기
			StringBuilder selectRestaurant = new StringBuilder();
			selectRestaurant.append(" select rest_num, rest_name, menu, lat, lng, input_date ")
					.append(" from restaurant ").append(" where id=? ");
			pstmt = con.prepareStatement(selectRestaurant.toString());
			// 5. 바인드변수 값 설정
			int pstmtIdx = 0;
			pstmt.setString(1, id);

			// 6. 조회결과 얻기
			RestaurantDTO rDTO = null;

			rs = pstmt.executeQuery();

			while (rs.next()) {
				rDTO = new RestaurantDTO();
				rDTO.setRest_num(rs.getInt("rest_num"));
				rDTO.setRest_name(rs.getString("rest_name"));
				rDTO.setMenu(rs.getString("menu"));
				rDTO.setLat(rs.getDouble("lat"));
				rDTO.setLng(rs.getDouble("lng"));
				rDTO.setInput_date(rs.getDate("input_date"));
				list.add(rDTO);
			} // end while
		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return list;

	}// selectAllRestaurant
	
	
}//class
