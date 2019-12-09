package kr.co.board2.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.UserDAO;
import kr.co.board2.vo.BoardMemberVO;

public class LoginService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		if(req.getMethod().equals("POST")) {
			String uid	= req.getParameter("uid");	
			String pw	= req.getParameter("pass");	
			
			UserDAO dao = UserDAO.getInstance();
			BoardMemberVO bmv = dao.selectUser(uid, pw);
			
			if(bmv != null) {
				// ���̵�, ����� �ش��ϴ� ȸ���� ���� ���
				// ���� ó��
				HttpSession session = req.getSession();
				session.setAttribute("member", bmv);
				
				// ����Ʈ�� �̵�
				return "redirect:/Board2/list.do";
			}else {
				// ���̵�, ����� �ش��ϴ� ȸ���� ���� ���
				return "redirect:/Board2/user/login.do";
			}
			
			
		}else {
			return "/user/login.jsp";
		}
	}
}
