package kr.co.jcinema.service.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.co.jcinema.config.DBConfig;
import kr.co.jcinema.config.SQL;
import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MemberDAO;
import kr.co.jcinema.vo.MemberVO;

public class RegisterService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			// POST 요청

			MemberVO mvo = new MemberVO();
			mvo.setUser_id(req.getParameter("uid"));
			mvo.setUser_pass(req.getParameter("pw1"));
			mvo.setUser_name(req.getParameter("name"));
			mvo.setUser_email(req.getParameter("email"));
			mvo.setUser_tel(req.getParameter("tel"));
			mvo.setUser_hp(req.getParameter("hp"));
			mvo.setUser_addr_type(req.getParameter("addrType"));
			mvo.setUser_zip(req.getParameter("zip"));
			mvo.setUser_addr_main(req.getParameter("addr1"));
			mvo.setUser_addr_detail(req.getParameter("addr2"));
			mvo.setUser_regip(req.getRemoteAddr());
			
			MemberDAO dao = MemberDAO.getInstance();
			dao.insertMember(mvo);
			
			JSONObject json = new JSONObject();
			json.put("result", 1);
			
			return json.toString();
		}else {
			// GET 요청
			return "/member/register.jsp";	
			
		}
		
		
		
		
	}

}
