<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="../include/top.jsp"  flush="false">
		<jsp:param value="" name="top" />
	</jsp:include> 
<title>Insert title here</title>
<%
   String mem_id = (String)session.getAttribute("MEM_ID");
	String board_no = (String)request.getAttribute("board_no");

 List<Map<String,Object>> board_List =(List<Map<String,Object>>)request.getAttribute("b_boardList");

		List<String> BLIST_NO =new ArrayList<String>();
		List<String> BLIST_TITLE = new ArrayList<String>();
		List<String> BL_team_code = new ArrayList<String>();
		if(board_List!=null){
		for(Map<String,Object> rMap:board_List){
			BLIST_NO.add(String.valueOf(rMap.get("BLIST_NO")));
			BLIST_TITLE.add(rMap.get("BLIST_TITLE").toString());
			BL_team_code.add(rMap.get("TEAM_CODE").toString());
		}	
		}
%>
<script type="text/javascript">
	function cardAdd(id){
// 		alert(id);
		document.getElementById(id+'tt').innerHTML+="<input type='text' id='"+id+"textval'>";
		if(id=="gg"){
		document.getElementById(id+'bb').innerHTML+="<input type='button' class='btn btn-success' value='생성' onClick='boardlistAdd("+id+")'>";
		}
		else{
		document.getElementById(id+'bb').innerHTML+="<input type='button' class='btn btn-success' value='생성' onClick='cardlist("+id+")'>";
		}
	}
	function boardlistAdd(id){
		var input2 = document.getElementById('ggtextval').value;
		var param = "bd_title="+input2;
		$('#jae').empty();
			
			$.ajax({
				type:"POST"
			   ,url:"./boardList.for?crud=ins&team_code=<%=BL_team_code%>&mem_id=<%=mem_id%>&board_no=<%=board_no%>&BLIST_TITLE="+input2
			   ,data:param
			   ,dataType:"html"
			   ,success:function(result){
				   $("#jae").html(result);
				   
			   }
			  ,error:function(){
				  $("#d_table").text(e.responseText);
			  }
			});
	}
	function cardlist(id){
// 		if(id!=null){
			
// 		}
// 		alert(input);
// 		alert(input2);
// 		alert($('#gg').text);
// 		if($('#gg').text()=="+ 새 보드 추가하기"){
// 		var input2 = document.getElementById('ggtextval').value;
// 		var param = "bd_title="+input2;
// 		$('#jae').empty();
			
// 			$.ajax({
// 				type:"POST"
// 			   ,url:"./boardList.for?crud=ins"
// 			   ,data:param
// 			   ,dataType:"html"
// 			   ,success:function(result){
// 				   $("#jae").html(result);
				   
// 			   }
// 			  ,error:function(){
// 				  $("#d_table").text(e.responseText);
// 			  }
// 			});
//           $('#tt').empty();
// 		$('#bb').empty();
// 		document.getElementById('jae').innerHTML+= document.getElementById("min").outerHTML;
// 		document.getElementById('listtitle').innerHTML+=input;
		
// 		$('#gg').empty();
// 		document.getElementById('gg').innerHTML+="+ 새 카드 추가하기";
// 		alert($('#gg').text());
		
		
// 		}
// 		else {
// 			alert("하하하하하");
		var input = document.getElementById(id+'textval').value;
          $('#'+id+'tt').empty();
		$('#'+id+'bb').empty();
// 	document.getElementById(id+'tt').empty();
// 	document.getElementById(id+'bb').empty();
		document.getElementById(id+"cardAdd").innerHTML+="<input type='button' class='btn btn-default btn-block' value='"+input+"'>";
// 		var $div = $("<tr><input type='button' class='btn btn-default btn-block' value='"+input+"'></tr>");
// 		  $('#cardAdd').append($div);
// 		$('#tt').empty();
// 		$('#bb').empty();
// 		}
// 		$('#tt').empty();
// 		$('#bb').empty();
	}
	
</script>
</head>
<body style="background-color:2489F8;">
	<div id="haha" class="panel panel-primary"  >
    <div class="panel-heading">
        <h3 class="panel-title"><img src="../images/team.png"> 자바팀</h3>
    </div>
    </div>
    
    <!--===================== 리스트들============================= -->
     <div  id="jae">
		<% for(int i=0;i<BLIST_NO.size();i++){ %>
     <div id=<%=BLIST_NO.get(i) %> class="panel panel-default col-sm-2" style="background-color: #F6F6F6;">
  <!-- Default panel contents -->
     <div  class="panel-heading"><h4 id="listtitle"><%=BLIST_TITLE.get(i) %></h4></div>

  <!-- Table -->
     <table class="table" id=<%=BLIST_NO.get(i)+ "cardAdd"%>>
 	  <tr id=<%=BLIST_NO.get(i)+"tt" %>>
 	  </tr>
 	  <tr id=<%=BLIST_NO.get(i)+"bb" %>> 	
   	</tr>
  </table>
  <div class="panel-heading"><a id="gg" href="javascript:cardAdd(<%=BLIST_NO.get(i) %>)" >+ 새 카드 추가하기</a></div>
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
    </div>
<!--=====================리스트 끝 ================================ -->
<script type="text/javascript">
// board_ListSel();
function board_ListSel(){
	$('#jae').empty();
//		if($('#gg').text()=="+ 새 보드 추가하기"){
		var param ="board_no=<%=board_no%>"
		$.ajax({
			type:"POST"
		   ,url:"./boardList.for?crud=sel"
		   ,data:param
		   ,dataType:"html"
		   ,success:function(result){
			   $("#jae").html(result);
			   
		   }
		  ,error:function(){
			  $("#d_table").text(e.responseText);
		  }
		});
}


</script>
</body>
</html>