package com.forpeople;

import org.apache.log4j.Logger;

import com.board.BoardController;
import com.boardlist.BoardListController;
import com.calendar.CalendarController;
import com.card.CardController;
import com.chatting.ChatController;
import com.include.IncludeController;
import com.login.LoginController;
import com.meetRoom.MeetRoomController;
import com.note.NoteController;
import com.team.TeamController;



public class ControllerMapper {
	static Logger logger = Logger.getLogger(ControllerMapper.class);
	static String crud = null;
	public static Controller getController(String command, String crud) {
		ControllerMapper.crud = crud;//최상위 컨트롤러(Servlet_people)로 부터 받은 crud를 static변수에 저장
		Controller  controller = null; //인터페이스 선언
		String commands[] = command.split("/");//command에 담긴값 => category/xxxx.for
		for(String str:commands) {//단위테스트용
			logger.info("commands:"+str);
		}
		//기능분기
		if(commands.length==2) {
			String category = commands[0];//login|team|board|calendar....
			//crud = commands[1];//sel|ins|del|upd
			logger.info("crud :"+crud);
			//login 폴더요청
			if("login".equals(category)) {
				controller = new LoginController();
			}
			//team 폴더 요청
			else if("team".equals(category)) {
				controller = new TeamController();
			}
			else if("board".equals(category)) {
				controller = new BoardController();
			}
			else if("boardList".equals(category)) {
				controller = new BoardListController();
			}
			
			
			else if("board".equals(category)) {
				controller = new BoardController();
			}
			
			else if("note".equals(category)) {
				controller = new NoteController();
			}
			
			else if("calendar".equals(category)){
				controller = new CalendarController(category, crud);
				
			}else if("meetRoom".equals(category)) {
				controller = new MeetRoomController();
			}
			else if("card".equals(category)) {
				controller = new CardController();
			}
		
			else if("include".equals(category)) {
				controller = new IncludeController(category, crud);
			}
			else if("chatting".equals(category)) {
				controller = new ChatController();
			}
		}
		else if(commands.length==3) {
			String category = commands[1];
			crud = commands[2];
			if("include".equals(category)) {
				logger.info("crud==="+crud);
				logger.info("categort="+category);
				controller = new IncludeController(category, crud);
				
			}
		}
		return controller;
	}
}
