<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.mongodb.BasicDBObject" %>
<%@ page import="com.mongodb.DB" %>
<%@ page import="com.mongodb.DBCollection" %>
<%@ page import="com.ems.fe.util.MongoDBConnectionManager" %>
<%
		System.out.println("#########################");
		System.out.println(System.getenv("VCAP_SERVICES"));
		DB db = MongoDBConnectionManager.getDB();
		DBCollection coll = db.getCollection("administrator");
		BasicDBObject doc = new BasicDBObject("a_id", "bll").
                append("a_password", "111111").
                append("a_name", "²·ÁæÀþ").
                append("a_sex", "Å®").
                append("a_age", "20").
                append("a_phone", "18201225770").
                append("a_email", "chenyunzhan08@126.com");

		coll.insert(doc);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>