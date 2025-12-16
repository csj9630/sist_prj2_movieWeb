package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DbConn;

public class MovieDAO {
	private static MovieDAO mDAO;
	
	private MovieDAO() {
		
	}
	
	public static MovieDAO getInstance() {
		if(mDAO==null) {
			mDAO=new MovieDAO();
		}//end if
		
		return mDAO;
	}//getInstance
	
	//박스오피스 영화 수를 계산
	public int countBoxoffice() throws SQLException {
		int cnt=0;
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dbCon.getConn();
			String countAll="select count(*) cnt from movie";
			pstmt=con.prepareStatement(countAll);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return cnt;
	}//countAllMovie
	
	//상영예정작 영화 수를 계산
	public int countUpcomming() throws SQLException {
		int cnt=0;
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dbCon.getConn();
			String countAll="select count(*) cnt from movie where release_date > sysdate";
			pstmt=con.prepareStatement(countAll);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return cnt;
	}//countAllMovie
	
	//전체 영화 리스트(페이지 네이션 없는)
	public List<MovieDTO> selectAllMovie() throws SQLException {
		List<MovieDTO> allMovieList=new ArrayList<MovieDTO>();
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dbCon.getConn();
			StringBuilder selectAll=new StringBuilder();
			selectAll
			.append("	select movie_code, main_image, REGEXP_SUBSTR(movie_grade, '^(전체|12|15|청소년)') AS movie_grade, movie_name, release_date 	")
			.append("	from movie	");
			
			pstmt=con.prepareStatement(selectAll.toString());
			
			rs=pstmt.executeQuery();
			MovieDTO mDTO=null;
			
			while(rs.next()) {
				mDTO=new MovieDTO();
				mDTO.setMoviecode(rs.getString("movie_code"));
				mDTO.setMoviemainimg(rs.getString("main_image"));
				mDTO.setMoviegrade(rs.getString("movie_grade"));
				mDTO.setMoviename(rs.getString("movie_name"));
				mDTO.setMoviereleasedate(rs.getString("release_date"));
				
				allMovieList.add(mDTO);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return allMovieList;
	}//selectAllMovie
	
	//전체 이용가 영화 리스트
	public List<MovieDTO> selectAgeAllMovie() throws SQLException {
		List<MovieDTO> ageAllMovieList=new ArrayList<MovieDTO>();
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dbCon.getConn();
			StringBuilder selectAll=new StringBuilder();
			selectAll
			.append("	select movie_code, main_image, REGEXP_SUBSTR(movie_grade, '^(전체|12|15|청소년)') AS movie_grade, movie_name, release_date 	")
			.append("	from movie	")
			.append("	where movie_grade='전체 이용가'	");
			
			pstmt=con.prepareStatement(selectAll.toString());
			
			rs=pstmt.executeQuery();
			MovieDTO mDTO=null;
			
			while(rs.next()) {
				mDTO=new MovieDTO();
				mDTO.setMoviecode(rs.getString("movie_code"));
				mDTO.setMoviemainimg(rs.getString("main_image"));
				mDTO.setMoviegrade(rs.getString("movie_grade"));
				mDTO.setMoviename(rs.getString("movie_name"));
				mDTO.setMoviereleasedate(rs.getString("release_date"));
				
				ageAllMovieList.add(mDTO);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return ageAllMovieList;
	}//selectAgeAllMovie
	
	//12세 이용가 영화 리스트
	public List<MovieDTO> selectAgeTwelveMovie() throws SQLException {
		List<MovieDTO> ageTwelveList=new ArrayList<MovieDTO>();
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dbCon.getConn();
			StringBuilder selectAll=new StringBuilder();
			selectAll
			.append("	select movie_code, main_image, REGEXP_SUBSTR(movie_grade, '^(전체|12|15|청소년)') AS movie_grade, movie_name, release_date 	")
			.append("	from movie	")
			.append("	where movie_grade='12세 이용가'	");
			
			pstmt=con.prepareStatement(selectAll.toString());
			
			rs=pstmt.executeQuery();
			MovieDTO mDTO=null;
			
			while(rs.next()) {
				mDTO=new MovieDTO();
				mDTO.setMoviecode(rs.getString("movie_code"));
				mDTO.setMoviemainimg(rs.getString("main_image"));
				mDTO.setMoviegrade(rs.getString("movie_grade"));
				mDTO.setMoviename(rs.getString("movie_name"));
				mDTO.setMoviereleasedate(rs.getString("release_date"));
				
				ageTwelveList.add(mDTO);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return ageTwelveList;
	}//selectAgeTwelveMovie
	
	//15세 이용가 영화 리스트
	public List<MovieDTO> selectAgeFifteenMovie() throws SQLException {
		List<MovieDTO> ageFiftenList=new ArrayList<MovieDTO>();
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dbCon.getConn();
			StringBuilder selectAll=new StringBuilder();
			selectAll
			.append("	select movie_code, main_image, REGEXP_SUBSTR(movie_grade, '^(전체|12|15|청소년)') AS movie_grade, movie_name, release_date 	")
			.append("	from movie	")
			.append("	where movie_grade='15세 이용가'	");
			
			pstmt=con.prepareStatement(selectAll.toString());
			
			rs=pstmt.executeQuery();
			MovieDTO mDTO=null;
			
			while(rs.next()) {
				mDTO=new MovieDTO();
				mDTO.setMoviecode(rs.getString("movie_code"));
				mDTO.setMoviemainimg(rs.getString("main_image"));
				mDTO.setMoviegrade(rs.getString("movie_grade"));
				mDTO.setMoviename(rs.getString("movie_name"));
				mDTO.setMoviereleasedate(rs.getString("release_date"));
				
				ageFiftenList.add(mDTO);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return ageFiftenList;
	}//selectAgeTwelveMovie
	
	//19세 이용가 영화 리스트
	public List<MovieDTO> selectAgeNineteenMovie() throws SQLException {
		List<MovieDTO> ageNineteenList=new ArrayList<MovieDTO>();
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dbCon.getConn();
			StringBuilder selectAll=new StringBuilder();
			selectAll
			.append("	select movie_code, main_image, REGEXP_SUBSTR(movie_grade, '^(전체|12|15|청소년)') AS movie_grade, movie_name, release_date 	")
			.append("	from movie	")
			.append("	where movie_grade='청소년 관람불가'	");
			
			pstmt=con.prepareStatement(selectAll.toString());
			
			rs=pstmt.executeQuery();
			MovieDTO mDTO=null;
			
			while(rs.next()) {
				mDTO=new MovieDTO();
				mDTO.setMoviecode(rs.getString("movie_code"));
				mDTO.setMoviemainimg(rs.getString("main_image"));
				mDTO.setMoviegrade(rs.getString("movie_grade"));
				mDTO.setMoviename(rs.getString("movie_name"));
				mDTO.setMoviereleasedate(rs.getString("release_date"));
				
				ageNineteenList.add(mDTO);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return ageNineteenList;
	}//selectAgeTwelveMovie

	//전체 영화 리스트(페이지 네이션)
	public List<MovieDTO> selectMoviePage(int currentPage, int size) throws SQLException {
		List<MovieDTO> pageMovieList=new ArrayList<MovieDTO>();
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int offset=(currentPage-1) * size;
		
		try {
			con=dbCon.getConn();
			StringBuilder selectPage=new StringBuilder();
			selectPage
			.append("	select movie_code, main_image, movie_grade, movie_name, release_date	")
			.append("	from movie	")
			.append("	order by movie_code desc	")
			.append("	OFFSET ? ROWS FETCH NEXT ? ROWS ONLY	");
			
			pstmt=con.prepareStatement(selectPage.toString());
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs=pstmt.executeQuery();
			MovieDTO mDTO=null;
			
			while(rs.next()) {
				mDTO=new MovieDTO();
				mDTO.setMoviecode(rs.getString("movie_code"));
				mDTO.setMoviemainimg(rs.getString("main_image"));
				mDTO.setMoviegrade(rs.getString("movie_grade"));
				mDTO.setMoviename(rs.getString("movie_name"));
				mDTO.setMoviereleasedate(rs.getString("release_date"));
				
				pageMovieList.add(mDTO);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return pageMovieList;
	}//selectMoviePage
	
	//상영 예정작 영화 리스트
	public List<MovieDTO> selectUpcommingMoviePage(int currentPage, int size) throws SQLException {
		List<MovieDTO> pageMovieList=new ArrayList<MovieDTO>();
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int offset=(currentPage-1) * size;
		
		try {
			con=dbCon.getConn();
			StringBuilder selectPage=new StringBuilder();
			selectPage
			.append("	select movie_code, main_image, movie_grade, movie_name, release_date	")
			.append("	from movie	")
			.append("	where release_date > sysdate	")
			.append("	order by movie_code desc	")
			.append("	OFFSET ? ROWS FETCH NEXT ? ROWS ONLY	");
			
			pstmt=con.prepareStatement(selectPage.toString());
			pstmt.setInt(1, offset);
			pstmt.setInt(2, size);
			
			rs=pstmt.executeQuery();
			MovieDTO mDTO=null;
			
			while(rs.next()) {
				mDTO=new MovieDTO();
				mDTO.setMoviecode(rs.getString("movie_code"));
				mDTO.setMoviemainimg(rs.getString("main_image"));
				mDTO.setMoviegrade(rs.getString("movie_grade"));
				mDTO.setMoviename(rs.getString("movie_name"));
				mDTO.setMoviereleasedate(rs.getString("release_date"));
				
				pageMovieList.add(mDTO);
			}
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return pageMovieList;
	}//selectReleaseMoviePage
	
}//class