<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<%@ page import="com.fe.ems.*" %>

<jsp:useBean id="register" class="com.fe.ems.manager.RegisterManager" scope="session"/>
<jsp:setProperty name="register" property="*" />

<%
	if(register.getId() != null && !register.getId().equals("")){
		register.registerManager();
		register.setId("");
		register.setS_name("");
		register.setS_password("");
		register.setS_sex("");
		register.setS_classes("");
	}
	else{
		register.setBackNews("");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="../css/register.css">
<script type="text/javascript" src="../js/base.js"></script>
<script type="text/javascript" src="../js/select_mode.js"></script>
<title>ע��ҳ��</title>
<style type="text/css">
<!--
.STYLE1 {font-size: 24px}
-->
</style>


<script language="javascript">
<!--	
	//javascriptȥ�ո��� 
	
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
	
	function LTrim(str){ //ȥ���ַ��� ��ͷ�ո�
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
			alert("������ID!");
			document.form.id.focus();
			return false;
		}
		if(warnCharsNotInBag(document.form.id.value)){
			alert("ѧ��ֻ��Ϊ���֣�");
			document.form.id.focus();
			return false;
		}
		if(Trim(document.form.s_name.value) == "") {
			alert("����������!");
			document.form.s_name.focus();
			return false;
		}
		if(Trim(document.form.s_password.value) == "") {
			alert("����������!");
			document.form.s_password.focus();
			return false;
		}
		if(Trim(document.form.s_password1.value) != Trim(document.form.s_password.value)) {
			alert("�������벻ƥ�䣡");
			document.form.s_password.focus();
			return false;
		}
		
		if(Trim(document.form.s_sex.value) == "") {
			alert("��ѡ�������Ա�!");
			document.form.s_sex.focus();
			return false;
		}
		if(Trim(document.form.s_classes.value) != "1") {
			alert("����ѡ�����İ༶��");
			document.form.s_classes.focus();
			return false;
		}
		return true;
		
	}
-->
</script>


</head>
<body>
<br />
<div class="nav">
</div>
<div class="main1">
<form id="fReg" method="post" action="" autocomplete="off" name="form" onsubmit="return check()">
  <input type="hidden" id="url" name="url" value="">
  <input type="hidden" id="product" name="product" value="">
  <input type="hidden" id="refererPdt" name="refererPdt" value="">
  <input type="hidden" id="loginurl" name="loginurl" value="http://reg.163.com/">
            <div align="center" class="STYLE1" style="color:#FF0000"><%=register.getBackNews() %></div>
			<ul class="main_form">
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;����ѧ�ţ�</div>
      <div class="fm_right">
        <table>
          <tbody>
            <tr>
              <td><span class="suggest_box" id="useremail_box">
                <span class="suggest_box" id="useremail_box">
                <input type="text" class="input" name="id" id="email_name_r" value="" autocomplete="off" />
                </span>
                <ul style="display: none; " class="suggest_list">
                  <h6>��ѡ����������...</h6>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                </ul>
                <iframe src="javascript:false" class="iframe"></iframe>
                </span></td>
              <td><span style="display:none" class="right_img" id="email_name_r_right"></span><span style="display:none" id="email_name_r_err"> <span class="err_left"></span> <span class="err_info"> <span class="err_mid"><span class="err_img1"></span><em></em></span></span>
                <div class="clear"></div>
                </span>  </td>
            </tr>
          </tbody>
        </table>
        <div class="f_s_12 clear">
          <div class="f_s_12 c_8A8A8A clear" id="email_name_r_info">����һ�����룬��ͨ����֤���ע�ᡣ��ʽ��09010105</div>
        </div>
      </div>
	  
	  <div class="fm_left"><span class="star"></span>&nbsp;����������</div>
	  
	  <div class="fm_right">
        <input type="text" name="s_name" id="pass_word" class="input" value="">
        <span style="display:none" class="right_img" id="pass_answer_right"></span><span style="display:none" id="pass_answer_err"> <span class="err_left"></span> <span class="err_info"> <span class="err_mid"><span class="err_img1"></span><em></em></span></span>
        <div class="clear"></div>
        </span>
        <div class="f_s_12 c_8A8A8A clear" id="pass_word_info">����д������ʵ�������Ա�֤�����˳ɼ���</div>
      </div>
	  
    </li>
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;�������룺</div>
      <div class="fm_right">
        <input type="password" name="s_password" id="password" class="input" value="">
        <span style="display:none" class="right_img" id="password_right"></span><span style="display:none" id="password_err"> <span class="err_left"></span> <span class="err_info"> <span class="err_mid"><span class="err_img1"></span><em></em></span></span>
        <div class="clear"></div>
        </span>
        <div class="clear"></div>
        <div class="f_s_12 c_8A8A8A clear" id="password_info">6��16���ַ������ִ�Сд��</div>
      </div>
    </li>
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;ȷ�����룺</div>
      <div class="fm_right">
        <input type="password" class="input" name="s_password1" id="re_password" value="">
        <input type="hidden" id="p1" name="p1" value="0">
        <span style="display:none" class="right_img" id="re_password_right"></span><span style="display:none" id="re_password_err"> <span class="err_left"></span> <span class="err_info"> <span class="err_mid"><span class="err_img1"></span><em></em></span></span>
        <div class="clear"></div>
        </span>
        <div class="f_s_12 c_8A8A8A clear" id="re_password_info">�ٴ����������õ����롣</div>
      </div>
    </li>
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;�����ձ�</div>
      <div class="fm_right">
        <div>&nbsp;&nbsp;<input type="radio" name="s_sex" value="��" checked="checked"/>&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="s_sex" value="Ů"/>&nbsp;&nbsp;Ů</div>
        <span style="display:none" class="right_img" id="pass_qa_right"></span><span style="display:none" id="pass_qa_err"> <span class="err_left"></span> <span class="err_info"> <span class="err_mid"><span class="err_img1"></span><em></em></span></span>
        <div class="clear"></div>
        </span>
        
		<div class="f_s_12 c_8A8A8A clear" id="password_info">��ѡ�������Ա�</div>
      </div>
    </li>
   
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;���İ༶��</div>
      <div class="fm_right">
        <!--<div class="s_select f_left" id="s_select" style="z-index: 1002; "><span id="qas">��ѡ��...</span>
          <ul class="s_item" style="display: none; ">
            <li><a href="javascript:void(0);">��ѡ��...</a></li>
			<li><a href="javascript:void(0);">���һ��</a></li>
            <li><a href="javascript:void(0);">�������</a></li>
            <li><a href="javascript:void(0);">�����һ��</a></li>
            <li><a href="javascript:void(0);">���������</a></li>           
            <li><a href="javascript:void(0);">����</a></li>
          </ul>
          <input type="hidden" id="pass_qa" name="question" value="��ѡ��...">
        
		-->
		<select name="s_classes">
			<option value="1" >--��ѡ��--</option>
			<option value="���һ��" >���һ��</option>
			<option value="�������" >�������</option>
			<option value="�����һ��" >�����һ��</option>
			<option value="���������" >���������</option>
			<option value="����" >����</option>
		</select>
		</div>
		
        <span style="display:none" class="right_img" id="pass_qa_right"></span><span style="display:none" id="pass_qa_err"> <span class="err_left"></span> <span class="err_info"> <span class="err_mid"><span class="err_img1"></span><em></em></span></span>
        <div class="clear"></div>
        </span>
        
    </li>
    <script type="text/javascript">

    window.isNotShowRandomImg = false;

</script>
    <li>
      <div class="fm_left"><span class="star"></span>&nbsp;��֤�룺</div>
      <div class="fm_right">
        <input type="text" id="usercheckcode" name="usercheckcode" class="input_verify" value="" />
        <span><img src="../images/getimg..png" name="random_img" width="128" height="40" class="f_left" id="random_img" style="cursor:pointer;" onclick="javascript:changeImg(1)" /></span>
        <input type="hidden" id="u1" name="u1" value="0">
        <input type="hidden" id="codez" name="codez" value="">
        <span style="display:none" class="right_img" id="usercheckcode_right"></span><span style="display:none" id="usercheckcode_err"> <span class="err_left"></span> <span class="err_info"> <span class="err_mid"><span class="err_img1"></span><em></em></span></span>
        <div class="clear"></div>
        </span>
        <div class="f_s_12 c_8A8A8A clear" id="usercheckcode_info">�����ִ�Сд�������������<a id="changeImgHref" class="c_00008A" href="javascript:changeImg(1)">��һ��</a></div>
      </div>
      <input type="hidden" name="syscheckcode" id="syscheckcode" value="44d254473a5209329b6bcdc4bf068b5b31e3d63b">
    </li>
   
    	<li>
      <div class="fm_left">&nbsp;</div>
      <div class="fm_right">
        <input type="checkbox" name="agree" id="agree" checked="checked">
        ��ͬ��<a href="http://reg.163.com/agreement.shtml?v=20110118" target="_blank">���������</a>��<a href="http://reg.163.com/agreement_game.shtml" target="_blank">����˽Ȩ�����͸�����Ϣ�������ߡ�</a> </div>
    </li>
    <li>
      <div class="fm_left">&nbsp;</div>
      <div class="fm_right" style="background:url(../images/icon4.jpg) no-repeat bottom left">
        <input class="button1" id="submit" type="submit" value="">
      </div>
    </li>
  </ul>
</form>
</div>
<div class="main2"></div>
<br />
<br />
<br />
<br />

<script type="text/javascript">
    new Mselect($_id("s_select"));
</script>

</body>
</html>
