package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.SQL;
import kr.co.farmstory2.vo.UserVO;

public class UserDAO {
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	private UserDAO() {}

	// 로그인
	public UserVO selectUser(String uid, String pw) throws Exception{
		// 1, 2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LOGIN);
		psmt.setString(1, uid);
		psmt.setString(2, pw);
		
		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		String redirect = null;
		UserVO uv = null;
		// 5단계
		if(rs.next()){
					
			// 회원이 있으면 (비밀번호에 해당하는 회원이 있으면)
			uv = new UserVO();
			uv.setUid(rs.getString(1));
			uv.setPass(rs.getString(2));
			uv.setName(rs.getString(3));
			uv.setNick(rs.getString(4));
			uv.setEmail(rs.getString(5));
			uv.setHp(rs.getString(6));
			uv.setGrade(rs.getInt(7));
			uv.setZip(rs.getString(8));
			uv.setAddr1(rs.getString(9));
			uv.setAddr2(rs.getString(10));
			uv.setRegip(rs.getString(11));
			uv.setRdate(rs.getString(12));
		}
			
		
		// 6단계
		rs.close();
		psmt.close();
		conn.close();
		
		return uv;
	}


	public void insertUser( UserVO uv ) throws Exception {
		// 1, 2
		Connection conn = DBConfig.getConnection();
		
		// 3
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_USER);
		psmt.setString(1, uv.getUid());
		psmt.setString(2, uv.getPass());
		psmt.setString(3, uv.getName());
		psmt.setString(4, uv.getNick());
		psmt.setString(5, uv.getEmail());
		psmt.setString(6, uv.getHp());
		psmt.setString(7, uv.getZip());
		psmt.setString(8, uv.getAddr1());
		psmt.setString(9, uv.getAddr2());
		psmt.setString(10, uv.getRegip());
		
		// 4
		psmt.executeUpdate();
		
		// 5
		
		// 6
		psmt.close();
		conn.close();
					
	}
	
	public void selectTerms() throws Exception {}
	
	public void checkUid() throws Exception {}
	
	public void checkNick() throws Exception {}
	
	public void checkHp() throws Exception {}
	
	public void checkEmail() throws Exception {}
}
