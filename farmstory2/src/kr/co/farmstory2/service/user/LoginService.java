package kr.co.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.vo.UserVO;
import kr.co.farmstory2.controller.CommonService;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			UserDAO dao = UserDAO.getInstance();
			UserVO uv= dao.selectUser(uid, pass);
			
			if(uv != null) {
				// 회원이 맞으면
				HttpSession session = req.getSession();
				session.setAttribute("user", uv);
				
				return "redirect:/farmstory2/index.do";
			}else {
				// 회원이 아니면
				return "redirect:/farmstory2/user/login.do";
			}
			
		}else {			
			
			return "/user/login.jsp";	
		}
		
	}

}