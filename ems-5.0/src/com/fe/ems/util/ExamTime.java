package com.fe.ems.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.fe.*;
import com.fe.ems.model.PaperModel;

public class ExamTime {

	boolean preventfresh = true; 
	String p_id = "";
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public boolean isPreventfresh() {
		return preventfresh;
	}
	public void setPreventfresh(boolean preventfresh) {
		this.preventfresh = preventfresh;
	}

	/**
	 * ����û�����ʣ��ʱ��
	 * @param id
	 * @return
	 */
	public String  getTimeLeft(String id,String p_id)
	{
		String time = "";
		String sql = "select timeout from messageprotect where s_id=? and p_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				time = rs.getString(1);
			}
			else
			{
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return time;
	}
	
	/**
	 * �����û�����ʣ��ʱ��
	 * @param timeout
	 * @param id
	 */
	public void setTimeLeft(int timeout,String id,String p_id){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String condition = "update messageprotect set timeout=? where s_id=? and p_id=?";
			pstmt = conn.prepareStatement(condition);
			pstmt.setInt(1, timeout);
			pstmt.setString(2, id);
			pstmt.setString(3, p_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	/**
	 * ��ȡ�û��𰸡�
	 * @param id
	 * @return
	 */
	public String  getAnswer(String id,String p_id)
	{
		String time = "";
		String sql = "select answer from messageprotect where s_id=? and p_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				time = rs.getString(1);
			}
			else
			{
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return time;
	}
	
	/**
	 * �����û��𰸡�
	 * @param answer
	 * @param id
	 */
	public void setAnswer(String[] answer,String id,String p_id){
		
		StringBuffer answerbuffer = new StringBuffer();
		for(int i=0; i<answer.length; i++){
			if(answer[i] != null){
				answerbuffer.append(answer[i]);
			}
		}
		String answers = answerbuffer.toString();
		//System.out.println("�ύ�����ݿ��еĴ�Ϊ��" + answers);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String condition = "update messageprotect set answer=? where s_id=? and p_id=?";
			pstmt = conn.prepareStatement(condition);
			pstmt.setString(1, answers);
			pstmt.setString(2, id);
			pstmt.setString(3, p_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	/**
	 * ����û�����Ȩ��
	 * @param id
	 * @return
	 */
	public int  getAllowstates(String id,String p_id)
	{
		int allowstates = 0;
		String sql = "select allowstates from messageprotect where s_id=? and p_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				allowstates = rs.getInt(1);
			}
			else
			{
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return allowstates;
	}
	
	/**
	 * �����û�����Ȩ��
	 * @param allowstates
	 * @param id
	 */
	public void setAllowstates(int allowstates,String id,String p_id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			String condition = "update messageprotect set allowstates=? where s_id=? and p_id=?";
			pstmt = conn.prepareStatement(condition);
			pstmt.setInt(1, allowstates);
			pstmt.setString(2, id);
			pstmt.setString(3, p_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	/**
	 * ��ѯ���ݿ����Ƿ�����û��ı�����Ϣ�������ڣ�����false�����ڷ���true��
	 * @param s_id
	 * @param p_id
	 * @return
	 */
	public boolean getUserProtectMess(String s_id, String p_id){
		boolean exist = true;
		String sql = "select * from messageprotect where s_id=? and p_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaperModel paper = null;
		try {
			conn = DB.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_id);
			pstmt.setString(2, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{
				exist = true;
			}
			else
			{
				exist = false;
			}
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
			exist = false;
		}
		finally 
		{
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		} 
		return exist;
	}
	
	/**
	 * �����ݿ�������û�������Ϣ��
	 * @param s_id
	 * @param p_id
	 * @param timeout
	 * @param answer
	 * @param allowstates
	 */
	public void addUserProtectMess(String s_id,String p_id,int timeout,String answer,int allowstates){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try
		{
			conn = DB.getConnection();
			String insertCondition = "INSERT INTO messageprotect (s_id,p_id,timeout,answer,allowstates) VALUES (?,?,?,?,?)";
			pstmt = conn.prepareStatement(insertCondition);
			pstmt.setString(1, s_id);
			pstmt.setString(2, p_id);
			pstmt.setInt(3,timeout);
			pstmt.setString(4, answer);
			pstmt.setInt(5, allowstates);
			int m = pstmt.executeUpdate();
			if(m != 0)
			{
			}
			else
			{
			}
		}
		catch(SQLException exp)
		{
		}
		finally {
			DB.close(pstmt);
			DB.close(conn);
		} 
	}
	
}
