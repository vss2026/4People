package com.forpeople;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import com.util.HangulConversion;

public class Servlet_people extends HttpServlet {
	Logger logger= Logger.getLogger(Servlet_people.class);
	public void doService(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		//요청 URL 분기
		String requestURI = req.getRequestURI();// /dev_jsp/book/getBookList.do
		String contextPath = req.getContextPath();// dev_jsp
		String command = requestURI.substring(contextPath.length()+1);
		
		logger.info(command);
		Controller controller = null;
		String pageMove[]=null;
		
		try {
			controller = ControllerMapper.getController(command);
			String ret =controller.execute(req, res);
			pageMove = ret.split(":");
			logger.info("pageMove:"+pageMove.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(pageMove!=null) {
			String path = pageMove[1];
			if("redirect".equals(pageMove[0])) {
				res.sendRedirect(path);
			}
			else if("forward".equals(pageMove[0])) {
				RequestDispatcher view = req.getRequestDispatcher(path);
				view.forward(req, res);
			}else {
				res.sendRedirect("/error/pageMoveFail.jsp");
			}
		}
		
		
	}
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		doService(req, res);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		doService(req, res);
	}

}
