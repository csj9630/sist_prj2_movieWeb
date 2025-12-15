package movie;

import java.sql.SQLException;
import java.util.List;

public class MovieService {
	private static MovieService ms;
	
	private MovieService() {
		
	}
	
	public static MovieService getInstance() {
		if(ms==null) {
			ms=new MovieService();
		}//end if
		
		return ms;
	}//getInstance
	
	// 박스오피스 영화 개수
	public int totalBoxOffice() {
		int cnt=0;
		MovieDAO mDAO=MovieDAO.getInstance();
		
		try {
			cnt=mDAO.countBoxoffice();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// 상영예정작 영화 개수
	public int totalUpComming() {
		int cnt=0;
		MovieDAO mDAO=MovieDAO.getInstance();
		
		try {
			cnt=mDAO.countUpcomming();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public List<MovieDTO> showAllMovie() {
		List<MovieDTO> allMovieList=null;
		MovieDAO mDAO=MovieDAO.getInstance();
		
		try {
			allMovieList=mDAO.selectAllMovie();
		} catch(SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return allMovieList;
	}//showAllMovie
	
	//페이지 네이션된 박스오피스 리스트 출력
	public List<MovieDTO> showPageMovie(int currentPage, int size) {
		List<MovieDTO> pageMovieList=null;
		MovieDAO mDAO=MovieDAO.getInstance();
		
		try {
			pageMovieList=mDAO.selectMoviePage(currentPage, size);
		} catch(SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return pageMovieList;
	}//showPageMovie
	
	//페이지 네이션된 상영예정작 리스트 출력
	public List<MovieDTO> showUpCommingMovie(int currentPage, int size) {
		List<MovieDTO> pageMovieList=null;
		MovieDAO mDAO=MovieDAO.getInstance();
		
		try {
			pageMovieList=mDAO.selectUpcommingMoviePage(currentPage, size);
		} catch(SQLException se) {
			se.printStackTrace();
		}//end catch
		
		return pageMovieList;
	}//showPageMovie
}
