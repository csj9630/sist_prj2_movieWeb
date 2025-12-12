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
	
	public int totalBoxoffice() {
		int cnt=0;
		MovieDAO mDAO=MovieDAO.getInstance();
		
		try {
			cnt=mDAO.countBoxoffice();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}//totalBoxoffice
	
	public int totalUpcomming() {
		int cnt=0;
		MovieDAO mDAO=MovieDAO.getInstance();
		
		try {
			cnt=mDAO.countUpcomming();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}//totalUpcomming
	
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
}
