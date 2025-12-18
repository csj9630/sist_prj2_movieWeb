package reserve.seat;

import movie.booking.ScheduleService;

public class SeatBookingService {
	private static ScheduleService sbs;
	
	private SeatBookingService() {
		
	} // ScreenInfoService
	
	public static ScheduleService getInstance() {
		if(sis == null) {
			sis = new SeatBookingService();
		} // end if
		return sis;
	} // getInstance
}
