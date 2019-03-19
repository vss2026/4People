<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.util.*" %>   
<%
List<Map<String,Object>> board_List =(List<Map<String,Object>>)request.getAttribute("board_List");

		List<String> bd_no =new ArrayList<String>();
		List<String> bd_title = new ArrayList<String>();
		for(Map<String,Object> rMap:board_List){
			 bd_no.add(String.valueOf(rMap.get("BD_NO")));
			 bd_title.add(rMap.get("BD_TITLE").toString());
		}	
%>
<% for(int i=0;i<bd_no.size();i++){ %>
 <div id=<%=bd_no.get(i) %> class="panel panel-default col-sm-2" style="background-color: #F6F6F6;">
  <!-- Default panel contents -->
  <div  class="panel-heading"><h4 id="listtitle"><%=bd_title.get(i) %></h4></div>

  <!-- Table -->
  <table class="table" id=<%=bd_no.get(i)+ "cardAdd"%>>
 	<tr id=<%=bd_no.get(i)+"tt" %>>
 	</tr>
 	<tr id=<%=bd_no.get(i)+"bb" %>> 	
 	</tr>
  </table>
  <div class="panel-heading"><a id="gg" href="javascript:cardAdd(<%=bd_no.get(i) %>)" >+ 새 카드 추가하기</a></div>
</div>

<%}%>
 <div id=min class="panel panel-default col-sm-2" style="background-color: #F6F6F6;">
  <!-- Default panel contents -->
  <div  class="panel-heading"><h4 id="listtitle"></h4></div>

  <!-- Table -->
  <table class="table" id="cardAdd">
 	<tr id="ggtt" >
 	</tr>
 	<tr id="ggbb"> 	
 	</tr>
  </table>
  <div class="panel-heading"><a id="gg" href="javascript:cardAdd('gg')" >+ 새 보드 추가하기</a></div>
  
</div>
