package movie.admin;

import java.sql.SQLException;
import java.util.List;

import movie.screening_admin.ScreeningDAO;
import movie.screening_admin.ScreeningDTO;

public class AdminScreeningService {
	private static AdminScreeningService service;
	
	private AdminScreeningService() {}
	
	public static AdminScreeningService getInstance() {
		if(service == null) service = new AdminScreeningService();
		return service;
	}
	
	private ScreeningDAO sDAO = ScreeningDAO.getInstance();
	
	// 1. 리스트 조회 (페이지 번호를 받아서 start/end 계산까지 처리)
	public List<ScreeningDTO> getScreeningList(int page, int pageSize, String field, String query) {
		List<ScreeningDTO> list = null;
		try {
			int startNum = (page - 1) * pageSize + 1;
			int endNum = startNum + pageSize - 1;
			list = sDAO.selectScreeningList(startNum, endNum, field, query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 2. 총 개수 조회
	public int getTotalCount(String field, String query) {
		int count = 0;
		try {
			count = sDAO.selectTotalCount(field, query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	// 3. 상세 조회 (수정 폼용)
	public ScreeningDTO getScreeningDetail(String screenCode) {
		ScreeningDTO dto = null;
		try {
			dto = sDAO.selectScreeningDetail(screenCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	// 4. 스케줄 등록
	// 리턴값: 1=성공, -1=중복(실패), 0=기타에러
	public int addScreening(ScreeningDTO dto) {
		int result = 0;
		try {
			result = sDAO.insertScreening(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 5. 스케줄 수정
	// 리턴값: 1=성공, -2=예매존재(수정불가), 0=실패
	public int modifyScreening(ScreeningDTO dto) {
		int result = 0;
		try {
			// 예매 내역 체크
			boolean hasBooking = sDAO.checkBookingExist(dto.getScreenCode());
			if(hasBooking) {
				return -2; // 예매가 있어서 수정 불가 코드 리턴
			}
			result = sDAO.updateScreening(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 6. 스케줄 삭제
	// 리턴값: 1=성공, -2=예매존재(삭제불가), 0=실패
	public int removeScreening(String screenCode) {
		int result = 0;
		try {
			// 예매 내역 체크
			boolean hasBooking = sDAO.checkBookingExist(screenCode);
			if(hasBooking) {
				return -2;
			}
			result = sDAO.deleteScreening(screenCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}