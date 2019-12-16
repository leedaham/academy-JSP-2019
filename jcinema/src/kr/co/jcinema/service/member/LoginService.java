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
			
			// ȸ�� ���θ� Ȯ���ؼ� ����ó��
			if(mvo != null) {
				// ȸ���� ���
				HttpSession session = req.getSession();
				session.setAttribute("member", mvo);
				
				return "redirect:/jcinema";
			}else {
				// ȸ���� �ƴ� ���
				return "redirect:/jcinema/member/login?success=fail";
			}
			
		} else {
			
			return "/member/login.jsp";
		}
		
	}
}
