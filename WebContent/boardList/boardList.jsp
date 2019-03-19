<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
<jsp:include page="../include/top.jsp"  flush="false">
		<jsp:param value="" name="top" />
	</jsp:include>
<script type="text/javascript">
	function cardAdd(){
		document.getElementById('tt').innerHTML+="<input type='text' id='textval'>";
		document.getElementById('bb').innerHTML+="<input type='button' class='btn btn-success' value='생성' onClick='cardlist()'>";
	}
	function cardlist(){
		var input = document.getElementById("textval").value;
		alert(input);
		if($('#gg').text()=="+ 새 보드 추가하기"){
			
          $('#tt').empty();
		$('#bb').empty();
		document.getElementById('jae').innerHTML+= document.getElementById("min").outerHTML;
		document.getElementById('listtitle').innerHTML+=input;
		
		$('#gg').empty();
		document.getElementById('gg').innerHTML+="+ 새 카드 추가하기";
		alert($('#gg').text());
		
		
		}
		else {
// 			alert("하하하하하");
          $('#tt').empty();
		$('#bb').empty();
		document.getElementById('cardAdd').innerHTML+="<input type='button' class='btn btn-default btn-block' value='"+input+"'>";
// 		var $div = $("<tr><input type='button' class='btn btn-default btn-block' value='"+input+"'></tr>");
// 		  $('#cardAdd').append($div);
// 		$('#tt').empty();
// 		$('#bb').empty();
		}
		$('#tt').empty();
		$('#bb').empty();
	}
</script>
</head>
<body style="#BDBDBD;">
	
	<div id="haha" class="panel panel-primary" style="margin-top:35px; ">
    <div class="panel-heading">
        <h3 class="panel-title"><img src="../images/team.png"> 자바팀</h3>
    </div>
    </div>
    
    <!--===================== 리스트들============================= -->
     <div  id="jae">
    <div id="min" class="panel panel-default col-sm-2" style="background-color: #F6F6F6;">
  <!-- Default panel contents -->
  <div  class="panel-heading"><h4 id="listtitle"></h4></div>

  <!-- Table -->
  <table class="table" id="cardAdd">
 	<tr id="tt">
 	</tr>
 	<tr id="bb"> 	
 	</tr>
  </table>
  <div class="panel-heading"><a id="gg" href="javascript:cardAdd()" >+ 새 보드 추가하기</a></div>
</div>
</div>
<!--=====================리스트 끝 ================================ -->





 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="../js/bootstrap.min.js"></script>
</body>
</html>