<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.mongodb.BasicDBObject" %>
<%@ page import="com.mongodb.DB" %>
<%@ page import="com.mongodb.DBCollection" %>
<%@ page import="com.ems.fe.util.MongoDBConnectionManager" %>
<%
		
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