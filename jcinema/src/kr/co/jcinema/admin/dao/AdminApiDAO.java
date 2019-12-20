package kr.co.jcinema.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jcinema.admin.vo.MovieScheduleVO;
import kr.co.jcinema.admin.vo.ScreenVO;
import kr.co.jcinema.admin.vo.TheaterVO;
import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.config.SQL_ADMIN;
import kr.co.jcinema.vo.MovieVO;

public class AdminApiDAO {

	private static	AdminApiDAO instance = new AdminApiDAO();
	
	public static AdminApiDAO getInstance() {
		return instance;
	}
	
	private AdminApiDAO() {}
	
	public List<TheaterVO> selectTheater(String city) throws Exception {
		Connection conn = DBConfig.getConnection();
		
		
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_THEATER);
		psmt.setString(1, city);
		
		ResultSet rs =  psmt.executeQuery();
		List<TheaterVO> theaters = new ArrayList<>();
		while(rs.next()) {
			TheaterVO tvo = new TheaterVO();
			
			tvo.setTheater_no(rs.getInt(1));
			tvo.setTheater_local_code(rs.getInt(2));
			tvo.setTheater_name(rs.getString(3));
			
			theaters.add(tvo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return theaters;
	}

	public List<ScreenVO> selectScreen(String theater_no) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_SCREEN);
		
		psmt.setString(1, theater_no);
		
		ResultSet rs =  psmt.executeQuery();
		
		List<ScreenVO> screens = new ArrayList<>();
		
		while(rs.next()) {
			ScreenVO svo = new ScreenVO();
			
			svo.setScreen_no(rs.getInt(1));
			svo.setScreen_name(rs.getString(2));
			svo.setScreen_total_seat(rs.getInt(3));
			svo.setScreen_theater_no(rs.getInt(4));
			
			screens.add(svo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return screens;
	}
	
	public List<MovieVO> selectMovies(String title) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_MOVIES);
		
		psmt.setString(1, "%"+title+"%");
		
		ResultSet rs =  psmt.executeQuery();
		
		List<MovieVO> movies = new ArrayList<>();
		
		while(rs.next()) {
			MovieVO mvo = new MovieVO();
			
			mvo.setMovie_no(rs.getInt(1));
			mvo.setMovie_title(rs.getString(2));
			mvo.setMovie_grade(rs.getString(3));
			mvo.setMovie_company(rs.getString(4));
			mvo.setMovie_score(rs.getDouble(5));
			mvo.setMovie_release_date(rs.getString(6));
			mvo.setMovie_genre(rs.getString(7));
			mvo.setMovie_country(rs.getString(8));
			mvo.setMovie_running_time(rs.getInt(9));
			mvo.setMovie_homepage(rs.getString(10));
			mvo.setMovie_poster(rs.getString(11));
			mvo.setMovie_desc(rs.getString(12));
			mvo.setMovie_director(rs.getString(13));
			mvo.setMovie_actor(rs.getString(14));
			
			movies.add(mvo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return movies;
	}

	public MovieScheduleVO selectMovie(String theater_no, String screen_no, String schedule_date, String round_view) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.SELECT_MOVIE_SCHEDULE);
		psmt.setString(1, theater_no);
		psmt.setString(2, screen_no);
		psmt.setString(3, schedule_date);
		psmt.setString(4, round_view);
		
		ResultSet rs = psmt.executeQuery();
		
		MovieScheduleVO msv = null;
		
		if(rs.next()) {
			
			msv = new MovieScheduleVO();
			
			msv.setSchedule_theater_no(rs.getString(1));
			msv.setSchedule_screen_no(rs.getString(2));
			msv.setSchedule_movie_no(rs.getString(3));
			msv.setSchedule_date(rs.getString(4));
			msv.setSchedule_start_time(rs.getString(5));
			msv.setSchedule_end_time(rs.getString(6));
			msv.setSchedule_round_view(rs.getString(7));
			msv.setMovie_title(rs.getString(8));
		}
		
		
		return msv;
	}
}
