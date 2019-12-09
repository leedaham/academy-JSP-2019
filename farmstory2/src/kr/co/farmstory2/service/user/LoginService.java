package kr.co.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.vo.BoardMemberVO;
import kr.co.farmstory2.controller.CommonService;

public class LoginService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("POST")) {
			String uid	= req.getParameter("uid");	
			String pw	= req.getParameter("pass");	
			
			UserDAO dao = UserDAO.getInstance();
			BoardMemberVO bmv = dao.selectUser(uid, pw);
			
			if(bmv != null) {
				// 아이디, 비번에 해당하는 회원이 있을 경우
				// 세션 처리
				HttpSession session = req.getSession();
				session.setAttribute("member", bmv);
				
				// 리스트로 이동
				return "redirect:/farmstory2/index.do";
			}else {
				// 아이디, 비번에 해당하는 회원이 없을 경우
				return "redirect:/farmstory2/user/login.do";
			}
		}else {
			return "/user/login.jsp";
		}
	}

}
