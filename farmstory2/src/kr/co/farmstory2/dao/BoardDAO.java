package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.SQL;
import kr.co.farmstory2.vo.BoardVO;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {}
	
	public List<BoardVO> selectArticleList(String cate, int limitBegin) throws Exception {
		

		// 1단계, 2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_LIST);
		psmt.setString(1, cate);
		psmt.setInt(2, limitBegin);
			
		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계		
		List<BoardVO> articleList = new ArrayList<>();
		
		while(rs.next()){
			
			BoardVO bv = new BoardVO();
			
			bv.setSeq(rs.getInt(1));
			bv.setParent(rs.getInt(2));
			bv.setComment(rs.getInt(3));
			bv.setCate(rs.getString(4));
			bv.setTitle(rs.getString(5));
			bv.setContent(rs.getString(6));
			bv.setFile(rs.getInt(7));
			bv.setHit(rs.getInt(8));
			bv.setUid(rs.getString(9));
			bv.setRegip(rs.getString(10));
			bv.setRdate(rs.getString(11));
			bv.setNick(rs.getString(12));
			
			articleList.add(bv);		
		}
		
		
		// 6단계
		rs.close();
		psmt.close();
		conn.close();
		
		return articleList;
	}
	
	public void insertArticle(String cate, String title, String content, int file, String uid, String regip) throws Exception {
		// 1, 2단계
		Connection conn = DBConfig.getConnection();
		conn.setAutoCommit(false); // 트랜젝션 시작
		
		// 3단계
		PreparedStatement psmt1 = conn.prepareStatement(SQL.INSERT_ARTICLE);
		psmt1.setInt(1, 0); 			//parent
		psmt1.setString(2, cate); 	    //cate
		psmt1.setString(3, title); 		//title
		psmt1.setString(4, content); 	//content
		psmt1.setInt(5, file); 			//file
		psmt1.setString(6, uid); 		//uid
		psmt1.setString(7, regip); 		//regip
		
		// 4단계
		psmt1.executeUpdate();
		
		// 5단계
		conn.commit(); // 트랜젝션 끝(쿼리 실행)	
		
		// 6단계
		psmt1.close();
		conn.close();
	}
	
	public void selectArticle() throws Exception {}
	public void updateArticle() throws Exception {}
	public void deleteArticle() throws Exception {}
	public void insertComment() throws Exception {}
	public void updateComment() throws Exception {}
	public void deleteComment() throws Exception {}
	
	public void insertFile(int parent, String fname, String newName) throws Exception {
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_FILE);
		
		psmt.setInt(1, parent);
		psmt.setString(2, fname);
		psmt.setString(3, newName);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}
	
	public int selectMaxSeq() throws Exception {
		Connection conn = DBConfig.getConnection();
		Statement stmt = conn.createStatement();				
		ResultSet rs = stmt.executeQuery(SQL.SELECT_MAX_SEQ);
		int parent = 0;
		if(rs.next()){
			parent = rs.getInt(1);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return parent;
	}
	
	public int selectArticleTotal(String cate) throws Exception {
		
		// 1,2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_TOTAL);
		psmt.setString(1, cate);
		
		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계
		int total = 0;
		
		if(rs.next()) {
			total = rs.getInt(1);
		}
		
		// 6단계
		rs.close();
		psmt.close();
		conn.close();
		
		return total;
	}
	
	
	public List<BoardVO> selectLatest(String cate) throws Exception {
		// 1, 2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECR_LATEST_BOARD);
		psmt.setString(1, cate);
		
		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계
		List<BoardVO> latests = new ArrayList<>();
		
		while(rs.next()) {
			BoardVO bv = new BoardVO();
			
			bv.setTitle(rs.getString(1));
			bv.setRdate(rs.getString(2));
			
			latests.add(bv);
		}
		
		// 6단계
		rs.close();
		psmt.close();
		conn.close();
		
		return latests;
	}	
}