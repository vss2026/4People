package com.card;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class CardLogic {
	//은수
	CardDao c_Dao = new CardDao();
	Logger logger = Logger.getLogger(CardLogic.class);
	public String commentIns(Map<String, Object> pMap) {
		logger.info("CardLogic 호출");
		String comment_code=c_Dao.commentIns(pMap);
		return comment_code;
	}
	//은수
}
