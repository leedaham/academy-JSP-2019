package kr.co.jcinema.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jcinema.admin.vo.TicketVO;
import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.config.SQL_ADMIN;

public class AdminTicketDAO {

	private static	AdminTicketDAO instance = new AdminTicketDAO();
	
	public static AdminTicketDAO getInstance() {
		return instance;
	}
	
	private AdminTicketDAO() {}

	public void selectTickets() throws Exception {}
	public void selectTicket() throws Exception {}
	
	public void insertTicket(TicketVO tvo) throws Exception {
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL_ADMIN.INSERT_TICKET);
		psmt.setString(1, tvo.getTicket_no());
		psmt.setString(2, tvo.getTicket_movie_no());
		psmt.setString(3, tvo.getTicket_movie_date());
		psmt.setString(4, tvo.getTicket_round_view());
		psmt.setString(5, tvo.getTicket_theater_no());
		psmt.setString(6, tvo.getTicket_screen_no());
		psmt.setString(7, tvo.getTicket_seat());
		psmt.setString(8, tvo.getTicket_price());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}
	
	public void updateTicket() throws Exception {}
	public void deleteTicket() throws Exception {}
	
}
