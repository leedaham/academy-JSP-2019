package kr.co.jcinema.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MemberDAO;
import kr.co.jcinema.vo.MemberVO;

public class LoginService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if (req.getMethod().equals("POST")) {
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			MemberDAO dao = MemberDAO.getInstance();
			MemberVO mvo = dao.selectMember(uid, pass);
			
			// 회원 여부를 확인해서 세션처리
			if(mvo != null) {
				// 회원일 경우
				HttpSession session = req.getSession();
				session.setAttribute("member", mvo);
				
				return "redirect:/jcinema";
			}else {
				// 회원이 아닐 경우
				return "redirect:/jcinema/member/login?success=fail";
			}
			
		} else {
			
			return "/member/login.jsp";
		}
		
	}
}
