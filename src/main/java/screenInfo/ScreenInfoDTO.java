package screenInfo;

import java.util.Date;

import movie.MovieDTO;

public class ScreenInfoDTO {
	
	private String screen_code, screen_date, screen_delete, screen_showing, theather_num, movie_code;		
	private Date screen_open, screen_end;
	private int screen_price;
	private MovieDTO mDTO;
	
	public ScreenInfoDTO() {
		
	} // ScreenInfoDTO

	public ScreenInfoDTO(String screen_code, String screen_date, String screen_delete, String screen_showing,
			String theather_num, String movie_code, Date screen_open, Date screen_end, int screen_price,
			MovieDTO mDTO) {
		this.screen_code = screen_code;
		this.screen_date = screen_date;
		this.screen_delete = screen_delete;
		this.screen_showing = screen_showing;
		this.theather_num = theather_num;
		this.movie_code = movie_code;
		this.screen_open = screen_open;
		this.screen_end = screen_end;
		this.screen_price = screen_price;
		this.mDTO = mDTO;
	}

	public String getScreen_code() {
		return screen_code;
	}

	public String getScreen_date() {
		return screen_date;
	}

	public String getScreen_delete() {
		return screen_delete;
	}

	public String getScreen_showing() {
		return screen_showing;
	}

	public String getTheather_num() {
		return theather_num;
	}

	public String getMovie_code() {
		return movie_code;
	}

	public Date getScreen_open() {
		return screen_open;
	}

	public Date getScreen_end() {
		return screen_end;
	}

	public int getScreen_price() {
		return screen_price;
	}

	public MovieDTO getmDTO() {
		return mDTO;
	}

	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}

	public void setScreen_date(String screen_date) {
		this.screen_date = screen_date;
	}

	public void setScreen_delete(String screen_delete) {
		this.screen_delete = screen_delete;
	}

	public void setScreen_showing(String screen_showing) {
		this.screen_showing = screen_showing;
	}

	public void setTheather_num(String theather_num) {
		this.theather_num = theather_num;
	}

	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}

	public void setScreen_open(Date screen_open) {
		this.screen_open = screen_open;
	}

	public void setScreen_end(Date screen_end) {
		this.screen_end = screen_end;
	}

	public void setScreen_price(int screen_price) {
		this.screen_price = screen_price;
	}

	public void setmDTO(MovieDTO mDTO) {
		this.mDTO = mDTO;
	}

	@Override
	public String toString() {
		return "ScreenInfoDTO [screen_code=" + screen_code + ", screen_date=" + screen_date + ", screen_delete="
				+ screen_delete + ", screen_showing=" + screen_showing + ", theather_num=" + theather_num
				+ ", movie_code=" + movie_code + ", screen_open=" + screen_open + ", screen_end=" + screen_end
				+ ", screen_price=" + screen_price + ", mDTO=" + mDTO + "]";
	}

}
