package kr.co.board1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	//DB ����
	private static final String HOST = "jdbc:mysql://192.168.44.9/ldh";
	private static final String USER = "ldh";
	private static final String PASS = "12345";
	
	public static Connection getConnection() throws Exception{
		// 1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		// 2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}
}
