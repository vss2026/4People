package com.calendar;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.sql.SQLException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import com.util.MyBatisCommonFactory;
import com.vo.CalendarVO;


public class CalendarDao {
	Logger logger = Logger.getLogger(CalendarDao.class);
	private SqlSessionFactory sqlSessionFactory = null;
	public CalendarDao() {
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		logger.info("sqlSessionFactory: "+sqlSessionFactory);
	}
	public List<Map<String, Object>> calList(CalendarVO calVO) throws SQLException{
		logger.info("calList 조회 호출 성공");
		List<Map<String, Object>> calList = new ArrayList<Map<String, Object>>();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		calList = sqlSession.selectList("calList", calVO);
		logger.info("size :"+calList.size());
		return calList;
	}
	public int calIns(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int calUpd(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int calDel(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}

}
