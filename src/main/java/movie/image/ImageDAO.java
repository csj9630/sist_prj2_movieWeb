package movie.image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DbConn;

public class ImageDAO {
	// ------싱글톤 패턴------------------------
	private static ImageDAO lmgDAO;

	private ImageDAO() {
	}// DetailService

	public static ImageDAO getInstance() {
		if (lmgDAO == null) {
			lmgDAO = new ImageDAO();
		} // end if
		return lmgDAO;
	}// getInstance
		// --------------------------싱글톤 패턴----

	/**
	 * 영화 코드를 입력 받아서 해당되는 모든 이미지를 DTOList로 리턴한다.
	 * 
	 * @param code : 영화코드
	 * @return
	 * @throws SQLException
	 */
	public List<ImageDTO> selectImageList(String code) throws SQLException {
		List<ImageDTO> list = new ArrayList<ImageDTO>();

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
			StringBuilder selectImage = new StringBuilder();
			//@formatter:off
					selectImage
							.append(" select ")
							.append(" img_code, img_path, movie_code ")
							.append(" from movie_image ")
							.append(" where movie_code=? ");
					//@formatter:on

			pstmt = con.prepareStatement(selectImage.toString());
			// 5.바인드 변수 값 설정
			pstmt.setString(1, code);

			// 6.쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			ImageDTO idto = null;
			while (rs.next()) {
				idto = new ImageDTO();
				idto.setImg_code(rs.getString("img_code"));
				idto.setImg_path(rs.getString("img_path"));
				idto.setMovie_code(rs.getString("movie_code"));
				list.add(idto);
			} // end while

		} finally {
			// 7.연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		} // end finally

		return list;
	}// selectImageList

	
	
	
	///////////////관리자 부분 추가함/////////////////
	
	
	// 관리자 : 영화 등록 시 이미지 추가를 해야하므로 메소드 추가. 
	//이미지 저장 메호드
	public int insertImage(ImageDTO iDTO) throws SQLException {
        int cnt = 0;
        DbConn db = DbConn.getInstance("jdbc/dbcp");
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = db.getConn();
            StringBuilder sql = new StringBuilder();
            
            // 보내주신 SQL 파일에 있는 시퀀스 이름(seq_movie_image) 사용
            sql.append(" INSERT INTO movie_image(img_code, img_path, movie_code) ")
               .append(" VALUES (seq_movie_image.nextval, ?, ?) "); 

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, iDTO.getImg_path());
            pstmt.setString(2, iDTO.getMovie_code());

            cnt = pstmt.executeUpdate();
        } finally {
            db.dbClose(null, pstmt, con);
        }
        return cnt;
    }//insertImage
	
	//이미지 삭제 메소드
	public int deleteImage(String movieCode) throws SQLException {
        int cnt = 0;
        DbConn db = DbConn.getInstance("jdbc/dbcp");
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = db.getConn();
            String sql = "DELETE FROM movie_image WHERE movie_code=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, movieCode);
            cnt = pstmt.executeUpdate();
        } finally {
            db.dbClose(null, pstmt, con);
        }
        return cnt;
    }//deleteImage
	
}// class
