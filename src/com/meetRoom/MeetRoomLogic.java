package com.meetRoom;

import java.sql.SQLException;
import java.util.Map;

import org.apache.log4j.Logger;

import com.board.BoardDao;
import com.board.BoardLogic;

public class MeetRoomLogic {
	MeetRoomDao mtRoom_dao = new MeetRoomDao();
	Logger logger =Logger.getLogger(BoardLogic.class);
	public int meetRoomIns(Map<String,Object> pMap){
		int result = 0;
		logger.info("logic호출");
		try {
			
			result=mtRoom_dao.meetRoomIns(pMap);
		} catch (SQLException se) {
			se.getMessage();
		}
		return result;
	}
}
