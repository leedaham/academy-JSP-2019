package kr.co.farmstory2.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	//DB ���� (���߿�)
	private static final String HOST = "jdbc:mysql://192.168.44.3/ldh";
	private static final String USER = "ldh";
	private static final String PASS = "1234";
	
	//DB ���� (������)
	//private static final String HOST = "jdbc:mysql://127.0.0.1/board";
	//private static final String USER = "board";
	//private static final String PASS = "ekgkatlfwjs";
	
	public static Connection getConnection() throws Exception{
		// 1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		// 2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}
}
