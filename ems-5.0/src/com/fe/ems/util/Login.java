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
		boolean examstates = true;//����״̬��Ϊtrueʱ����������ҳ�棬����׼���롣
		boolean b = true; //��updatePhoto.jspҳ���������ƿ��reload��Ϊtrueʱreload��Ϊfalseʱ��ֹreload��
		boolean success = false; //�û���½״̬����
		boolean adminSuccess = false;//����Ա��½״̬����
		String backNews = " ";//�����û���½��Ϣ
		StringBuffer sb = new StringBuffer();
		//String adminBackNews = "";//��������Ա��¼��Ϣ
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
			
			//�������½�ɹ������ؼٵ�½ʧ��
			//if(!success)
			if(true)
			{
				if(true){
					Connection conn = null;
					PreparedStatement sql = null;
					ResultSet rs = null;
					try {
						conn = DB.getConnection();
						boolean boo = (sid == "" ? false:true) && (spassword == "" ? false:true);// �ж������Ƿ�Ϊ��
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
								backNews = "��½�ɹ�";
								success = true;
							}
							else
							{
								backNews = "��������û��������ڣ������벻ƥ��";
								success = false;
								
							}
						}
						else
						{
							backNews = "��������û���������Ϊ�ա�";
							success = false;
						}
						
					} 
					catch (SQLException e) {
						//System.out.println(e);
						success = false;
						backNews = "��������û������������";
					}catch(Exception e){
						backNews = "��������û������������";
					}
					finally {
						DB.close(rs);
						DB.close(sql);
						DB.close(conn);
					} 
				}
				/*else if(!adminSuccess){
					if(type.equals("��ʦ")){
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
									adminBackNews = "��½�ɹ�";
									adminSuccess = true;
								}
								else
								{
									adminBackNews = "��������û��������ڣ������벻ƥ��";
									adminSuccess = false;
									
								}
							}
							else
							{
								adminBackNews = "��������û��������ڣ������벻ƥ��";
								adminSuccess = false;
							}
							
						} 
						catch (SQLException e) {
							System.out.println(e);
							adminSuccess = false;
							adminBackNews = "��������û��������벻���ڣ�����������";
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