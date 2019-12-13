package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.vo.MemberVO;

public class MemberDAO {
	private static	MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {}
	
	public void insertMember (MemberVO mvo) throws Exception {
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_MEMBER);
		psmt.setString(1, mvo.getUser_id());
		psmt.setString(2, mvo.getUser_pass());
		psmt.setString(3, mvo.getUser_name());
		psmt.setString(4, mvo.getUser_email());
		psmt.setString(5, mvo.getUser_tel());
		psmt.setString(6, mvo.getUser_hp());
		psmt.setString(7, mvo.getUser_addr_type());
		psmt.setString(8, mvo.getUser_zip());
		psmt.setString(9, mvo.getUser_addr_main());
		psmt.setString(10, mvo.getUser_addr_detail());
		psmt.setString(11, mvo.getUser_regip());
		
		psmt.executeUpdate();
	}
	
	public void selectMember() throws Exception {}
	public void updateMember() throws Exception {}
	public void deleteMember() throws Exception {}
}
