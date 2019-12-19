package kr.co.jcinema.config;

public class SQL_ADMIN {
	
	
	// 包府磊 其捞瘤
	// 包府磊 API
	public static final String SELECT_THEATER = "SELECT `theater_no`, `theater_local_code`, `theater_name` FROM `JC_THEATER` WHERE `theater_city`=?";
	public static final String SELECT_SCREEN = "SELECT * FROM `JC_SCREEN` WHERE `screen_theater_no`=?";
	public static final String SELECT_MOVIE = "SELECT * FROM `JC_MOVIE` WHERE `movie_title`LIKE ?";
	
	// 券版汲沥
	// 雀盔包府
	// 康拳包府
	public static final String INSERT_MOVIE_SCHEDULE = "INSERT INTO `JC_SCHEDULE` SET "
													 + "schedule_theater_no=?,"
													 + "schedule_screen_no=?,"
													 + "schedule_movie_no=?,"
													 + "schedule_date=?,"
													 + "schedule_start_time=?,"
													 + "schedule_end_time=?,"
													 + "schedule_round_view=?";
	
	
	
	
	// 搬力包府
	// 萍南包府
	// 康拳包包府
	// 霸矫魄包府
}
