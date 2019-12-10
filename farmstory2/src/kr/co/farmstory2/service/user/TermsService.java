package kr.co.farmstory2.service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.BoardDAO;
import kr.co.farmstory2.vo.BoardTermsVO;

public class TermsService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardTermsVO> terms = dao.terms();
		
		req.setAttribute("terms", terms);
		
		return "/user/terms.jsp";
	}

}
