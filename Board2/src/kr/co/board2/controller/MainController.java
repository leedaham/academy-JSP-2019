package kr.co.board2.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<>();
	

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// 프로퍼티 파일 경로 구하기
		ServletContext sc = config.getServletContext();
		String path = sc.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		Properties prop = new Properties();
		
		try {
			// 프로퍼티 파일과 스트림 연결
			FileInputStream fis = new FileInputStream(path);
			// 스트림으로 데이터 읽어서 prop객체에 저장
			prop.load(fis);
			// 스트림 해제
			fis.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// prop객체의 Key-Value에서 Value값을 객체로 생성
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
				
				instances.put(k, instance);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			requestProc(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			requestProc(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
public void requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String path = req.getContextPath();
		String uri  = req.getRequestURI();
		
		String action = uri.substring(path.length());
		
		
		CommonService instance = (CommonService) instances.get(action);
		
		String result = instance.requestProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			// 리다이렉트
			String redirectUrl = result.substring(9);
			resp.sendRedirect(redirectUrl);
			
		}else if(result.startsWith("{")) {	
			// JSON 출력
			PrintWriter out = resp.getWriter();
			out.print(result);
			
		}else {
			// VIEW 포워드
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
		
				
	}
	

}
