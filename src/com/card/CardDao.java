package com.card;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.include.IncludeDao;
import com.util.MyBatisCommonFactory;

public class CardDao {
	//은수
	SqlSessionFactory SqlSessionFactory=null;
	SqlSession session = null;
	Logger logger = Logger.getLogger(CardDao.class);
	
	public  String commentIns(Map<String, Object> pMap) {
		logger.info("CardDao호출");
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		session = SqlSessionFactory.openSession();
		session.selectList("commentIns",pMap);
		String card_code = "";
//		logger.info("사이즈"+commentNo.size());
		for(Object key:pMap.keySet()) {
			if(key.equals("r_card_code")) {
				card_code = (String)pMap.get(key);
			}
		}
		logger.info("사이즈"+pMap.size());
		
		return card_code;
		
	}
	//은수

}
