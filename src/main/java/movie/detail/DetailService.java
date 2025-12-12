package movie.detail;

import java.sql.SQLException;

public class DetailService {
	//------싱글톤 패턴------------------------
	private static DetailService ds;
	
	private DetailService() {
	}//DetailService
	
	public static DetailService getInstance() {
		if(ds == null) {
			ds = new DetailService();
		}//end if 
		return ds;
	}//getInstance
	//--------------------------싱글톤 패턴----
	
	public DetailDTO searchMovieDetail(String code) {
		DetailDTO dtDTO = null;
		
		DetailDAO dtDAO = DetailDAO.getInstance();
		try {
			dtDTO = dtDAO.selectDetail(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dtDTO;
	}//searchMovieDetail
}//class
