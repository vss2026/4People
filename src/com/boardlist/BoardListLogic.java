package com.boardlist;

import java.util.Map;

import org.apache.log4j.Logger;

import com.board.BoardDao;
import com.board.BoardLogic;

public class BoardListLogic {
	Logger logger =Logger.getLogger(BoardLogic.class);
	BoardListDao Bdlist_dao = new BoardListDao();
	public void BdlistIns(Map<String, Object> pMap) {
		Bdlist_dao.BdlistIns(pMap);
	}

}
