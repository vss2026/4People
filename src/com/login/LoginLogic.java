package com.login;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class LoginLogic {
	LoginDao l_dao = new LoginDao();
	Logger logger =Logger.getLogger(LoginLogic.class);
	public List<Map<String,Object>> loginCall(Map<String,Object> pMap){
		logger.info("로그인호출");
		List<Map<String,Object>> loginList =null;
		loginList=l_dao.loginCall(pMap);
		return loginList;
	}
	public void signUp(Map<String,Object> pMap) {
		logger.info("signUp호출");
		l_dao.signUp(pMap);
	}
}
