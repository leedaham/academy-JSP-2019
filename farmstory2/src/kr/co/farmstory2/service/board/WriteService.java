package kr.co.farmstory2.service.board;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.BoardDAO;
import kr.co.farmstory2.vo.BoardVO;
import kr.co.farmstory2.vo.UserVO;

public class WriteService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		
		if(req.getMethod().equals("POST")) {
			
			String path = req.getServletContext().getRealPath("/data");	

			int maxSize = 1024 * 1024 * 10; // 10MB

			// multipart ��������(÷������)�� ���۹޴� mr��ü�� �����ϸ鼭 �������� �� �������� ����
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			String group = mr.getParameter("group");
			String cate  = mr.getParameter("cate");
			String title = getCategoryTitle(cate);
			String subject  = mr.getParameter("subject");
			String content  = mr.getParameter("content");
			String fileName = mr.getFilesystemName("file");
			String regip    = req.getRemoteAddr();
			
			// ���ǿ��� ����� ���̵� ����
			HttpSession session = req.getSession();
			UserVO uv = (UserVO)session.getAttribute("user");
			String uid = uv.getUid();
			
			if(fileName != null){
				// 1) �ڵ�ȭ�� ���ϸ� ����(UUID)
				int idx = fileName.lastIndexOf(".");
				String ext = fileName.substring(idx); // ���� Ȯ����
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
				String now = sdf.format(new Date());
				
				String newFileName = now+uid+ext; // 191126111912_chhak.hwp
				
				// 2) ����� ÷�� ���ϸ� ����
				File oldFile = new File(path+"/"+fileName);
				File newFile = new File(path+"/"+newFileName);
				
				oldFile.renameTo(newFile);
			
				// 3) ���� ���ϸ�� �ڵ�ȭ�� ���ϸ��� ���̺� ���� �� �� ���
				BoardDAO dao = BoardDAO.getInstance();
				
				dao.insertArticle(cate, subject, content, 1, uid, regip);
				int parent = dao.selectMaxSeq();
				dao.insertFile(parent, fileName, newFileName);
				
				
			}else {
				// ����÷�� ������ ���
				BoardDAO dao = BoardDAO.getInstance();
				dao.insertArticle(cate, subject, content, 0, uid, regip);				
			}
			
			return "redirect:/farmstory2/board/list.do?group="+group+"&cate="+cate;
			
		}else {
			String group = req.getParameter("group");
			String cate  = req.getParameter("cate");
			String title = getCategoryTitle(cate);
			// GET ��û�϶�
			req.setAttribute("boardGroup", group);
			req.setAttribute("category", cate);
			req.setAttribute("title", title);
			
			return "/board/write.jsp";
		}
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