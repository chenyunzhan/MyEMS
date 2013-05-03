package com.fe.ems.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class Login {

		String s_password;
		//String type;
		String id;
		String s_name;
		boolean examstates = true;//答题状态，为true时允许进入答题页面，否则不准进入。
		boolean b = true; //在updatePhoto.jsp页面用来控制框架reload。为true时reload，为false时禁止reload。
		boolean success = false; //用户登陆状态变量
		boolean adminSuccess = false;//管理员登陆状态变量
		String backNews = " ";//反馈用户登陆信息
		StringBuffer sb = new StringBuffer();
		//String adminBackNews = "";//反馈管理员登录信息
		/**
		public String handleString(String s){
			try{
				byte bb[] = s.getBytes("gbk");
				s = new String(bb);
			}
			catch(Exception e){}
			return s;
		}
		 */
		
		public boolean isB() {
			return b;
		}

		public void setB(boolean b) {
			this.b = b;
		}

		public String getS_name() {
			return s_name;
		}

		public void setS_name(String s_name) {
			this.s_name = s_name;
		}
		public boolean isExamstates() {
			return examstates;
		}
		public void setExamstates(boolean examstates) {
			this.examstates = examstates;
		}
		
		public String getBackNews() {
			return backNews;
		}
		public void setBackNews(String backNews) {
			this.backNews = backNews;
		}
		public boolean isSuccess() {
			return success;
		}
		public void setSuccess(boolean success) {
			this.success = success;
		}
		public Login(){
			
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getS_password() {
			return s_password;
		}

		public void setS_password(String s_password) {
			this.s_password = s_password;
		}

		public boolean isAdminSuccess() {
			return adminSuccess;
		}
		public void setAdminSuccess(boolean adminSuccess) {
			this.adminSuccess = adminSuccess;
		}
		public void login(String sid,String spassword){
			
			//返回真登陆成功，返回假登陆失败
			//if(!success)
			if(true)
			{
				if(true){
					Connection conn = null;
					PreparedStatement sql = null;
					ResultSet rs = null;
					try {
						conn = DB.getConnection();
						boolean boo = (sid == "" ? false:true) && (spassword == "" ? false:true);// 判断密码是否为空
						String condition = "select * from student where s_id=?";
						sql = conn.prepareStatement(condition);
						
						if(boo)
						{
							sql.setString(1, sid);
							rs = sql.executeQuery();
							boolean m = false;
							rs.next();
							if(rs.getString("s_password").equals(spassword)){
								m = true;
							}
							if(m == true)
							{
								this.id = sid;
								this.s_password = spassword;
								s_name = rs.getString("s_name");
								backNews = "登陆成功";
								success = true;
							}
							else
							{
								backNews = "您输入的用户名不存在，或密码不匹配";
								success = false;
								
							}
						}
						else
						{
							backNews = "您输入的用户名或密码为空。";
							success = false;
						}
						
					} 
					catch (SQLException e) {
						//System.out.println(e);
						success = false;
						backNews = "您输入的用户名或密码错误！";
					}catch(Exception e){
						backNews = "您输入的用户名或密码错误！";
					}
					finally {
						DB.close(rs);
						DB.close(sql);
						DB.close(conn);
					} 
				}
				/*else if(!adminSuccess){
					if(type.equals("教师")){
						Connection conn = null;
						PreparedStatement sql = null;
						ResultSet rs = null;
						try {
							PaperModel paper = null;
							conn = DB.getConnection();
							boolean boo = (id.length() > 0) && (s_password.length() > 0);
							String condition = "select * from administrator where a_id=? and a_password=?";
							sql = conn.prepareStatement(condition);
							
							if(boo)
							{
								sql.setString(1, id);
								sql.setString(2, s_password);
								rs = sql.executeQuery();
								boolean m = rs.next();
								
								if(m == true)
								{
									s_name = rs.getString("a_name");
									adminBackNews = "登陆成功";
									adminSuccess = true;
								}
								else
								{
									adminBackNews = "您输入的用户名不存在，或密码不匹配";
									adminSuccess = false;
									
								}
							}
							else
							{
								adminBackNews = "您输入的用户名不存在，或密码不匹配";
								adminSuccess = false;
							}
							
						} 
						catch (SQLException e) {
							System.out.println(e);
							adminSuccess = false;
							adminBackNews = "您输入的用户名或密码不存在！！！！！！";
						}finally {
							DB.close(rs);
							DB.close(sql);
							DB.close(conn);
						} 
					}
				}*/ 
			}
		}
}