package kr.co.farmstory2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.BoardDAO;
import kr.co.farmstory2.vo.BoardVO;

public class ListService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		String pg    = req.getParameter("pg");
		String title = getCategoryTitle(cate);
		
		if(pg == null){
			pg = "1";
		}
		
		BoardDAO dao = BoardDAO.getInstance();
		
		// ������ ���� ��������
		int total      = dao.selectArticleTotal(cate);
		int lastPage   = 0;
		int listCount  = 0; 
		int currentPg  = Integer.parseInt(pg);
		int limitBegin = (currentPg - 1) * 10;
		int groupCurrent = (int)Math.ceil(currentPg / 10.0);
		int groupStart   = (groupCurrent - 1) * 10 + 1;
		int groupEnd     = groupCurrent * 10;
		
		if(total % 10 != 0){
			lastPage  = total / 10 + 1;	
		}else{
			lastPage  = total / 10;
		}
		
		if(groupEnd > lastPage){
			groupEnd = lastPage;
		}
				
		listCount = total - limitBegin;
		
		
		List<BoardVO> articleList = dao.selectArticleList(cate, limitBegin);
		
		req.setAttribute("articleList", articleList);
		req.setAttribute("boardGroup", group);
		req.setAttribute("category", cate);
		req.setAttribute("title", title);
		req.setAttribute("groupStart", groupStart);
		req.setAttribute("groupEnd", groupEnd);
		req.setAttribute("listCount", listCount+1);
		
		return "/board/list.jsp";
	}
	
	public String getCategoryTitle(String cate) {
		
		String title = "";
		
		switch (cate) {
			case "market":title="�庸��";break;
			case "story":title="���۹��̾߱�";break;
			case "grow":title="�Թ簡�ٱ�";break;
			case "school":title="�ͳ��б�";break;
			case "event":title="�̺�Ʈ";break;
			case "notice":title="��������";break;
			case "menu":title="������ �Ĵ�";break;
			case "chef":title="���� �丮��";break;
			case "qna":title="������";break;
			case "faq":title="���� ���� ����";break;
		}
		return title;
	}
	
}
