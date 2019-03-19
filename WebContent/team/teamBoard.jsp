<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
List<Map<String,Object>> boardList =(List<Map<String,Object>>)request.getAttribute("team");
String b_title=null;
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<jsp:include page="./viewTeam.jsp" flush="false">
		<jsp:param value="" name="top" />
	</jsp:include>
<title>Insert title here</title>


</head>
<body>

<article class="container" >
	<div style="text-align: center;">
<ul id="options" class="nav nav-tabs nav-justified" >
<!-- 	<li> 클릭햇을떄 눌러져잇는것처럼 보이는 속성 class="active" -->
  <li role="presentation" class="active"><a style=" font-weight:700;" href="./team.for?command=board">보드</a></li>
  <li role="presentation" ><a  style=" font-weight:700;" href="./team.for?command=member">회원</a></li>
  <li role="presentation"><a style=" font-weight:700;" href="#">설정</a></li>
  </ul>
<!-- 	<ul id="options" class="nav nav-tabs" > -->
<!--   <li role="presentation" class="active"><a  style=" font-weight:700;" href="./team.for?command=board">보드</a></li> -->
<!--   <li role="presentation"><a style=" font-weight:700;" href="./team.for?command=member">회원</a></li> -->
<!--   <li role="presentation"><a style=" font-weight:700;" href="#">설정</a></li> -->
<!--   </ul> -->
  </div>
  
	</article>
	
<% 
	if(boardList!=null&&boardList.size()>0){
		for(Map<String,Object> rMap:boardList){
			if(rMap.containsKey("B_TITLE"))
				 b_title =(String)rMap.get("B_TITLE");
%>
	<%=b_title %>

<%
		}
		}else{
%>
없음.
<%
		}
%>
	

</body>
</html>