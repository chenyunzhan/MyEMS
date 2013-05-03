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
	
	int questioncount = 0; //用来控制保存答案的频率
	String[] str = new String[100]; //答题过程中用来临时保存用户的答案。
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
@需要继续改写！！
*/

//每答完3个题保存一次
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
//System.out.println("题目ID：" + timuId);
System.out.println("用户答案：" + str[timuId-1]);
//System.out.println("剩余时间：" + seconds);
//System.out.println("用户答案：" + useranswer);
ExamService examService = (ExamService)this.getServletContext().getAttribute("examService");
ExamPaper paper = examService.findExamPaperByPaperIdAndTimuId("1206b1", timuId + "");
//PaperModel paper = paperManager.findPaperById(examtime.getP_id(),tiMuid);
String answer = paper.getEAnswer();

int flag = 0; //用户答题正确时，flag为1，错误时为0.
if(useranswer.equals(answer)){
	flag = 1;
}
else{
	flag = 0;
}
//System.out.println("题目deID: " +timuId + "; 题目答案: " + answer + "; danan.jsp被调用");
response.getWriter().write("<msg><msg>" + flag + "</msg></msg>");
%>