package com.forpeople;

import org.apache.log4j.Logger;

import com.board.BoardController;
import com.boardlist.BoardListController;
import com.login.LoginController;
import com.note.NoteController;
import com.team.TeamController;



public class ControllerMapper {
	static Logger logger = Logger.getLogger(ControllerMapper.class);
	public static Controller getController(String command) {
		Controller  controller = null;
		String commands[] = command.split("/");
		
		for(String str:commands) {
			logger.info("commands:"+str);
		}
		if(commands.length==2) {
			String category = commands[0];
			String crud = commands[1];
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
			
		}
		return controller;
	}
}
