package com.card;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.HashMapBinder;

public class CardController implements Controller {
	Logger logger = Logger.getLogger(CardController.class);
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path=null;
		String crud = req.getParameter("crud");
		String mem_id = req.getParameter("mem_id");
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder binder = new HashMapBinder(req);
		binder.bind(pMap);
		logger.info("cardcontroller출");
		if("sel".equals(crud)) {
			logger.info("sel");
			path ="redirect:../card/card.jsp";
		}
	
		return path;
	}
}
