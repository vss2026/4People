package com.include;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.MyBatisCommonFactory;

public class IncludeDao {
	SqlSessionFactory SqlSessionFactory=null;
	SqlSession session = null;
	Logger logger = Logger.getLogger(IncludeDao.class);
	public List<Map<String, Object>> sideTeamList(Map<String, Object> pMap) {
		logger.info("IncludeDao호출");
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		logger.info(SqlSessionFactory);
		List<Map<String,Object>> sideTeamList = new ArrayList<Map<String,Object>>();
		session = SqlSessionFactory.openSession();
		sideTeamList=session.selectList("sideTeamList",pMap);
		
		
		return sideTeamList;
	}

}
