<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.google.gson.Gson" %>
<%
	List<Map<String,Object>> sideTeamList =(List<Map<String,Object>>)request.getAttribute("sideTeamList");
	if(sideTeamList!=null){
		Gson gson = new Gson();
		String json ="";
		for(int i =0; i<sideTeamList.size();i++){
			json = gson.toJson(sideTeamList);
		}
			out.print(json);
		
	}
%>