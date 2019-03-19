package com.board;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class BoardLogic {
	BoardDao Bo_dao = new BoardDao();
	Logger logger =Logger.getLogger(BoardLogic.class);
	public void BoardIns(Map<String,Object> pMap){
		logger.info("logic호출");
		Bo_dao.BoardIns(pMap);
		
	}
	public List<Map<String,Object>> BoardSel(Map<String,Object> pMap){
		List<Map<String,Object>> BoardList =null;
		logger.info("logic호출");
		BoardList=Bo_dao.BoardSel(pMap);
		
		return BoardList;
	}
	public void BoardUpd(Map<String, Object> pMap) {
		logger.info("logic호출");
		Bo_dao.BoardUpd(pMap);
		
	}
	
}
