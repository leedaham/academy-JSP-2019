package kr.co.jcinema.admin.service.ticket;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jcinema.admin.dao.AdminTicketDAO;
import kr.co.jcinema.admin.vo.TicketVO;
import kr.co.jcinema.controller.CommonService;

public class GenerateService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if (req.getMethod().equals("POST")) {
			String theater_no = req.getParameter("theater_no");
			String screen_no  = req.getParameter("screen_no");
			String movie_no   = req.getParameter("movie_no");
			String round_view = req.getParameter("round_view");
			String movie_date = req.getParameter("movie_date").substring(2).replace("-", "");
			String price = req.getParameter("price");
			
			// 萍南 内靛积己
			char[] seat_alphabet = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'};
			String ticket_no = theater_no+screen_no+movie_no+movie_date+round_view;
			
			AdminTicketDAO dao = AdminTicketDAO.getInstance();
			
			for(int row=1; row<=seat_alphabet.length; row++) {
				for(int col=1; col<=10; col++) {
					
					String seat_no = row+""+col;
					
					// 萍南 按眉
					TicketVO tvo = new TicketVO();
					tvo.setTicket_no(ticket_no+seat_no);
					tvo.setTicket_movie_no(movie_no);
					tvo.setTicket_movie_date(movie_date);
					tvo.setTicket_round_view(round_view);
					tvo.setTicket_theater_no(theater_no);
					tvo.setTicket_screen_no(screen_no);
					tvo.setTicket_seat(seat_alphabet[row-1]+""+col);
					tvo.setTicket_price(price);
					
					dao.insertTicket(tvo);
				}
			}
			
			return "redirect:/jcinema/admin/ticket/generate";
		} else {
			return "/admin/ticket/generate.jsp";
		}
	}

}
