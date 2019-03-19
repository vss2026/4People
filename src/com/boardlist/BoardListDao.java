package com.boardlist;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardListDao {
	SqlSessionFactory  sqlMap = null;
	//
	SqlSession session = null;
	public void BdlistIns(Map<String, Object> pMap) {
		try {
			String resource = "com/mybatis/Configuration.xml";
			Reader reader =null;
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession(); 
			session.insert("BoardListIns", pMap);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
