package kr.co.jcinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		psmt.setInt	  (7, mvo.getUser_grade());
		psmt.setString(8, mvo.getUser_addr_type());
		psmt.setString(9, mvo.getUser_zip());
		psmt.setString(10, mvo.getUser_addr_main());
		psmt.setString(11, mvo.getUser_addr_detail());
		psmt.setString(12, mvo.getUser_regip());
		
		psmt.executeUpdate();
	}
	
	public MemberVO selectMember(String uid, String pass) throws Exception {
		// 1, 2�ܰ�
		Connection conn = DBConfig.getConnection();
		
		// 3�ܰ�
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LOGIN);
		psmt.setString(1, uid);
		psmt.setString(2, pass);
		
		// 4�ܰ�
		ResultSet rs = psmt.executeQuery();
		
		MemberVO mvo = null;
		
		// 5�ܰ�
		if(rs.next()){
					
			// ȸ���� ������ (��й�ȣ�� �ش��ϴ� ȸ���� ������)
			mvo = new MemberVO();
			mvo.setUser_id(rs.getString(1));
			mvo.setUser_pass(rs.getString(2));
			mvo.setUser_name(rs.getString(3));
			mvo.setUser_email(rs.getString(4));
			mvo.setUser_tel(rs.getString(5));
			mvo.setUser_hp(rs.getString(6));
			mvo.setUser_addr_type(rs.getString(7));
			mvo.setUser_zip(rs.getString(8));
			mvo.setUser_addr_main(rs.getString(9));
			mvo.setUser_addr_detail(rs.getString(10));
			mvo.setUser_regip(rs.getString(11));
			mvo.setUser_rdate(rs.getString(12));
		}
			
		
		// 6�ܰ�
		rs.close();
		psmt.close();
		conn.close();
		
		return mvo;
		
	}
	
	public int selectCheckUid(String uid) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_CHECK_UID);
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		
		int result = 0;
		
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return result;
		}
	public void updateMember(MemberVO mvo) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_MEMBER);
		psmt.setString(1, mvo.getUser_pass());
		psmt.setString(2, mvo.getUser_name());
		psmt.setString(3, mvo.getUser_tel());
		psmt.setString(4, mvo.getUser_addr_type());
		psmt.setString(5, mvo.getUser_zip());
		psmt.setString(6, mvo.getUser_addr_main());
		psmt.setString(7, mvo.getUser_addr_detail());
		psmt.setString(8, mvo.getUser_agree_point());
		psmt.setString(9, mvo.getUser_agree_site());
		psmt.setString(10, mvo.getUser_id());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}
	public void deleteMember() throws Exception {}
}
