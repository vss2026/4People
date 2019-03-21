<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.util.*" %> 
 <%@ page import ="com.google.gson.Gson, com.google.gson.JsonObject ,com.google.gson.JsonParser" %> 
<%
	List<Map<String,Object>> boardList = (List<Map<String,Object>>)request.getAttribute("BoardList");
			List<String> TeamCr = (List<String>)boardList.get(0).get("teamMap");
			List<String> boardCr = (List<String>)boardList.get(0).get("boardMap");
// 			List<String> board_color= new ArrayList<String>();
// 			List<String> board_title= new ArrayList<String>();
// 			List<String> board_upd = new ArrayList<String>();
			List<String> t_team_code = new ArrayList<String>();
// 			List<String> team_name = new ArrayList<String>();
// 	if(boardList!=null){
			Iterator itr = TeamCr.iterator();
			while(itr.hasNext()){
				//out.print(itr.next()+"<br>");
				Map<String,Object> pMap = (Map<String,Object>)itr.next();
				Object keys[] = pMap.keySet().toArray();
				for(int j=0;j<keys.length;j++){
					out.print(keys[j]+" - ");
					out.print(pMap.get(keys[j])+"<br>");
					if(keys[j].equals("team_code")){
						
					}
					
				}
			}
%>

<script>
   
//  var mem_id =  ${item['mem_id']}
//  var team_code = ${item['team_code']}
</script>
<tr>
	<div class=" row col-md-offset-1"style="margin-top:100px;" id="updateboard">
	<h3 style="color:#5bc0de"> <span class="label"><img src="../images/new.jpg"></span>업데이트 </h3>
<!-- 	<div class="col-sm-2 text-center" id="board"> -->
<!-- 	<input type="button" class="btn btn-default btn-lg " data-target="#layerpop" data-toggle="modal" value="새 보드 생성하기..."></button> -->
<!-- 	</div> -->
	</div>
	</tr>
<%-- <% for(int i=0;i<team_name.size();i++){ %> --%>
<!-- <tr> -->
<!-- 	<div class=" row col-md-offset-1"style="margin-updateboard:700px;" id="myboard"> -->
<%-- 	<h3 style="color:#5bc0de"> <span class="label"><img src="../images/my.png"></span><%=team_name.get(i) %> </h3> --%>
<!-- 	<div class="col-sm-2 text-center" id="board"> -->
<!-- 	<input type="button" style="WIDTH: 150pt; HEIGHT: 100pt" class="btn btn-default " data-target="#layerpop" data-toggle="modal" value="새 보드 생성하기..."></button> -->
<!-- 	</div> -->
<%-- 	<%for(int j=0;j<board_no.size();j++) {%> --%>
<!-- 	<div class='col-sm-2'> -->
<%-- 	<input type='button' style='WIDTH: 150pt; HEIGHT: 100pt' id="<%=board_no.get(j) %>" class="btn <%=board_color.get(j) %> " value="<%=board_title.get(j) %>" onClick='boardmove()'></div> --%>
<%-- 	<% } %> --%>
<!-- 	</div> -->
<!-- 	</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->



<%-- <% } %> --%>
