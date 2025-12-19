package movie.image;

import java.sql.SQLException;
import java.util.List;

public class ImageService {
	//------싱글톤 패턴------------------------
	private static ImageService is;
	
	private ImageService() {
	}//DetailService
	
	public static ImageService getInstance() {
		if(is == null) {
			is = new ImageService();
		}//end if 
		return is;
	}//getInstance
	//--------------------------싱글톤 패턴----
	
	public List<ImageDTO> searchImageList(String code) {
		List<ImageDTO> list = null;
		ImageDAO iDAO = ImageDAO.getInstance();
		try {
			list = iDAO.selectImageList(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//searchMovieDetail
	
	
	
	//-----------관리자 파트 추가--------------
	//이미지 등록
	public void addImage(ImageDTO iDTO) {
        ImageDAO iDAO = ImageDAO.getInstance();
        try {
            iDAO.insertImage(iDTO);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }//addImage
	
	//이미지 삭제
	public void removeImage(String movieCode) {
        ImageDAO iDAO = ImageDAO.getInstance();
        try {
            iDAO.deleteImage(movieCode);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }//removeImage
	
}//class
