package com.meetRoom;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.HashMapBinder;

public class MeetRoomController implements Controller {
	Logger logger = Logger.getLogger(MeetRoomController.class);
	MeetRoomLogic mtRoom_logic = new MeetRoomLogic();
	
	
	String crud;
	String path;
	

	/*public MeetRoomController(String work, String requestName, String crud) {
		this.work = work;
		this.requestName = requestName;
		this.crud = crud;
	}*/
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		crud = req.getParameter("crud");
		logger.info("crud==>"+crud);
		if("ins".equals(crud)) {
		
			logger.info(req.getParameter("mr_image"));
			logger.info(req.getParameter("mr_name"));
			logger.info(req.getParameter("mr_loc"));
			logger.info("회의실 입력 호출");
			int result=0;
			Map<String,Object> pMap = new HashMap<String,Object>();
			HashMapBinder binder = new HashMapBinder(req);
			binder.bind(pMap);
			
			result = mtRoom_logic.meetRoomIns(pMap);
			if(result==1) {//1이면 등록성공 
				this.path="redirect:./mtRoomSuccess.jsp";
			}else if(result ==0) {//0이면 등록 실패
				this.path="redirect:./mtRoomFail.jsp";
			}
		/*	mtRoom_logic.meetRoomIns(pMap);
			path="redirect:./meetRoom.for?crud=sel";*/
		}
		logger.info("path:"+path);
		return path;
		
	}
	
}
