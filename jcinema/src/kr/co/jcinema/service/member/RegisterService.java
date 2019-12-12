package kr.co.jcinema.service.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.controller.CommonService;

public class RegisterService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			// POST 요청

			
			
			
			
			
			JSONObject json = new JSONObject();
			json.put("result", 1);
			return json.toString();
		}else {
			// GET 요청
			return "/member/register.jsp";
			
		}
		
		
		
		
	}

}
