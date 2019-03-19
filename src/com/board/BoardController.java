package com.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.HashMapBinder;

public class BoardController implements Controller {
	BoardLogic Bo_logic = new BoardLogic();
	String crud =null;
	Logger logger =  Logger.getLogger(BoardController.class);
	
	//나도추가
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path=null;
		crud = req.getParameter("crud");
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder binder = new HashMapBinder(req);
		binder.bind(pMap);
		if("ins".equals(crud)) {
			Bo_logic.BoardIns(pMap);
			path ="redirect:./board.for?crud=sel";
		}
		else if("sel".equals(crud)){
			logger.info(pMap.size());
			for(String key:pMap.keySet()) {
				logger.info("key="+key);
				logger.info(pMap.get(key));
			}
			
			List<Map<String,Object>> BoardList=Bo_logic.BoardSel(pMap);
			req.setAttribute("BoardList", BoardList);
			path ="forward:./board.jsp";
			
		}
		else if("upd".equals(crud)) {
			Bo_logic.BoardUpd(pMap);
			path ="redirect:./board.for?crud=sel";
		}
		return path;
	}

}
