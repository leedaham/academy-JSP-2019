package kr.co.jcinema.config;

public class SQL_ADMIN {
	
	
	// ������ ������
	// ������ API
	public static final String SELECT_THEATER = "SELECT `theater_no`, `theater_local_code`, `theater_name` FROM `JC_THEATER` WHERE `theater_city`=?";
	public static final String SELECT_SCREEN = "SELECT * FROM `JC_SCREEN` WHERE `screen_theater_no`=?";
	public static final String SELECT_MOVIES = "SELECT * FROM `JC_MOVIE` WHERE `movie_title`LIKE ?";
	
	public static final String SELECT_MOVIE_SCHEDULE = "SELECT a.*, b.movie_title FROM JC_MOVIE_SCHEDULE AS a "
													 + "JOIN JC_MOVIE AS b ON a.schedule_movie_no = b.movie_no "
													 + "WHERE a.schedule_theater_no=? "
													 + "AND a.schedule_screen_no=? "
													 + "AND a.schedule_date=? "
													 + "AND a.schedule_round_view=?";
	

	
	// ȯ�漳��
	// ȸ������
	// ��ȭ����
	public static final String INSERT_MOVIE_SCHEDULE = "INSERT INTO `JC_MOVIE_SCHEDULE` SET "
													 + "schedule_theater_no=?,"
													 + "schedule_screen_no=?,"
													 + "schedule_movie_no=?,"
													 + "schedule_date=?,"
													 + "schedule_start_time=?,"
													 + "schedule_end_time=?,"
													 + "schedule_round_view=?";
	
	
	
	
	// ��������
	// Ƽ�ϰ���
	// ��ȭ������
	// �Խ��ǰ���
}
