<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.fe.ems.*" %>
<%@ page import="com.fe.ems.model.*" %>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>


<jsp:useBean id="paperManager" class="com.fe.ems.manager.PaperManager" scope="session"/>
<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>
<jsp:useBean id="Login" class="com.fe.ems.util.Login" scope="session" />

<%!
	//Clock clock = new Clock();
	
	int questioncount = 0; //�������Ʊ���𰸵�Ƶ��
	String[] str = new String[100]; //���������������ʱ�����û��Ĵ𰸡�
	public String handleString(String s){
		try{
			byte bb[] = s.getBytes("ISO-8859-1");
			s = new String(bb);
		}
		catch(Exception e){}
		return s;
	}
%>

<%
response.setContentType("text/xml");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragram","no-cache");
response.setDateHeader("Expires",0);
String tiMuid = request.getParameter("id");
int timuId = Integer.parseInt(tiMuid);
String useranswer = request.getParameter("answer");
int seconds = Integer.parseInt(request.getParameter("miaozhong"));

str[timuId-1] = handleString(tiMuid+ "." + useranswer + " ");


/*
@��Ҫ������д����
*/

//ÿ����3���Ᵽ��һ��
if(questioncount >= 2){
	//examtime.setTimeLeft(seconds,Login.getId(),examtime.getP_id());
	//examtime.setAnswer(str,Login.getId(),examtime.getP_id());
	//questioncount = 0;
}
else{
	questioncount ++;
}

/*
if(timuId == 1){
	clock.start();
}
*/
//System.out.println("��ĿID��" + timuId);
System.out.println("�û��𰸣�" + str[timuId-1]);
//System.out.println("ʣ��ʱ�䣺" + seconds);
//System.out.println("�û��𰸣�" + useranswer);
ExamService examService = (ExamService)this.getServletContext().getAttribute("examService");
ExamPaper paper = examService.findExamPaperByPaperIdAndTimuId("1206b1", timuId + "");
//PaperModel paper = paperManager.findPaperById(examtime.getP_id(),tiMuid);
String answer = paper.getEAnswer();

int flag = 0; //�û�������ȷʱ��flagΪ1������ʱΪ0.
if(useranswer.equals(answer)){
	flag = 1;
}
else{
	flag = 0;
}
//System.out.println("��ĿdeID: " +timuId + "; ��Ŀ��: " + answer + "; danan.jsp������");
response.getWriter().write("<msg><msg>" + flag + "</msg></msg>");
%>