package seat.booking;

public class SeatBookService {
	private static SeatBookService sbs;

	private SeatBookService() {

	}
	
	public static SeatBookService getInstance() {
		if (sbs == null) {
			sbs = new SeatBookService();
		} // end if
		return sbs;
	}// getInstance
}//class
