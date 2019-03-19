package com.board;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;



public class BoardDao {
	SqlSessionFactory  sqlMap = null;
	//
	SqlSession session = null;
	Logger logger = Logger.getLogger(BoardDao.class);
	public void BoardIns(Map<String, Object> pMap) {
		try {
			String resource = "com/mybatis/Configuration.xml";
			Reader reader =null;
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession(); 
			session.insert("BoardIns", pMap);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Map<String,Object>> BoardSel(Map<String, Object> pMap) {
		List<Map<String,Object>> BoardList = null;
		try {
			String resource = "com/mybatis/Configuration.xml";
			Reader reader =null;
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession(); 
			BoardList = session.selectList("BoardSel",pMap);
			logger.info("BoardList:"+BoardList);
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		return BoardList;
	}
	public void BoardUpd(Map<String, Object> pMap) {
		try {
			String resource = "com/mybatis/Configuration.xml";
			Reader reader =null;
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession(); 
			session.update("BoardUpd", pMap);
			logger.info("성공?");
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

}
