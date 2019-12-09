package kr.co.board2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.vo.BoardArticleVO;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {}
	
	public List<BoardArticleVO> selectArticles(int limitBegin) throws Exception {
		// 1, 2�ܰ�
		Connection conn = DBConfig.getConnection();
		
		// 3 �ܰ�
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_LIST);
		psmt.setInt(1, limitBegin);
		
		// 4 �ܰ�
		ResultSet rs = psmt.executeQuery();
		
		// 5 �ܰ�
		List<BoardArticleVO> articleList = new ArrayList();
		
		while(rs.next()){
			
			BoardArticleVO bav = new BoardArticleVO();
			
			bav.setSeq(rs.getInt(1));
			bav.setParent(rs.getInt(2));
			bav.setComment(rs.getInt(3));
			bav.setCate(rs.getString(4));
			bav.setTitle(rs.getString(5));
			bav.setContent(rs.getString(6));
			bav.setFile(rs.getInt(7));
			bav.setHit(rs.getInt(8));
			bav.setUid(rs.getString(9));
			bav.setRegip(rs.getString(10));
			bav.setRdate(rs.getString(11));
			bav.setNick(rs.getString(12));
			
			articleList.add(bav);
		}
		
		// 6 �ܰ�
		rs.close();
		psmt.close();
		conn.close();
		
		return articleList;
	}
	public void selectArticle() throws Exception {}
	public void insertArticle() throws Exception {}
	public void updateArticle() throws Exception {}
	public void deleteArticle() throws Exception {}
	public void selectComments() throws Exception {}
	
	public int selectArticleTotal() throws Exception {
		// 1,2�ܰ�
		Connection conn = DBConfig.getConnection();
				
		// 3�ܰ�
		Statement stmt = conn.createStatement();
		// 4�ܰ�
		ResultSet rsTotal=stmt.executeQuery(SQL.SELECT_ARTICLE_TOTAL);
		// 5�ܰ�
		int total = 0;
		
		if(rsTotal.next()){
			total = rsTotal.getInt(1);
		}
		// 6�ܰ�
		rsTotal.close();
		stmt.close();
		conn.close();
		
		return total;
	}
	public void selectMaxSeq() throws Exception {}
	public void insertFile() throws Exception {}
}
