package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;

public class WriteService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String title = getCategoryTitle(cate);
		
		
		req.setAttribute("boardGroup", group);
		req.setAttribute("category", cate);
		req.setAttribute("title", title);
		
		return "/board/write.jsp";
	}
	public String getCategoryTitle(String cate) {
		
		String title="";
		
		switch (cate) {
		case "market":title="�庸��"; break;
		case "story":title="���۹��̾߱�"; break;
		case "grow":title="�Թ簡�ٱ�"; break;
		case "school":title="�ͳ��б�"; break;
		case "event":title="�̺�Ʈ"; break;
		case "notice":title="��������"; break;
		case "menu":title="������ �Ĵ�"; break;
		case "chef":title="�����丮��"; break;
		case "qna":title="1:1 ������"; break;
		case "faq":title="���ֹ��� ����"; break;
		}
		return title;
	}
}
