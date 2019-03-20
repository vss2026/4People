package com.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.HashMapBinder;

public class TeamController implements Controller {
	TeamLogic t_logic = new TeamLogic();
	String command = null;
	Logger logger=  Logger.getLogger(TeamController.class);
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path=null;
		HttpSession session = req.getSession(true);
		command = req.getParameter("command");
		
		if(command!=null) {
			if("board".equals(command)) {
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.bind(pMap);
				logger.info("TeamController board 호출");
				pMap.put("mem_id",session.getAttribute("mem_id"));
	
					
				
				List<Map<String,Object>> boardList=t_logic.getBoards(pMap);
				logger.info("boardList.size"+boardList.size());
				req.setAttribute("team",boardList);
				req.setAttribute("gubun","board");
				path="forward:./teamLoading.jsp";
				for(Map<String,Object> rMap:boardList) {
					for(String key:rMap.keySet()) {
						logger.info(key+" rMap:"+rMap.get(key));
						
					}
				}
			}
			//member정보
			else if("member".equals(command)) {
				logger.info("TeamController member 호출");
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.ajaxBind(pMap);
				pMap.put("p_code",String.valueOf(1));
				for(String key:pMap.keySet()) {
					logger.info(key+" pMap:"+pMap.get(key));
					//회원검색을 햇을때 파라미터값으로 mem_name이 넘어온다 그떄 url주소를  ./teamMemberResult.jsp 로 설정해줌
					if(pMap.containsKey("mem_name")) {
						String mem_name = (String)pMap.get("mem_name");
						path="forward:./teamMemberResult.jsp";
					}
					//회원검색을 하지않앗을떄(일반요청)
					else {
						
						path="forward:./teamLoading.jsp";
						//member로 구분
						req.setAttribute("gubun","member");
					}
				}
				List<Map<String,Object>> memberList=t_logic.getMember(pMap);
				logger.info("boardList.size"+memberList.size());
				req.setAttribute("team",memberList);
				
				for(Map<String,Object> rMap:memberList) {
					for(String key:rMap.keySet()) {
						logger.info(key+" rMap:"+rMap.get(key));
						
					}
				}
			}
			//친구초대 검색시||친구초대시
			else if("invite".equals(command)) {
				
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.ajaxBind(pMap);
				pMap.put("p_code",String.valueOf(1));
				for(String key:pMap.keySet()) {
					logger.info(key+" pMap:"+pMap.get(key));
				}
				//초대 버튼을 눌럿을떄.
				if(pMap.containsKey("inviteMember")) {
					logger.info("TeamController inviteMember 호출");
					pMap.put("p_role","미정");
					t_logic.inviteMember(pMap);
					
					path="forward:./inviteResult.jsp";
				}
				//초대하기위해 검색을했을떄.
				else {
					logger.info("TeamController inviteList 호출");
					Map<String,Object> rMap=t_logic.getInvite(pMap);
					logger.info("boardList.size"+rMap.size());
					
						for(String key:rMap.keySet()) {
							logger.info(key+" rMap:"+rMap.get(key));
							
						}
					
					req.setAttribute("inviteList",rMap);
					path="forward:./inviteMemberResult.jsp";
				}
				
			}
		}
		logger.info("path:"+path);
		return path;
	}

}
