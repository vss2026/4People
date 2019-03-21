<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.util.*" %> 
<%
	List<Map<String,Object>> boardList = (List<Map<String,Object>>)request.getAttribute("BoardList");
// 			List<String> board_color= new ArrayList<String>();
// 			List<String> board_title= new ArrayList<String>();
// 			List<String> board_upd = new ArrayList<String>();
// 			List<String> team_no = new ArrayList<String>();
// 			List<String> team_name = new ArrayList<String>();
// 	if(boardList!=null){
// 		for(int i=0;i<boardList.size();i++){
// 			board_color.add(boardList.get(i).get("BOARD_COLOR").toString());  
// 			board_title.add(boardList.get(i).get("BOARD_TITLE").toString());
// 			 board_upd.add(boardList.get(i).get("BOARD_UPDATE").toString());
// 			 board_no.add(String.valueOf(boardList.get(i).get("BOARD_NO")));
// 			 team_name.add(boardList.get(i).get("TEAM_NAME").toString());
// 		}
// 	}
// 		for(Map<String,Object> lMap:BoardList) {
// 			for(String key:lMap.keySet()) {
// 				if(key.equals("BoardSel")){
// 				lMap.get(key).equals("mem_id" );
// 				}
// 			}
// 			}

 	boardList.get(0).get("teamMap");
 	boardList.get(0).get("boardMap");
%>

<script>
<%--  alert(<%=team_name%>); --%>
<%-- <c:forEach var="item" items="${"+<%= boardList.get(0).get("teamMap") %>+"}"> --%>
   
//  var mem_id =  ${item['mem_id']}
//  var team_code = ${item['team_code']}
   alert(<%=boardList.get(0).get("teamMap")%>);
   alert(<%=boardList.get(0).get("boardMap")%>);
// </c:forEach>
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
