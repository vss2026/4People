package com.meetRoom;

import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.board.BoardDao;
import com.vo.MeetRoomVO;

public class MeetRoomDao {
	SqlSessionFactory  sqlSessionFactory ;
	//
	SqlSession session;
	Logger logger = Logger.getLogger(MeetRoomDao.class);
	
	public int meetRoomIns(Map<String,Object>pMap) throws SQLException {
		int result=0;
		logger.info("Dao호출");
		try {
			String resource ="com/mybatis/Configuration.xml";
			Reader reader = null;
			reader =Resources.getResourceAsReader(resource);
			sqlSessionFactory  = new SqlSessionFactoryBuilder().build(reader);
			 session = sqlSessionFactory.openSession();
			 result=session.selectOne("meetRoomIns",pMap);
			 
			 session.commit();
			 logger.info(pMap.size());
			 logger.info("result:"+result);
			
				 
				 
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		
		return result;
	}

}
