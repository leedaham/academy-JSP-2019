package kr.co.board2.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;

public class CheckHpService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String hp = req.getParameter("hp");
		
		// 1,2�ܰ�
		Connection conn = DBConfig.getConnection();
		
		// 3�ܰ�
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_CHECK_HP);
		psmt.setString(1, hp);
		
		// 4�ܰ�
		ResultSet rs = psmt.executeQuery();
		
		// 5�ܰ�
		JSONObject json = new JSONObject();
		if(rs.next()){
			json.put("result", rs.getInt(1));
		}

		// 6�ܰ�
		rs.close();
		psmt.close();
		conn.close();
		
		
		return json.toJSONString();
	}

}
