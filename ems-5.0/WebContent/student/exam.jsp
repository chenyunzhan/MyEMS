<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<%@ page import="com.fe.ems.manager.*" %>
<%@ page import="com.fe.ems.util.*" %>
<%@ page import="com.fe.ems.model.*" %>
<%@ page import="com.ems.fe.basedata.service.*" %>
<%@ page import="com.ems.fe.basedata.model.*" %>
<%@ page import="com.ems.fe.util.*" %>

<jsp:useBean id="examtime" class="com.fe.ems.util.ExamTime" scope="session"/>
<%
	Login login = (Login)session.getAttribute("login");
%>

<%
	String p_id = "";
	p_id =request.getParameter("id");
	if(p_id == null || p_id.equals("")){
		p_id = "#";
	}
	else{
		examtime.setP_id(p_id);
	}
	System.out.println(p_id);
%>

<%
	/**
	if(!examtime.getUserProtectMess(Login.getId(),p_id) && p_id != "#"){
		examtime.addUserProtectMess(Login.getId(),p_id,2700,"#",0);
	}
	*/
	//if(examtime.getAllowstates(Login.getId(),p_id) == 0 && Login.isSuccess() && examtime.isPreventfresh())
	if(true)
	{
		examtime.setPreventfresh(false);
%>

<%
	int pageNo = 1;
	int pageSize =100;
	ExamService examService = (ExamService)this.getServletContext().getAttribute("examService");
	PageModel pageModel = examService.findAllExam(pageNo, pageSize, "12", "06", "b1");
	
	//paperManager.findAllPaper(pageNo, pageSize,p_id);
	List paperList = pageModel.getList();
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
<style type="text/css">
td img {display: block;}
</style>
<script language="JavaScript" type="text/javascript" src="../js/script.js"></script>
<!-- InstanceBeginEditable name="head" -->
<link href="../css/exam.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	font-size: large;
	color: #0D5585;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.STYLE3 {
	color: #66665E;
	font-size: 12px;
}
.STYLE5 {color: #FF0000}
.Layer1 {
	position:absolute;
	width:195px;
	height:318px;
	z-index:1;
	left: 550px;
	top: -1px;
	overflow: hidden;
}
.Layer2 {
	position:absolute;
	width:936px;
	height:34px;
	z-index:1;
	left: 200px;
	top: 211px;
}
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
.exam_photo {
	position: absolute;
	height: 147px;
	width: 120px;
	left: 30px;
	top: 12px;
	background-image: url(../images/exam_photo.jpg);
	border:1��
}
-->
</style>
<!-- InstanceEndEditable -->
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
        <li onmouseover="overBtn(this)" onmouseout="outBtn(this)"><a href="#">��ʽ����</a></li>
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
	
<form name="form1" method="post" action="">
	
  <div onmousemove="javascript:refresh()" onmouseover="javascript:refresh()" > <!-- ��ʱ����ͼƬ������Ҳ���������ʾĬ��ͼƬ  -->
  <br />
  	<div class="Layer2" align="center">
  	<%
  	//if(!examtime.getAnswer(Login.getId(),examtime.getP_id()).equals("#")){
  	//	out.println(examtime.getAnswer(Login.getId(),examtime.getP_id()));
  	//}	
  	%>
  	
  	<br/></div>
  <br /><br /><br />
	<div class="exam_main" style="margin-left:auto; margin-right:auto;">
	  <div class="exam_left">
	  
	     <!-- �˴�����ѧ����ͷ�� -->
	    <div class="exam_photo" >
	   <img id="studentPhoto" border="1" height="147" width="120" style="border-color:#000000" src="../images/upload_images/<%=login.getId() %>.jpg" alt="" onerror="show_default_photo()"/>
	    </div>
	    
        <div class="exam_username STYLE1">�� �� ��<br />
        <span class="STYLE3"><%=login.getS_name() %></span></div>
		<div class="exam_userNo STYLE1">�� �� ��<br />
	    <span class="STYLE3"><%=login.getId() %></span></div>
	    <div class="exam_oper"><img src="../images/exam_oper.jpg" alt="����˵��" width="168" height="39" /></div>
		
	    <div class="exam_oper_content">
	      <p>�ж���<br />
          ����<span class="STYLE5">��/��</span>��������ѡ����<br />
          ����<span class="STYLE5">A/B/C/D</span>��������<br />
          ����<span class="STYLE5">�Ϸ�</span>�����鿴��һ��<br />
          ����<span class="STYLE5">�·�</span>����������һ��</p>
        </div>
	  </div>
	
      <div class="exam_right">
        <UL class=cstm id=timu><IMG 
 			 src="../images/20080320132844619.gif" width="37" height="37">���ڳ����У����Եȣ� 
		</UL>
		
		<div class="Layer1" ><img height="320" width="200" id="examimage" src="../images/defaultImage.gif" onerror="show_default()"/></div>
		
		
		<DIV class=kszuo>
<DIV class=dtkey><SPAN class=wdtm id=spwdt><%=pageModel.getTotalRecords()%>��δ��</SPAN>
<SPAN class=sysj>ʣ��ʱ��:</SPAN>
<SPAN class=sjk><I class=time id=spsyshijian>45:00</I></SPAN>
<SPAN class=daan>�𰸣�</SPAN>
<SPAN class=answer id=spyhdaan></SPAN>
<span style="padding-top: 18px;" id="span_blank" ><input type="text" name="tiankong" value="" size="10"  onchange="xxti(document.form1.tiankong.value)"/></span> 
<SPAN class=daan><INPUT id=ckbzidongqianjin onclick=fzidongqianjin() type=checkbox value=0>�Զ�ǰ��</SPAN> 
</DIV>
<TABLE class=man_zone_table id=ta cellSpacing=1 cellPadding=0 align=center 
border=0>
  <TBODY>
  
  <SCRIPT language=javascript type=text/javascript>
  	/**
     //������غ�ˢ�����⣡��������������������������������������������������������������������������������������������������������������������������������
	function before(){
    	 if(tijiao == false){
    		event.returnValue = "����û���ύ�Ծ��뿪ҳ����˳����Գɼ���Ч�����Ƿ����?"; 
    	 }
	}
     
	function unload()//�ر���ҳ�����´򿪵�¼����   
	{
		if(tijiao == false){
			var n = window.event.screenX - window.screenLeft;
    		var b = n > document.documentElement.scrollWidth-20;
    		if(b && window.event.clientY < 0 || window.event.altKey){
      		  //�ر�
    		}else{
      	    //ˢ��
       	    document.getElementById('iie')
    		}
    	 }
	   
	}
	function brs()//����object   
	{
		if(tijiao == false){
	    	//document.body.innerHTML += 
	       		//"<object id='iie' width='0' height='0' classid='CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6'></object>";
	    }
	}   
	  window.attachEvent("onbeforeunload",before);
      window.attachEvent('onload',brs);
	  window.attachEvent('onunload',unload);
  	*/
  
                            var tal = document.getElementById("ta");
                            var newTr;
                            var newTd;
                            for(var i=0;i< 5;i++){           
                                newTr =  tal.insertRow(-1);//�����
                                for(var j=0;j<20;j++)
                                {                   
                                    newTd =  newTr.insertCell(-1);//�����
                                    newTd.innerHTML = i*20 + j + 1;//��������
                                    newTd.id = "td"+(i*20 + j + 1);//����ID
                                    newTd.onclick =function(){jiazaitimu(this.innerHTML);};//����¼�
                                }
                             }
</SCRIPT>
  </TBODY></TABLE>
<DIV class=dtzt><I><IMG 
src="../images/se_14.gif" width="21" height="18">δ����</I><I><IMG 
src="../images/se_16.gif" width="21" height="18">�Ѵ���</I></DIV>
		</DIV>
		
<DIV class=ksyou>
		
			<table border="0" cellpadding="0" cellspacing="0" width="194">
<!-- fwtable fwsrc="δ����" fwbase="exam_oper.jpg" fwstyle="Dreamweaver" fwdocid = "278736020" fwnested="0" -->
  <tr>
   <td><img src="../images/spacer.gif" width="9" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="45" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="43" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="46" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="46" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="5" height="1" border="0" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="6"><img name="exam_oper_r1_c1" src="../images/exam_oper_r1_c1.jpg" width="194" height="7" border="0" id="exam_oper_r1_c1" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="7" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="exam_oper_r2_c1" src="../images/exam_oper_r2_c1.jpg" width="9" height="45" border="0" id="exam_oper_r2_c1" alt="" /></td>
   <td><img name="exam_oper_r2_c2" src="../images/exam_oper_r2_c2.jpg" width="45" height="45" border="0" id="exam_oper_r2_c2" alt="" onClick="shangyiti()" /></td>
   <td><img name="exam_oper_r2_c3" src="../images/exam_oper_r2_c3.jpg" width="43" height="45" border="0" id="exam_oper_r2_c3" alt="" onClick="xiayiti()" /></td>
   <td><img name="exam_oper_r2_c4" src="../images/exam_oper_r2_c4.jpg" width="46" height="45" border="0" id="exam_oper_r2_c4" alt="" onClick="closeObj()" /></td>
   <td><img name="exam_oper_r2_c5" src="../images/exam_oper_r2_c5.jpg" width="46" height="45" border="0" id="exam_oper_r2_c5" alt="" onClick="ftijiao()" /></td>
   <td><img name="exam_oper_r2_c6" src="../images/exam_oper_r2_c6.jpg" width="5" height="45" border="0" id="exam_oper_r2_c6" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="45" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="exam_oper_r3_c1" src="../images/exam_oper_r3_c1.jpg" width="9" height="43" border="0" id="exam_oper_r3_c1" alt="" /></td>
   <td><img name="exam_oper_r3_c2" src="../images/exam_oper_r3_c2.jpg" width="45" height="43" border="0" id="exam_oper_r3_c2" alt="" onClick="xxti('A')" /></td>
   <td><img name="exam_oper_r3_c3" src="../images/exam_oper_r3_c3.jpg" width="43" height="43" border="0" id="exam_oper_r3_c3" alt="" onClick="xxti('B')" /></td>
   <td><img name="exam_oper_r3_c4" src="../images/exam_oper_r3_c4.jpg" width="46" height="43" border="0" id="exam_oper_r3_c4" alt="" onClick="xxti('C')" /></td>
   <td rowspan="2"><img name="exam_oper_r3_c5" src="../images/exam_oper_r3_c5.jpg" width="46" height="89" border="0" id="exam_oper_r3_c5" alt="" onClick="qrtijiao()" /></td>
   <td rowspan="5"><img name="exam_oper_r3_c6" src="../images/exam_oper_r3_c6.jpg" width="5" height="185" border="0" id="exam_oper_r3_c6" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="43" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="exam_oper_r4_c1" src="../images/exam_oper_r4_c1.jpg" width="9" height="46" border="0" id="exam_oper_r4_c1" alt="" /></td>
   <td><img name="exam_oper_r4_c2" src="../images/exam_oper_r4_c2.jpg" width="45" height="46" border="0" id="exam_oper_r4_c2" alt="" onClick="xxti('D')" /></td>
   <td><img name="exam_oper_r4_c3" src="../images/exam_oper_r4_c3.jpg" width="43" height="46" border="0" id="exam_oper_r4_c3" alt="" onClick="pdti('A')" /></td>
    <td><img name="exam_oper_r4_c4" src="../images/exam_oper_r4_c4.jpg" width="46" height="46" border="0" id="exam_oper_r4_c4" alt="" onClick="pdti('B')" /></td>
   <td><img src="../images/spacer.gif" width="1" height="46" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="3"><img name="exam_oper_r5_c1" src="../images/exam_oper_r5_c1.jpg" width="9" height="96" border="0" id="exam_oper_r5_c1" alt="" /></td>
    <td><img name="exam_oper_r5_c2" src="../images/exam_oper_r5_c2.jpg" width="45" height="45" border="0" id="exam_oper_r5_c2" alt="" onClick="diyiti()" /></td>
    <td><img name="exam_oper_r5_c3" src="../images/exam_oper_r5_c3.jpg" width="43" height="45" border="0" id="exam_oper_r5_c3" alt="" onClick="alert('��¼��ſ�ʹ��!')" /></td>
    <td><img name="exam_oper_r5_c4" src="../images/exam_oper_r5_c4.jpg" width="46" height="45" border="0" id="exam_oper_r5_c4" alt="" onclick="zuihoutiyi()" /></td>
    <td rowspan="2"><img name="exam_oper_r5_c5" src="../images/exam_oper_r5_c5.jpg" width="46" height="88" border="0" id="exam_oper_r5_c5" alt="" onClick="xiayiti()" /></td>
   <td><img src="../images/spacer.gif" width="1" height="45" border="0" alt="" /></td>
  </tr>
  <tr>
  <td colspan="2"><img name="exam_oper_r6_c2" src="../images/exam_oper_r6_c2.jpg" width="88" height="43" border="0" id="exam_oper_r6_c2" alt="" onClick="ksdt()" /></td>
  <td><img name="exam_oper_r6_c4" src="../images/exam_oper_r6_c4.jpg" width="46" height="43" border="0" id="exam_oper_r6_c4" alt="" onclick="chongxinkaishi()" /></td>
   <td><img src="../images/spacer.gif" width="1" height="43" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="3"><img name="exam_oper_r7_c2" src="../images/exam_oper_r7_c2.jpg" width="134" height="8" border="0" id="exam_oper_r7_c2" alt="" /></td>
   <td><img name="exam_oper_r7_c5" src="../images/exam_oper_r7_c5.jpg" width="46" height="8" border="0" id="exam_oper_r7_c5" alt="" /></td>
   <td><img src="../images/spacer.gif" width="1" height="8" border="0" alt="" /></td>
  </tr>
</table>
		
</DIV>




<script src="../js/jquery.min.js" type="text/javascript" language="JavaScript"></script>

		<script type="text/javascript">
			function show_default() {
				var a = document.getElementById("examimage");
				a.setAttribute("src","../images/spacer.gif");
			}	
			
			function show_default_photo() {
				var a = document.getElementById("studentPhoto");
				a.setAttribute("src","../images/spacer.gif");
			}
			
		</script>

        <script language="javascript" type="text/javascript">
        		var miaozhong = 45*60;
                <%--
                var miaozhong =<%=examtime.getTimeLeft(Login.getId(),examtime.getP_id()) %>;//ʱ������
                --%>
                var fenshu = 0;//�ܷ���
                var t;//ʱ��
                var total = <%=pageModel.getTotalRecords()%> ;//��Ŀ����
                var timuId = new Array(1367);//��ĿID
                var timuindex = new Array(1367);//��Ŀ���
                var totalright = 0;//��Ե��ܼ�¼��
                var totalwrong = 0;//�����ܼ�¼��
                var yhdaan = new Array(total);//�û���
                var zqdaan = new Array(total);//��ȷ��
                var cwdaan = new Array(total);//�����
                for(var i =0;i<total;i++)
                {
                    yhdaan[i] ="";//��ʼ��
                    zqdaan[i]="";
                    cwdaan[i]="";
                }
                var jianpan = true;//�������̣�false�رռ���
                var start = false;//falseδ��ʼ���ԣ�true ��ʼ����
                var zhengquedaan = false;//false ����ʾ��ȷ�𰸣�true��ʾ��ȷ��
                var datiqingkuang = false;//false ����ʾ���������true��ʾ
                var zidongpancuo = false;//false ����ʾ �д�true��ʾ
                var zidongqianjin = false;//false ���Զ�ǰ����true �Զ�ǰ���� ���Զ��д���ͬʱΪtrue
                var panduan = "false";//false ѡ���⣬true�ж���
                var tijiao = false;//δȷ���ύ��true ȷ���ύ
                var keynum;//���̶�Ӧkeycode
                var index = 1;//��ǰ�ڼ���
                 <%  
                	int count = 0;
                	for (Iterator iter=paperList.iterator(); iter.hasNext();) {
        				//PaperModel paper = (PaperModel)iter.next();
        				ExamPaper paper = (ExamPaper)iter.next();
        				String str = paper.getEName();
        				out.print("timuId[" + count + "]=" + str + ";");
 System.out.println(count);
        				count ++;
       				} 
    		    %>
				$(function(){

	                    //��ʼ����һ��

	                  

	                  jiazaitimu(1);

	                    t = setInterval("shijian()",1000);

	                  start = true;

	                   

	              })

                    //ѡ������
                    function xuanzetixing()
                    {
                        if($("#rd1").attr("checked") == true)
                        {
                            window.location.href = window.location.href +"?stype=0";//�ж���
                        }
                        else{
                            window.location.href = window.location.href +"?stype=1";//ѡ����
                        }
                    }
                    //���ⷴ��
                    function fk()
                    { jianpan = false;
                         $.ajax({
                            type:"get",
                            url:"server/fankui.ashx",
                            data:"id="+timuId[index-1],
                            success:function(data)
                            {
                                 $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                                .width($(window).width())  
                                .height($(window).height())
                                .fadeIn(1000);
                                $("#mydiv").html(data);
                                var objWH=getObjWh('mydiv');
                                var tbT=objWH.split("|")[0]+"px";
                                var tbL=objWH.split("|")[1]+"px";
                                $("#mydiv").css({"top":tbT,"left":tbL,"z-index":"9999","display":"block"})
                            }
                            })
                    }
                   function fankui()
                    {
                    
                     var name =$("#ttname").val();
                     var phone =$("#ttphone").val();
                     var note =$("#ttnote").val();
                     $.ajax({
                        type:"get",
                        url:"server/fankui.ashx",
                      data:"cityid="+1+"&id="+timuId[index-1]+"&n="+escape(name)+"&p="+phone+"&nt="+escape(note),
                        success:function(data)
                        {
                            if(data == "ok")
                            {
                                alert('�ύ�ɹ�����л���֧��!');
                                $("#mark").hide();
                                 jianpan = true;
                            }
                            else
                            {
                             alert('�ύ����������һ��!');
                              jianpan = true;
                             return false;
                             }
                        }
                        })
                    }
                    //���ض�ӦID����Ŀ
                    //index ��ǰ�ڼ���
                    var req;
                    function jiazaitimu(i)
                    {   
                        var dnow = new Date(); 

                        index = i;

                        $("#timu").html("<img src=\"../images/20080320132844619.gif\" />��Ŀ���ڼ����У����Եȣ�");

//                        for(var m=1;m<=100;m++)

//                        {   

//                            if($("#td"+m).css("background")!="#6acdf2"||$("#td"+m).css("background")!="none repeat scroll 0 0 #6ACDF2")

//                            {//��û������ĳ�ʼ����Ϊ��ɫ      

//                                $("#td"+m).css("background","#fff");//

//                            }

//                        } 

                        if(yhdaan[index-1]!="")

                        {

                            $("#spyhdaan").html(yhdaan[index-1]);//��ǰ�û���

                        }

                        else

                        {

                            $("#spyhdaan").html("");//��û����

                            //$("#td"+i).css("background","#FF7E00");//��ǰ��Ŀ

                        }                     

                        $("#spwdt").html((<%=pageModel.getTotalRecords()%>-totalright-totalwrong)+"��δ��");//δ����Ŀ
                        
						 if(timuId[index-1] == undefined){
							index = total;
						}
                        var uri = "../server/lianxi.jsp?id=" + timuId[index-1];
                        var obj = document.getElementById("examimage");//�����ĿͼƬ��ʾ��id
                        obj.src = "../images/upload_images/" + "<%=examtime.getP_id() %>" + index + ".jpg";

                        if(window.XMLHttpRequest){
							req = new XMLHttpRequest();
                        }else if (window.ActiveXObject){
							req = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        req.open("get", uri, false);
                        req.onreadystatechange = callback;
                        req.send(null);

                        if(req.readyState == 4){
							if(req.status == 200) {
                       			 var str = req.responseText.split("-");
                        		 var msg = str[0];
                      			 var type = str[1];
                      			if(type == 1 || type == 0) {
                     				 var tmp1 = document.getElementById("span_blank");
                     				 var tmp2 = document.getElementById("spyhdaan");
                     				 tmp1.style.display='none';
                     				 tmp2.style.display='block';
                     			 }else {
                     				 var tmp1 = document.getElementById("span_blank");
                     				 var tmp2 = document.getElementById("spyhdaan");
                    				 tmp1.style.display='block';
                    				 tmp2.style.display='none';
                     			 }
                        	   	 $("#timu").html(msg);//��Ŀ
                        		 panduan = type;//����
                        		 
 							}
                        }
                    }

                    
                    function refresh(){
                    	var obj = document.getElementById("examimage");//�����ĿͼƬ��ʾ��id
                    	var objstudentPhoto = document.getElementById("studentPhoto");//���ѧ��ͷ����ʾ��id
                    	//alert(obj.readyState);
                       if (obj.readyState == "loading") {
				            obj.src = "../images/defaultImage.gif";
				            //alert(obj.src);
				        }
                    	if (objstudentPhoto.readyState == "uninitialized") {
				            objstudentPhoto.src = "../images/exam_photo.jpg";
				            //alert(objstudentPhoto.src);
				        }
                    	//alert(objstudentPhoto.readyState);
                    	//alert(objstudentPhoto.src);
                    }
                    
                    function callback(){
                    	//alert("''''jjjj''");
						if(req.readyState == 4){
							if(req.status == 200) {
								//alert(req.responseText);
								//var type = req.responseXML.getElementsByTagName("msg")[0];
								//var msg = req.responseXML.getElementsByTagName("msg")[1];
								//alert(type);
								//alert(msg);
								//setMsg(type.childNodes[0].nodeValue, msg.childNodes[0].nodeValue);
								//alert(msg.childNodes[0].nodeValue);
							}

						}

                    }

                    function setMsg(type, msg){
						contentdiv = document.getElementById("usermsg");
						answerdiv = document.getElementById("spzhengquedaan");
						if(type == "content"){
							contentdiv.innerHTML = msg;
						}else {
							answerdiv.innerHTML = msg;
							
							if(zidongpancuo)
                            {//�Զ��д�
                                if(yhdaan[index-1] !="")
                                {
                                    if(msg == yhdaan[index-1])
                                    {//��ȷ
                                    	alert(yhdaan[index-1]);
                                        alert(msg);
                                        $("#imgzidongpancuo").html("<img src=\"../images/rw_06.gif\" />");
                                    }
                                    else
                                    {//����
                                    	
                                        $("#imgzidongpancuo").html("<img src=\"../images/rw_03.gif\" />");
                                    }
                                 }
                                 else
                                 {
                                    $("#imgzidongpancuo").html("&nbsp;");
                                 }
                            }
						}

                    }
                    //��ϰʱ��
                    function shijian()
                    {
                        if(miaozhong == 0)
                        {
                            qrtijiao();
                            return false;
                        }
                        miaozhong--;
                        $("#spsyshijian").html(""+parseInt(miaozhong/60)+":" + miaozhong %60);
                        $("#spsyshijian1").html(""+parseInt(miaozhong/60)+":" + miaozhong %60);
                    }

                    //����ղ� s=0 ���⣬s=1�ղ���
                    function shouchang(s)
                    {
                        $.ajax({
                        type:"get",
                        url:"server/cuoti.ashx",
                        data:"city="+1+"&uid="+-1+"&id="+timuId[index-1]+"&t="+s,
                        success:function(data)
                        {
                            if(s=="1")
                            alert('�ղسɹ�!');
                        }
                        })
                    }
                   //������ȷ��
                   function  xianshizhengquedaan()
                   {
                        if($("#ckbzhengquedaan").attr("checked") == true)
                        {//����ѡ�� ��ʾ��ȷ��
                            zhengquedaan = true;
                            $("#spzhengquedaan").css("display","block");
                        }
                        else
                        {//���ش�
                            zhengquedaan = false;
                            $("#spzhengquedaan").css("display","none");
                        }
                        chadaan();//��ѯ��
                   }
                   //�����������
                   function xianshidantiqingkuang()
                   {
                        if($("#ckbdatiqingkuang").attr("checked") == true)
                        {//����ѡ�� ��ʾ
                            datiqingkuang = true;
                            $("#spdatiqingkuang").css("display","block");
                            $("#spdatiqingkuang").html("��"+total+"�⣬��ȷ"+totalright+"�⣬����"+totalwrong+"��");
                        }
                        else
                        {//����
                            datiqingkuang = false;
                            $("#spdatiqingkuang").css("display","none");
                        }    
                   }
                   //�Զ��д�
                   function fzidongpancuo()
                   {
                        if($("#ckbzidongpancuo").attr("checked") == true)
                        {//��ʾ
                            zidongpancuo = true;
                            zidongqianjin = false;//�����Զ�ǰ��Ϊfalse;
                            $("#ckbzidongqianjin").attr("checked",false);
                            $("#imgzidongpancuo").html("");
                             chapancuo();
                        }
                        else
                        {
                            zidongpancuo = false;
                            $("#imgzidongpancuo").html("");
                        }
                   }
                   //�Զ�ǰ��
                   function fzidongqianjin()
                   {
                        if($("#ckbzidongqianjin").attr("checked") == true)
                        {//�Զ�ǰ��
                            zidongpancuo = false;//�����Զ��д�Ϊfalse;
                            $("#ckbzidongpancuo").attr("checked",false);
                            zidongqianjin = true;
                        }
                        else
                        {
                            zidongqianjin = false;
                        }
                   }
                   //���� v �û���
                   function zuoda(v)
                   {
                	   //alert("ִ�е�zuoda�����ˣ�");
                	   //alert(v);
                        if(zhengquedaan)
                        {
                          chadaan();//������ȷ��
                        }

                       fdatiqingkuang(v);//�������            
                        yhdaan[index-1] = v;//��ֵ�û���
                        $("#spyhdaan").html(yhdaan[index-1]);//��ʾ�û���
                          if(zidongpancuo)
                        {
                            chapancuo();//�Զ��д�
                        } 
                        if(index == total)
                        {
                             tijiao = true;
                             $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                            .width($(window).width())
                            .height($(window).height())
                            .fadeIn(1000);
                            var objWH=getObjWh('mydiv');
                            var tbT=objWH.split("|")[0]+"px";
                            var tbL=objWH.split("|")[1]+"px"
                            $("#mydiv").css({"top":200,"left":230,"z-index":"9999","display":"block"})
                            .html("<div class=\"jjts\"><b>�� ʾ</b><p class=\"hand\">�Ѿ������һ�⣬��Ҫ�ύ������ϰ��<br/>�����ȷ�ϡ�������ʾ��ϰ�ɼ���<br/>��������ء������رձ����ڡ�</p><div class=\"tjan mz\"><a href=\"javascript:qrtijiao()\">ȷ��</a><a href=\"javascript:closeObj()\">����</a></div></div>");    
                            return false;
                        }            
                        if(zidongqianjin)
                        {//�Զ�������һ��  
                            index ++;
                            jiazaitimu(index);
                        }               
                      
                   }

                   //������� v �û���
                  function fdatiqingkuang(v)
                   {
                	   var uri = "../server/daan.jsp?id=" + timuId[index-1] + "&answer=" +v + "&miaozhong=" + miaozhong + "&yhdaan=" + yhdaan;
                       if(window.XMLHttpRequest){
							req = new XMLHttpRequest();
                       }else if (window.ActiveXObject){
							req = new ActiveXObject("Microsoft.XMLHTTP");
                       }
                       req.open("get", uri, false);
                       req.onreadystatechange = callback;
                       req.send(null);
                       //alert(req.responseText);
                       var msg = req.responseXML.getElementsByTagName("msg")[1];
                       var msg = msg.childNodes[0].nodeValue
                       //alert(msg);
                       if(msg == 1)
                       {//��ȷ
                           zqdaan[index-1] = 1;
                           cwdaan[index-1] = 0;
                       }
                       else
                       {//����                                
                           cwdaan[index-1] = 1;
                           zqdaan[index-1] = 0;
                           if(-1 != -1)
                           {
                               shouchang('0');
                           }
                       }
                   
	                   var rightnum = 0;
	                   var wrongnum = 0;
	                   for(var j=0;j<zqdaan.length;j++)
	                   {
	                        rightnum += Number(zqdaan[j]);
	                   }
	                   for(var k=0;k<cwdaan.length;k++)
	                   {
	                       wrongnum += Number(cwdaan[k]);
	                   }
	                   $("#spdatiqingkuang").html("��"+total+"�⣬��ȷ"+rightnum+"�⣬����"+wrongnum+"��");
	                   totalright = rightnum;
	                   totalwrong = wrongnum;
	                   $("#spwdt").html((<%=pageModel.getTotalRecords()%>-totalright-totalwrong)+"��δ��");//δ����Ŀ
                       $("#td"+index).css("background","#6ACDF2");//�Ѵ���Ŀ
                       $("#spyhdaan").html(yhdaan[index-1]);//��ʾ�û���
              
                   }
                   //�Զ��д�
                   function chapancuo()
                   {     
                	   var uri = "../server/daan.jsp?id=" + timuId[index-1];
                       if(window.XMLHttpRequest){
							req = new XMLHttpRequest();
                       }else if (window.ActiveXObject){
							req = new ActiveXObject("Microsoft.XMLHTTP");
                       }
                       req.open("get", uri, false);
                       req.onreadystatechange = callback;
                       req.send(null);
                       alert(req.responseText);
                   }
                   //��ѯ��ȷ��
                   function chadaan()
                   {                          
                	   var uri = "../server/daan.jsp?id=" + timuId[index-1];
                       if(window.XMLHttpRequest){
							req = new XMLHttpRequest();
                       }else if (window.ActiveXObject){
							req = new ActiveXObject("Microsoft.XMLHTTP");
                       }
                       req.open("get", uri, false);
                       req.onreadystatechange = callback;
                       req.send(null);
                   }             
                   
                   function kaoshi()
                   { 
                        closeObj();//�ر����ֲ�
                        t = setInterval("shijian()",1000);
                        start = true;
                            //$("#td1").css("background","#FF7E00");//��ǰ����ʽ
                            $("#btishi").html("<b>�ж���</b><span>����<font>��/��</font>��������</span><b>ѡ����</b><span>����<font>A/B/C/D</font>��������</span><span>����<font>�Ϸ�</font>�����鿴��һ��</span><span>����<font>�·�</font>����������һ��</span>");
                        
                   }
                   //С����
                    ie4 = (document.all) ? true : false;
                    function keyDown(e){      
                        if(ie4)
                        {
                             keynum=event.keyCode;
                        }
                        else
                        {
                             keynum=e.which;
                        }
                        if(keynum == 96 || keynum == 45) 
                        {//��ʼ����
                         //����ʱ��
                            if(!start)
                            {
                                     if(jianpan ==  true)
                                    {
                                       ksdt();
                                    }
                                
                            }
                        }
                        if(!start)
                        {//û�е㿪ʼ����
                             if(keynum ==96 || keynum==45)
                            {
                           
                            } else{alert('��ϰ��û��ʼ��������ʼ��ϰ!');}
                        }
                        else
                        {   
                        if(jianpan ==  true)
                          {
                            if(keynum == 144)
                            {//��һ��
                                
                                if(index!=1)
                                {//��ǰ���ǵ�һ��
                                    index--;
                                    jiazaitimu(index);
                                }
                            }
                            else if(keynum == 111 || keynum == 13)
                            {//��һ��
                                if(index !=total)
                                {//��ǰ�������һ��
                                    index ++ ;
                                    jiazaitimu(index);
                                }else
                                {
                                     tijiao = true;
                                     $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                                    .width($(window).width())
                                    .height($(window).height())
                                    .fadeIn(1000);
                                    var objWH=getObjWh('mydiv');
                                    var tbT=objWH.split("|")[0]+"px";
                                    var tbL=objWH.split("|")[1]+"px"
                                    $("#mydiv").css({"top":200,"left":230,"z-index":"9999","display":"block"})
                                    .html("<div class=\"jjts\"><b>�� ʾ</b><p class=\"hand\">�Ѿ������һ�⣬��Ҫ�ύ������ϰ��<br/>�����ȷ�ϡ�������ʾ��ϰ�ɼ���<br/>��������ء������رձ����ڡ�</p><div class=\"tjan mz\"><a href=\"javascript:qrtijiao()\">ȷ��</a><a href=\"javascript:closeObj()\">����</a></div></div>");    
                                    return false;
                                }
                            }
                           else if(keynum == 99 || keynum == 34)
                            {//���һ��
                                index = total;
                                jiazaitimu(index);
                            }
                            else if(keynum == 97 || keynum == 35)
                            {//��һ��
                                index = 1;
                                jiazaitimu(index);
                            }
                            else if(keynum ==98 || keynum == 40)
                            {//�ղ�
                                       if(-1!=-1)
                                {
                                shouchang('1');
                                }else
                                {
                                    alert('���¼�����!');
                                    return false;
                                }
                            }
                            else if(keynum == 101 || keynum ==12)
                            {//��
                                if(panduan == 0)
                                {//�ж���
                                    zuoda('A');
                                }
                            }
                            else if(keynum == 102 || keynum == 39)
                            {//��
                                if(panduan == 0)
                                {//�ж���
                                    zuoda('B');
                                }
                            }
                            else if(keynum == 103 || keynum == 36)
                            {//A
                                if(panduan == 1)
                                {
                                    zuoda('A');
                                }
                            }
                            else if(keynum == 104 || keynum == 38)
                            {//B
                                if(panduan == 1)
                                {
                                    zuoda('B');
                                }
                            }
                            else if(keynum == 105 || keynum == 33)
                            {//C
                                if(panduan == 1)
                                {
                                    zuoda('C');
                                }
                            }
                            else if(keynum == 100 || keynum == 37)
                            {//D
                                if(panduan == 1)
                                {
                                    zuoda('D');
                                }
                            }
                            else if(keynum == 109)
                            {//�ύ
                                ftijiao();
                            }else if(keynum ==110 || keynum == 46)
                            {
                                chongxinkaishi();
                            }
                            else if(keynum == 106)
                            {//��������
                               closeObj();
                            }
                            else if(keynum == 107)
                            {//ȷ���ύ
                                if(tijiao)
                                {//��ȷ��
                                    qrtijiao();
                                }
                                else
                                {
                                    ftijiao();
                                }
                            }
                            
                            }
                        }
                    }
                    document.onkeydown = keyDown;
                    //document.onkeypress  = keyDown;
                    //�رգ���������
                    function closeObj()
                    {     
                          tijiao  = false;               
                           jianpan = true;  
                          $("#mydiv").css("display","none"); 
                          $("#mark").css("display","none");
                    }
                    //������ϰ
                    function fjieshu()
                    {
                        t = clearInterval(t);
                        tijiao  = false;                 
                        $("#mydiv").css("display","none"); 
                        $("#mark").css("display","none");
                        location="../index.jsp"
                    }
                    //�ύ

                    function ftijiao()
                    {
                         tijiao = true;
                         $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                        .width($(window).width())
                        .height($(window).height())
                        .fadeIn(1000);
                        var objWH=getObjWh('mydiv');
                        var tbT=objWH.split("|")[0]+"px";
                        var tbL=objWH.split("|")[1]+"px"
                        $("#mydiv").css({"top":120,"left":170,"z-index":"9999","display":"block"})
                        .html("<div class=\"jjts\"><b>�� ʾ</b><p class=\"hand\"><br/>�����ȷ�ϡ������ύ��ϰ�ɼ�����ϰ������<br/>��������ء������رձ����ڼ�����ϰ��</p><div class=\"tjan mz\"><a href=\"javascript:qrtijiao();\">ȷ��</a><a href=\"javascript:closeObj()\" onclick=\"closeObj()\">����</a></div></div>");
                        //alert("11111111");
                    }
                    //ȷ���ύ
                    function qrtijiao()
                    {  if(!tijiao)
                        {
                            ftijiao();
                        }
                        else{
                        t = clearInterval(t);
                        $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                        .width($(window).width())
                        .height($(window).height())
                        .fadeIn(1000);
                        var objWH=getObjWh('mydiv');
                        var tbT=objWH.split("|")[0]+"px";
                        var tbL=objWH.split("|")[1]+"px"
                        $("#mydiv").css({"top":200,"left":230,"z-index":"9999","display":"block"})
                        .html("<div class=\"jjts\"><b>���Խ���</b><div class=\"end\"><i><img src=\"../images/icon_03.gif\" /></i><i><span class=\"ysjg\">����ʱ��"+parseInt((45*60-miaozhong)/60)+":"+(45*60-miaozhong)%60+"</span><span>��ѯ�ɼ�����ϵ����ο���ʦ<font class=\"hong\"></font></span></i></div><div class=\"end2\"></div><div class=\"tjan mz2\"><a href=\"javascript:fjieshu();\">�� ��</a></div></div>"); 
                        //��¼���Գɼ�
                       // data:"uid="+-1+"&fs="+totalright+"&d="+d,
                       <%System.out.println(login.getId().toString());%>
                        var uri = "../server/fenshu1.jsp?id=" + <%="'" + login.getId() + "'" %> + "&score=" + totalright;
                       	//alert(uri);
                        if(window.XMLHttpRequest){
							req = new XMLHttpRequest();
                        }else if (window.ActiveXObject){
							req = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        req.open("get", uri, false);
                        req.onreadystatechange = callback;
                        req.send(null);
                        }
              			//alert("���ȥfenshu.jspҳ��");
                    }
                    //���¿�ʼ
                    function chongxinkaishi()
                    {
                         $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                        .width($(window).width())
                        .height($(window).height())
                        .fadeIn(1000);
                        var objWH=getObjWh('mydiv');
                        var tbT=objWH.split("|")[0]+"px";
                        var tbL=objWH.split("|")[1]+"px"
                        $("#mydiv").css({"top":200,"left":230,"z-index":"9999","display":"block"})
                        .html("<div class=\"jjts\"><b>��ʾ</b><p class=\"hand\">����ʣ��ʱ�䣺<span id=\"spsyshijian1\">45:00</span><br/>�����ȷ���ύ���������¿��ԡ�<br/>������������ԡ������رձ����ڼ������ԡ�</p><div class=\"tjan mz\"><a href=\"javascript:ftijiao();\">ȷ���ύ</a><a href=\"javascript:closeObj()\" onclick=\"closeObj()\">��������</a></div></div>");    
                    
               
                    }//���¿�ʼ
                    function chongxingkaishi1()
                    {       
                        totalright = 0;
                        totalwrong =0;
                        $("#spwdt").html((<%=pageModel.getTotalRecords()%>-totalright-totalwrong)+"��δ��");//δ����Ŀ
                         miaozhong = 45*60;
                        index =1;
                        t = clearInterval(t);
                        jiazaitimu(1);
                        for(var i =0;i<total + 1;i++)
                        {
                            yhdaan[i] ="";//��ʼ��
                            zqdaan[i]="";
                            cwdaan[i]="";
                             $("#td"+i).css("background","#fff");//
                        }    
                         $("#spyhdaan").html("");//��û����t
                        t = setInterval("shijian()",1000);
                        closeObj();//�ر����ֲ�
                    }
                    //���� top,left
                    function getObjWh(obj){
                    var st=document.documentElement.scrollTop;//�������ඥ���ľ���
                    var sl=document.documentElement.scrollLeft;//����������ߵľ���
                    var ch=document.documentElement.clientHeight;//��Ļ�ĸ߶�
                    var cw=document.documentElement.clientWidth;//��Ļ�Ŀ��
                    var objH=253;//��������ĸ߶�
                    var objW=535;//��������Ŀ��
                    var objT=Number(st)+(Number(ch)-Number(objH))/2;
                    var objL=Number(sl)+(Number(cw)-Number(objW))/2;
                    return objT+"|"+objL;
                    }
                      //��һ��
                    function shangyiti()
                    {
                        if(!start)
                        {//û�е㿪ʼ����
                            alert('��ϰ��û��ʼ��������ʼ��ϰ!');
                            return false;
                        }
                        if(index!=1)
                        {//��ǰ���ǵ�һ��
                            index--;
                            jiazaitimu(index);
                        }
                    }
                    //��һ��
                    function xiayiti()
                    {if(!start)
                        {//û�е㿪ʼ����
                            alert('��ϰ��û��ʼ��������ʼ��ϰ!');
                              return false;
                        }
                       if(index !=total)
                        {//��ǰ�������һ��
                            index ++ ;
                            jiazaitimu(index);
                        }else
                                {
                                     tijiao = true;
                                     $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                                    .width($(window).width())
                                    .height($(window).height())
                                    .fadeIn(1000);
                                    var objWH=getObjWh('mydiv');
                                    var tbT=objWH.split("|")[0]+"px";
                                    var tbL=objWH.split("|")[1]+"px"
                                    $("#mydiv").css({"top":200,"left":230,"z-index":"9999","display":"block"})
                                    .html("<div class=\"jjts\"><b>�� ʾ</b><p class=\"hand\">�Ѿ������һ�⣬��Ҫ�ύ������ϰ��<br/>�����ȷ�ϡ�������ʾ��ϰ�ɼ���<br/>��������ء������رձ����ڡ�</p><div class=\"tjan mz\"><a href=\"javascript:qrtijiao()\">ȷ��</a><a href=\"javascript:closeObj()\">����</a></div></div>");    
                                    return false;
                                }
                    }
                    //���һ��
                    function zuihoutiyi()
                    {   if(!start)
                        {//û�е㿪ʼ����
                            alert('��ϰ��û��ʼ��������ʼ��ϰ!');
                              return false;
                        }
                       index = total;
                       jiazaitimu(index);
                   }
                   //��һ�� 
                   function diyiti()
                   {   if(!start)
                        {//û�е㿪ʼ����
                            alert('��ϰ��û��ʼ��������ʼ��ϰ!');
                              return false;
                        }
                      index = 1;
                      jiazaitimu(index);
                   }
                   //�ж���
                   function pdti(xx)
                   {    if(!start)
                        {//û�е㿪ʼ����
                            alert('��ϰ��û��ʼ��������ʼ��ϰ!');
                              return false;
                        }
                        if(panduan == 0)
                        {//�ж���
                            zuoda(xx);
                        }
                   }
                   //ѡ����
                   function xxti(xx)
                   {    
                       if(!start)
                        {//û�е㿪ʼ����
                            alert('��ϰ��û��ʼ��������ʼ��ϰ!');
                              return false;
                        }
//                        if(panduan == "false")
//                        {//�ж���
//                            zuoda(xx);
//                        }

                        if(panduan == 0 && (xx=="A" || xx=="B") )
                        {//�ж���
                            zuoda(xx);
                        }
                         if(panduan == 1 && (xx=="A" || xx=="B" || xx=="C" || xx=="D") )
                        {//ѡ����
                            zuoda(xx);
                        }
                         if(panduan == 2  )
                        {//ѡ����
                            zuoda(xx);
                        }
                   }
                   //��ʼ����
                   function ksdt()
                   { 
                        if(!start)
                        {
                                $("#mark").css({"opacity":"0.15","display":"block","position": "absolute","background-color":"#000","z-index":"999","left":"0","top":"0","-moz-opacity":"0.15"})
                                .width($(window).width())
                                .height($(window).height())
                                .fadeIn(1000);
                                var objWH=getObjWh('mydiv');
                                var tbT=objWH.split("|")[0]+"px";
                                var tbL=objWH.split("|")[1]+"px"
                                $("#mydiv").css({"top":200,"230":tbL,"z-index":"9999","display":"block"})
                                .html("<div class=\"jjts\"><b>�� ʾ</b><p class=\"hand\">׼����ʼ��ϰ<br/>�����ȷ�ϡ�������ʼ��ϰ��<br/>��������ء������رձ����ڡ�</p><div class=\"tjan mz\"><a href=\"javascript:kaoshi()\">ȷ��</a><a href=\"javascript:closeObj()\">����</a></div></div>");  
							
                           
                        }
                   }
        </script>

<div id="mydiv">
    </div>
	  </div>
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

</form>
<%}
	else{
		response.sendRedirect("../index.jsp");
	}
%>

</body>
<!-- InstanceEnd --></html>
