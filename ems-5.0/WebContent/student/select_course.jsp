<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.fe.ems.util.Login" %>
<%
	Login login = (Login)session.getAttribute("login");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Condition  by Free CSS Templates</title>
<!-- InstanceEndEditable -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/test.css" rel="stylesheet" type="text/css" />
<style type="text/css">td img {display: block;}
.user {
	position:absolute;
	width:125px;
	height:25px;
	z-index:1;
	left: 950px;
	top: 146px;
	color:#FFFFFF;
	font-size:13px;
}
</style>
<script language="JavaScript" type="text/javascript" src="../js/script.js"></script>
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>
<body>
<div id="wrapper">
  <div id="logo"></div>
	<hr />
	<!-- end #logo -->
	<!-- InstanceBeginEditable name="menu" -->
	<div id="header">
      <div id="menu">
        <ul>
          	<li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="index.jsp" class="first">������ҳ</a></li>
			<li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="student_info.jsp">������Ϣ</a></li>
			<li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="test.jsp">��ǰ����</a></li>
			<li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="exit.jsp">�˳���¼</a></li>
        </ul>
      </div>
	  <!-- end #menu -->
     <div class="user">
		<%=login.getS_name()== null? "��ӭ��ʹ�ñ�ϵͳ!" : login.getS_name() + ",��ӭ��!"%> 
	</div>
	  <!-- end #search -->
    </div>
	<!-- InstanceEndEditable -->
	<!-- end #header -->
	<!-- end #header-wrapper -->
	<!-- InstanceBeginEditable name="main" -->
	<div id="page">
      <div id="page-bgtop">
        <!-- end #content -->
<div style="height:300px">
          <ul>
            <li>
              <h2>��ѡ����Ҫ���������⣺</h2>
              <ul>
                <li>1��2009������&nbsp;&nbsp;&nbsp;���ݿ⣨<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;JSP��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;����ϵͳ��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��������磨<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��ҳ��ƣ�<a href="#">��ϰ</a> <a href="#">����</a>��</li>
                <li>2��2010������&nbsp;&nbsp;&nbsp;���ݿ⣨<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;JSP��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;����ϵͳ��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��������磨<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��ҳ��ƣ�<a href="#">��ϰ</a> <a href="#">����</a>��</li>
				<li>3��2011������&nbsp;&nbsp;&nbsp;���ݿ⣨<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;JSP��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;����ϵͳ��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��������磨<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��ҳ��ƣ�<a href="#">��ϰ</a> <a href="#">����</a>��</li>
				<li>4��2012������&nbsp;&nbsp;&nbsp;���ݿ⣨<a href="test.jsp?id=1206b1">��ϰ</a> <a href="exam.jsp?id=1206b1">����</a>��&nbsp;&nbsp;&nbsp;JSP��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;����ϵͳ��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��������磨<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��ҳ��ƣ�<a href="#">��ϰ</a> <a href="#">����</a>��</li>
				<li>5��2013������&nbsp;&nbsp;&nbsp;���ݿ⣨<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;JSP��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;����ϵͳ��<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��������磨<a href="#">��ϰ</a> <a href="#">����</a>��&nbsp;&nbsp;&nbsp;��ҳ��ƣ�<a href="#">��ϰ</a> <a href="#">����</a>��</li>
              </ul>
            </li>
          </ul>
        </div>
        <!-- end #sidebar -->
      </div>
    </div>
  <!-- InstanceEndEditable -->
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
<!-- InstanceEnd --></html>