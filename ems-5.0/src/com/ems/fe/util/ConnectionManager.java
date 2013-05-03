package com.ems.fe.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * ����ThreadLocal����Connection
 * @author ����չ
 *
 */
public class ConnectionManager {

	private static ThreadLocal connectionHolder = new ThreadLocal();
	
	/**
	 * ȡ��Connection
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = (Connection)connectionHolder.get();
		if (conn == null) {
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=EMS_new";
	    		String user = "sa";
	    		String password = "snow21";
	    		conn = DriverManager.getConnection(uri,user,password);
				//�ŵ�ThreadLocal��
				connectionHolder.set(conn);
			} catch (ClassNotFoundException e) {
				//��¼��־
				e.printStackTrace();
				//throw new DBException();
			} catch (SQLException e) {
				//��¼��־
				e.printStackTrace();
				//throw new DBException();
			}
		}
		return conn;
	}
	
	/**
	 * �ر�Connection
	 */
	public static void closeConnection() {
		Connection conn = (Connection)connectionHolder.get();
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			connectionHolder.remove();
		}
	}
	/**
	 * �ر�PreparedStatement
	 * @param pstmt
	 */
	public static void close(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * �ر�ResultSet
	 * @param rs
	 */
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
