package com.ems.fe.test;

import com.ems.fe.basedata.dao.impl.AdminDao4MongoDBImpl;
import com.ems.fe.util.MongoDBConnectionManager;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;

public class MongoFindTest {
	public static void main(String[] args) {
		AdminDao4MongoDBImpl a = new AdminDao4MongoDBImpl();
		
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
		a.findAdminById("bll");
	}
}
