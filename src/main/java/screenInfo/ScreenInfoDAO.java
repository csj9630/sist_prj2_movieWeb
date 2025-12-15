package screenInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ScreenInfoDAO {
	
	private static ScreenInfoDAO siDAO;
	
	private ScreenInfoDAO() {
		
	} // ScreenInfoDAO
	
	public static ScreenInfoDAO getInstance() {
		if(siDAO == null) {
			siDAO = new ScreenInfoDAO();
		} // end if
		return siDAO;
	} // getInstance
	
	// 날짜를 받아 상영 스케줄 리스트를 반환
	public List<Map<String, String>> selectScreenList(String date) throws SQLException {
	    List<Map<String, String>> list = new ArrayList<>();
	    
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	    
	    String sql = "select m.movie_grade, m.movie_code, m.movie_name, m.running_time, " +
	    		"t.theather_name, s.screen_open, t.total_seat " +
	    		"from screen_info s " +
	    		"join movie m on s.movie_code = m.movie_code " +
	    		"join theather_info t on s.theather_num = t.theather_num " +
	    		"where s.screen_date = to_date(?, 'yyyy-mm-dd') " +
	    		"order by m.movie_name asc, t.theather_name asc, s.screen_open asc";
	    
	    try {
	    	// DB 연결 (Connection Pool 사용 시 DataSource로 대체 가능)
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
	    	con = dbCon.getConn();
	    	
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, date); // Service에서 이미 변환된 날짜(yyyy-MM-dd)를 받음
	    	rs = pstmt.executeQuery();
	    	
	    	while (rs.next()) {
	    		Map<String, String> row = new HashMap<>();
	    		row.put("movie_grade", rs.getString("movie_grade"));
	    		row.put("movie_code", rs.getString("movie_code"));
	    		row.put("movie_name", rs.getString("movie_name"));
	    		row.put("running_time", rs.getString("running_time"));
	    		row.put("theather_name", rs.getString("theather_name"));
	    		row.put("screen_open", rs.getString("screen_open"));
	    		row.put("total_seat", rs.getString("total_seat"));
	    		row.put("remain_seat", "100석"); // 임시 데이터
	    		
	    		list.add(row);
	    	}
	    	
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	dbCon.dbClose(rs, pstmt, con);
	    }
	    
	    return list;
	}
	
	/*
	public List<ScreenInfoDTO> selectRangeScreenInfo(RangeDTO rDTO) throws SQLException {
		List<ScreenInfoDTO> list = new ArrayList<ScreenInfoDTO>();
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1. JDNI사용 객체 생성
			// 2. DataSource 얻기
			// 3. Connection 얻기
			con = dbCon.getConn();
			// 4. 쿼리문 생성 객체 얻기
			StringBuilder selectScreenInfo = new StringBuilder();
			selectScreenInfo
			.append("	select	num, title, input_date, ip, cnt, id									")
			.append("	from	(	select	num, title, input_date, ip, cnt, id,					")
			.append("							row_number() over(order by input_date desc) rnum	")
			.append("	from		board															");

			// dynamic query: 검색 키워드가 있다면 검색 키워드에 해당하는 글의 개수 검색
			if(rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty()) {
				selectScreenInfo
				.append(" where instr(	")
				.append(rDTO.getFieldStr())
				.append(", ?) != 0		");
			} // end if
			selectScreenInfo
			.append("	)	where		rnum between ? and ?										");
			
			pstmt = con.prepareStatement(selectScreenInfo.toString());
			// 5. 바인드 변수 값 설정
			int pstmtIdx = 0;
			if(rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(++pstmtIdx, rDTO.getKeyword());
			} // end if
			pstmt.setInt(++pstmtIdx, rDTO.getStartNum());
			pstmt.setInt(++pstmtIdx, rDTO.getEndNum());

			// 6. 조회결과 얻기
			ScreenInfoDTO bDTO = null;
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bDTO = new ScreenInfoDTO();
				bDTO.setNum(rs.getInt("num"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setInput_date(rs.getDate("input_date"));
				bDTO.setIp(rs.getString("ip"));
				bDTO.setCnt(rs.getInt("cnt"));
				bDTO.setId(rs.getString("id"));
				list.add(bDTO);
			} // end while
		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return list;
	} // selectEmp
	*/
}
