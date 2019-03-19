package com.boardlist;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.board.BoardController;
import com.forpeople.Controller;
import com.util.HashMapBinder;

public class BoardListController implements Controller {
	BoardListLogic Bdlist_logic = new BoardListLogic();
	String crud =null;
	Logger logger =  Logger.getLogger(BoardController.class);
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path=null;
		crud = req.getParameter("crud");
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder binder = new HashMapBinder(req);
		binder.bind(pMap);
		if("ins".equals(crud)) {
			Bdlist_logic.BdlistIns(pMap);
			path ="redirect:./boardList.for?crud=sel";
		}
		return path;
	}

}
