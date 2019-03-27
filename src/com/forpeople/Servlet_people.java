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
		logger.info(req.getRequestURI());
		String requestURI = req.getRequestURI(); //4People/category/xxxx.for
		String contextPath = req.getContextPath(); //4People
		String command = requestURI.substring(contextPath.length()+1);//category/xxxx.for
		String crud = req.getParameter("crud");//최상위 컨트롤러에서 직접 curd값 받음->controllerMapper에 전달
		logger.info("command : "+command);
		Controller controller = null; //인터페이스 선언
		try {
			controller = ControllerMapper.getController(command, crud); //구현체클래스 정의  : return = 각 Controller 주소(category 분기)
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(controller!=null) {//기능이 정해졌니?
			String pageMove[]=null;	
			try {
				String ret =controller.execute(req, res); //기능담당 컨트롤러에서 화면 주소값 return받음
				pageMove = ret.split(":"); //전송방식 : 화면주소 -> 분기
				logger.info("pageMove:"+pageMove.toString());
				for(int i=0;i<pageMove.length;i++) {
					logger.info("pageMove :"+pageMove[i]); //pageMove[0]=전송방식, pageMove[1]=화면주소
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(pageMove!=null) {
				String path = pageMove[1]; //화면주소
				//전송방식 분기 
				if("redirect".equals(pageMove[0])) { 
					res.sendRedirect(path);
				}
				else if("forward".equals(pageMove[0])) {
					RequestDispatcher view = req.getRequestDispatcher(path);
					view.forward(req, res);
				}
				else {
					res.sendRedirect("/error/pageMoveFail.jsp");
				}
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
