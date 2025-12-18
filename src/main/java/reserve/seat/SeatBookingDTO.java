package reserve.seat;

import java.sql.Date;

public class SeatBookingDTO {
	
	private String seatCode;
    private String seatRow;
    private String seatCol;
    private String screenCode;
    private String bookNum;
    private String bookState;
    private Date bookTime;
    
    // 예약 가능 여부 판단
    public boolean isAvailable() {
        return bookNum == null || bookState == null;
    }
    
    // 예약중인지 확인
    public boolean isReserving() {
        return "예약중".equals(bookState);
    }
    
    // 예약완료인지 확인
    public boolean isBooked() {
        return "예약완료".equals(bookState);
    }
    
	
	public String getSeatCode() {
		return seatCode;
	}
	public void setSeatCode(String seatCode) {
		this.seatCode = seatCode;
	}
	public String getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}
	public String getSeatCol() {
		return seatCol;
	}
	public void setSeatCol(String seatCol) {
		this.seatCol = seatCol;
	}
	public String getScreenCode() {
		return screenCode;
	}
	public void setScreenCode(String screenCode) {
		this.screenCode = screenCode;
	}
	public String getBookNum() {
		return bookNum;
	}
	public void setBookNum(String bookNum) {
		this.bookNum = bookNum;
	}
	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	public Date getBookTime() {
		return bookTime;
	}
	public void setBookTime(Date bookTime) {
		this.bookTime = bookTime;
	}

	public SeatBookingDTO(String seatCode, String seatRow, String seatCol, String screenCode, String bookNum,
			String bookState, Date bookTime) {
		super();
		this.seatCode = seatCode;
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.screenCode = screenCode;
		this.bookNum = bookNum;
		this.bookState = bookState;
		this.bookTime = bookTime;
	}
	public SeatBookingDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
	

}
