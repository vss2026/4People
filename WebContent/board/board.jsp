<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.lang.Integer" %>
<% String name = (String)session.getAttribute("MEM_NAME"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/top.jsp"  flush="false">
		<jsp:param value="" name="top" />
	</jsp:include> 
<title>Insert title here</title>
<%
	   String mem_id = (String)session.getAttribute("MEM_ID");
// 	List<Map<String,Object>> team_List = (List<Map<String,Object>>)request.getAttribute("team_List");
// 			List<String> color2= new ArrayList<String>();
// 			List<String> booktitle= new ArrayList<String>();
// 			List<String> board_upd = new ArrayList<String>();
// 			List<String> board_no = new ArrayList<String>();
// 			List<String> team_name = new ArrayList<String>();
// // 			int[] board_no = new int[boardList.size()];
// 	if(boardList!=null){
// 		for(int i=0;i<boardList.size();i++){
// 			color2.add(boardList.get(i).get("BOARD_COLOR").toString());  
// 			 booktitle.add(boardList.get(i).get("BOARD_TITLE").toString());
// 			 board_upd.add(boardList.get(i).get("BOARD_UPDATE").toString());
// 			 board_no.add(String.valueOf(boardList.get(i).get("BOARD_NO")));
// 			 team_name.add(boardList.get(i).get("TEAM_NAME").toString());
// 		}
// 	}

%>
<!-- 	<style> -->

<!-- 	</style> -->
	<script type="text/javascript">
	  var temp = new Array();
	  var color ="btn-default";
	  function addInput() {
	      temp=document.getElementById("op").value;
// 		  document.getElementById('parah').innerHTML+="<input type='button' class='btn "+color+" btn-lg btn-block' value="+temp+">"
		  location.href="./board.for?crud=ins&boardtitle="+temp+"&color="+color;
		}
	  function boardupd(id){
			alert(id);
		  location.href="./board.for?crud=upd&id="+id;
		  
	  }
	  function boardmove(){
		  location.href="../boardList/boardList.jsp";
	  }
	function defaultt(){
		color ="btn-default";
	}	 
	function primary(){
		color ="btn-primary";
	}	 
	function success(){
		color ="btn-success";
	}	 
	function info(){
		color ="btn-info";
	}	 
	function warning(){
		color ="btn-warning";
	}	 
	function danger(){
		color ="btn-danger";
	}	 
	</script>
</head>
<body>
 <script type="text/javascript">
 $(document).ready(function(){
 var boardList = new Array(); 
//  var color2 = new Array(); 
 var color2 ; 
//  var booktitle = new Array(); 
//  var booktitle ; 
<%--  boardList = "<%=boardList%>"; --%>
<%--  color2 = "<%=color2%>"; --%>
<%--  booktitle = "<%=booktitle%>"; --%>
//  var color4 = color2.substring(1,color2.length-1);
//  var color3 = color4.split(',');
//  var booktitle3 = booktitle.substring(1,booktitle.length-1);
//  var booktitle2 = booktitle3.split(',');
<%--  var board_upd = "<%=board_upd%>" --%>
//  var board_upd2 = board_upd.substring(1,board_upd.length-1).split(',');
<%--  var board_no = "<%=board_no%>" --%>
//  var board_no2 = board_no.substring(1,board_no.length-1).split(',');
//  	alert(board_upd2);
//  	alert(board_no2);
//      alert(boardList);
//      alert(color2);
//      alert(booktitle2);
     boardSelect();
// 	     function boardSelect(){
// 		  if(boardList!=null && booktitle2!=null){			  
// 		  for(var i=0;i<color3.length;i++){
// 			  var $div = $("<div class='col-sm-2'><input type='button' style='WIDTH: 150pt; HEIGHT: 100pt' id='"+board_no2[i]+"' class='btn "+color3[i]+" ' value="+booktitle2[i]+" onClick='boardmove()'></div>");
// 			  $('#myboard').append($div);
// // 		 document.getElementById('parah').innerHTML+="<input type='button' class='btn "+color3[i]+" btn-lg ' value="+booktitle2[i]+" onClick='boardmove()'>"
// 			if(board_upd2[i]==1){
// 			  var $div2 = $("<div class='col-sm-2'><input type='button' style='WIDTH: 150pt; HEIGHT: 100pt' id='"+board_no2[i]+"' class='btn "+color3[i]+" ' value="+booktitle2[i]+" onClick='boardupd(id)'></div>");
// 			  $('#updateboard').append($div2);
				
// 			}
// 		  }
// 		  }
// 	  }
	     function boardSelect(){
	    	 var param = "mem_id=<%=mem_id %>";
		  $('#board_table').empty();
		  $.ajax({
				type:"POST"
			   ,url:"./board.for?crud=sel"
			   ,data:param
			   ,dataType:"html"
			   ,success:function(result){
				   $("#board_table").html(result);
				   
			   }
			  ,error:function(){
				  $("#d_table").text(e.responseText);
			  }
			});
	  }
 });
 </script>
	<table id="board_table" class="table">
<!-- 	<tr> -->
<!-- 	<div class=" row col-md-offset-1"style="margin-top:100px;" id="updateboard"> -->
<!-- 	<h3 style="color:#5bc0de"> <span class="label"><img src="../images/new.jpg"></span>업데이트 </h3> -->
<!-- <!-- 	<div class="col-sm-2 text-center" id="board"> --> 
<!-- <!-- 	<input type="button" class="btn btn-default btn-lg " data-target="#layerpop" data-toggle="modal" value="새 보드 생성하기..."></button> --> 
<!-- <!-- 	</div> --> 
<!-- 	</div> -->
<!-- 	</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr> -->
<!-- 	<div class=" row col-md-offset-1"style="margin-updateboard:700px;" id="myboard"> -->
<!-- 	<h3 style="color:#5bc0de"> <span class="label"><img src="../images/my.png"></span>지유니 </h3> -->
<!-- 	<div class="col-sm-2 text-center" id="board"> -->
<!-- 	<input type="button" style="WIDTH: 150pt; HEIGHT: 100pt" class="btn btn-default " data-target="#layerpop" data-toggle="modal" value="새 보드 생성하기..."></button> -->
<!-- 	</div> -->
<!-- 	</div> -->
<!-- 	</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr>&nbsp;</tr> -->
<!-- 	<tr> -->
<!-- 	<div class=" row col-md-offset-1" id="teamboard"> -->
<!-- 	<h3 style="color:#5bc0de"> <span class="label"><img src="../images/team.png"></span>자바팀 </h3> -->
<!-- 	<div class="col-sm-2 text-center" id="board"> -->
<!-- 	<input type="button" style="WIDTH: 150pt; HEIGHT: 100pt" class="btn btn-default" data-target="#layerpop" data-toggle="modal" value="새 보드 생성하기..."></button> -->
<!-- 	</div> -->
<!-- 	</div> -->
<!-- 	</tr> -->
</table>
 <!--  모달영역 -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">보드명</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            <input type=text id="op" name="boardtitle">
           
      </div>
      <!-- Footer -->
      <div class="modal-footer" id="create">
		 <input type="button" style="float:left" class="btn btn-default" onClick="defaultt()"/>
            <input type="button" style="float:left" class="btn btn-primary" onClick="primary()"/>
            <input type="button" style="float:left" class="btn btn-success" onClick="success()"/>
            <input type="button" style="float:left" class="btn btn-info" onClick="info()"/>
            <input type="button" style="float:left" class="btn btn-warning" onClick="warning()"/>
            <input type="button" style="float:left" class="btn btn-danger" onClick="danger()"/>
        <button type="button" class="btn btn-default" data-dismiss="modal" onClick="addInput()">생성</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>