<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.fe.ems.util.Login" %>
<%@ page import="com.ems.fe.basedata.service.*" %>

<%
	// 属性id,password用来接收用户输入的账号密码。 
    String id = "";
    String password = "";
	id = request.getParameter("id");
	password = request.getParameter("s_password");
	
    if (id == null || "".equals(id)) {
		id = "#";
	}
    if (password == null || "".equals(password)) {
		password = "#";
	}

	Login login = new Login();
	//用来控制登陆信息，防止第一次登陆时显示登陆失败信息 
	if(id.equals("#") || password.equals("#")){
		login.setBackNews(" ");
	}
	else{
		//Login类中的login方法，用来判断用户的输入是或否和数据库中的数据一致，一致变量issuccess为true,否则为false.
		StudentService studentService = (StudentService)this.getServletContext().getAttribute("studentService");
		login = studentService.login(id, password);
		request.getSession().setAttribute("login", login);
		//Login.login(id,password);
	}
	if(login.isSuccess()){
		//登录成功，将用户重定向到学生答题首页。
		response.sendRedirect("student/index.jsp");
	}
	
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Condition  by Free CSS Templates</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<style type="text/css">td img {display: block;}</style>
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<script language="JavaScript" type="text/javascript" src="js/script.js"></script>

<script language="javascript">
<!--	
	//javascript去空格函数 
	
	function warnCharsNotInBag(s)
{
    var i;
    var returnString = false;
 
    for (i = 0; i < s.length; i++)
    {
        var c = s.charAt(i);
 
        if (c!=9 && c!=0 && c!=1 && c!=2 && c!=3 && c!=4 && c!=5 && c!=6 && c!=7 && c!=8)
        {
            returnString = true;
        }
        else{
        	returnString = false;
        }
    }
 
    return returnString;
}
	
	function LTrim(str){ //去掉字符串 的头空格
		var i;
		for(i=0;i<str.length; i++) {
			if(str.charAt(i)!=" ") break;
		}
		str = str.substring(i,str.length);
		return str;
	}
	
	function RTrim(str){
		var i;
		for(i=str.length-1;i>=0;i--){
			if(str.charAt(i)!=" "&&str.charAt(i)!=" ") break;
		}
		str = str.substring(0,i+1);
		return str;
	}
	function Trim(str){
	
		return LTrim(RTrim(str));
	
	}
	
	function check() {
		if(Trim(document.form.id.value) == "") {
			alert("请输入ID!");
			document.form.id.focus();
			return false;
		}
		if(warnCharsNotInBag(document.form.id.value)){
			alert("学号只能为数字！");
			document.form.id.focus();
			return false;
		}
		if(Trim(document.form.s_password.value) == "") {
			alert("请输入密码!");
			document.form.s_password.focus();
			return false;
		}
		return true;
	}
	
	function succes_load()
	{
		//alert(1);
		//var t =setTimeout("document.body.style.display='';",5000);
		document.getElementById("PageLoadingEffect").style.display='none';
	}
-->
</script>
<style type="">
	#PageLoadingEffect{position:absolute; left:0px; top:0px; background:white no-repeat center; width:100%; height:100%;z-index:99999;}
</style>
</head>
<body onload="succes_load()">
<div id="PageLoadingEffect"></div>
<div id="wrapper">
  <div id="logo"></div>
	<hr />
	<!-- end #logo -->
	<div id="header">
		<div id="menu">
			<ul>
				<li onMouseover="overBtn(this)" onMouseout="outBtn(this)"><a href="#" class="first">首页</a></li>
				<li onMouseover="overBtn(this)" onMouseout="outBtn(this)"><a href="student/register.jsp">注册</a></li>
				<li onMouseover="overBtn(this)" onMouseout="outBtn(this)"><a href="student/select_course.jsp">练习</a></li>
				<li onMouseover="overBtn(this)" onMouseout="outBtn(this)"><a href="snow/login.jsp">管理</a></li>
				<%--<li onMouseover="overBtn(this)" onMouseout="outBtn(this)"><a href="student/exam.jsp">考试</a></li>--%>
			</ul>
		</div>
		<!-- end #menu -->
		<div id="search">
			<form method="get" action="" >
				<fieldset>
				<input type="text" name="s" id="search-text" size="15" />
				<input type="submit" id="search-submit" value="GO" />
				</fieldset>
			</form>
		</div>
		<!-- end #search -->
	</div>
	<!-- end #header -->
	<!-- end #header-wrapper -->
	<div id="page">
		<div id="page-bgtop">
		  <div id="content">
		  
		  
		  <!-- login start -->
		  <form method="post" onsubmit="return check()" action="" name="form">     <%--student/index.html--%>
						<table border="0" cellpadding="0" cellspacing="0" width="658">
<!-- fwtable fwsrc="未命名" fwbase="main6.jpg" fwstyle="Dreamweaver" fwdocid = "976310023" fwnested="0" -->
  <tr>
   <td><img src="images/spacer.gif" width="235" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="35" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="44" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="27" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="80" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="22" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="215" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="7"><img name="main6_r1_c1" src="images/main6_r1_c1.jpg" width="658" height="183" border="0" id="main6_r1_c1" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="183" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="2"><img name="main6_r2_c1" src="images/main6_r2_c1.jpg" width="270" height="25" border="0" id="main6_r2_c1" alt="" /></td>
   <td colspan="4">&nbsp;<input type="text" style="width:162px; height:15px" name="id" ></td>
   <td><img name="main6_r2_c7" src="images/main6_r2_c7.jpg" width="215" height="25" border="0" id="main6_r2_c7" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="25" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="7"><img name="main6_r3_c1" src="images/main6_r3_c1.jpg" width="658" height="11" border="0" id="main6_r3_c1" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="11" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="2"><img name="main6_r4_c1" src="images/main6_r4_c1.jpg" width="270" height="21" border="0" id="main6_r4_c1" alt="" /></td>
   <td colspan="4">&nbsp;<input type="password" style="width:162px; height:13px" name="s_password"></td>
   <td><img name="main6_r4_c7" src="images/main6_r4_c7.jpg" width="215" height="21" border="0" id="main6_r4_c7" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="21" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="7" background="images/main6_r5_c1.jpg" width="658" height="25" border="0" align="center"><%=login.getBackNews() %></td>
   <td><img src="images/spacer.gif" width="1" height="25" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="main6_r6_c1" src="images/main6_r6_c1.jpg" width="235" height="24" border="0" id="main6_r6_c1" alt="" /></td>
   <td colspan="2" background="images/main6_r6_c2.jpg"><input type="image" src="images/spacer.gif" width="79" height="24" border="0" style="height:21px;"/></td>
   <td><img name="main6_r6_c4" src="images/main6_r6_c4.jpg" width="27" height="24" border="0" id="main6_r6_c4" alt="" /></td>
   <td background="images/main6_r6_c5.jpg"><input type="image" src="images/spacer.gif" width="79" height="24" border="0" style="height:21px" onclick="reset();return false;" /></td>
   <td colspan="2"><img name="main6_r6_c6" src="images/main6_r6_c6.jpg" width="237" height="24" border="0" id="main6_r6_c6" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="24" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="7"><img name="main6_r7_c1" src="images/main6_r7_c1.jpg" width="658" height="147" border="0" id="main6_r7_c1" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="147" border="0" alt="" /></td>
  </tr>
</table>
</form>
<!-- login end -->
		  </div>
			<!-- end #content -->
		  <div id="sidebar">
				<ul><li>
					<h2>系统新闻</h2>
					<ul>
						<li><a href="#"></a><a href="#">1，本系统保持实时更新</a></li>
						<li><a href="#">2，第一时间发布成绩</a></li>
						<li><a href="#">3，</a>安全稳定可靠保证</li>
						<li><a href="#">4，2012最新题库</a></li>
						<li><a href="#">5，题型覆盖全面</a></li>
						<li><a href="#"></a><a href="#">6，强大的后台支持</a></li>
						<li><a href="#">7，细心周到的服务人员</a></li>
						<li><a href="#">8，</a>强力师资团队</li>
					</ul>
					</li>
				</ul>
		  </div>
			<!-- end #sidebar -->
		</div>
	</div>
	<div style="width:728px; margin:auto;"><script language=javascript >document.write("<IFRAME border=0 name=rl marginWidth=0 frameSpacing=0 marginHeight=0 src='blank.html' frameBorder=0 noResize width=728 scrolling=no height=90 vspale='0'><\/IFRAME>")</script></div>
	<!-- end #page -->
	<div id="footer-bgcontent">
	<div id="footer">
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
	</div>
	</div>
	<!-- end #footer -->
</div>
</body>
</html>