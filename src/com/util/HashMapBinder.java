package com.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class HashMapBinder {
	HttpServletRequest req = null;
	public HashMapBinder(HttpServletRequest req) {
		this.req = req;
	}
	public void bind(Map<String,Object> pMap) {
		pMap.clear();
		Enumeration<String> en = req.getParameterNames();
		while(en.hasMoreElements())
		{
			String key = en.nextElement();
			pMap.put(key,req.getParameter(key));
//			try {
//				pMap.put(key,URLDecoder.decode(req.getParameter(key),"UTF-8"));
//			} catch (UnsupportedEncodingException e) {
//				e.printStackTrace();
//			}

//			pMap.put(key,req.getParameter(key));
		}
	}
	public void ajaxBind(Map<String,Object> pMap) {
		pMap.clear();
		Enumeration<String> en = req.getParameterNames();
		while(en.hasMoreElements()) {
			String key = en.nextElement();
			pMap.put(key,req.getParameter(key));
		}
	}
	
}
