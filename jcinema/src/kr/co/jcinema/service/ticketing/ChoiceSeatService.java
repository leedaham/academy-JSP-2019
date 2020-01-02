package kr.co.jcinema.service.ticketing;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.jcinema.controller.CommonService;
import kr.co.jcinema.dao.MovieDAO;
import kr.co.jcinema.vo.MovieScheduleVO;
import kr.co.jcinema.vo.MovieVO;
import kr.co.jcinema.vo.SeatVO;

public class ChoiceSeatService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String theaterNo = req.getParameter("theater_no");
		String screenNo  = req.getParameter("screen_no");
		String movieDate = req.getParameter("movie_date");
		String movieNo   = req.getParameter("movie_no");
		String roundView = req.getParameter("round_view");
		
		MovieDAO dao = MovieDAO.getInstance();
		
		MovieVO mvo = dao.selectMovie(movieNo);
		MovieScheduleVO msvo = dao.selectMovieScheduleWithTheater(movieNo, theaterNo, screenNo, movieDate, roundView);
		
		
		List<List<SeatVO>> seatList = dao.selectSeat(theaterNo, screenNo, movieDate, movieNo, roundView);
		
		char row[] = {'A','B','C','D','E','F','G','H','I'};
		req.setAttribute("mInfo", mvo);
		req.setAttribute("mSchedule", msvo);
		req.setAttribute("seatRow", row);
		req.setAttribute("seatList", seatList);
		
		// JSON 테스트 출력
		//String json = new Gson().toJson(seatList);
		//return json;
		
		return "/ticketing/choice-seat.jsp";
		
	}

}
