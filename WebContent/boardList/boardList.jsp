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
	String titlee ="자바팀";
	
 List<Map<String,Object>> board_List =(List<Map<String,Object>>)request.getAttribute("b_boardList");
		List<String> BLIST_NO =new ArrayList<String>();
		List<String> BLIST_TITLE = new ArrayList<String>();
		List<String> BL_team_code = new ArrayList<String>();
		List<String> C_BLIST_NO =new ArrayList<String>();
		List<String> CARD_CODE =new ArrayList<String>();
		List<String> CARD_NAME =new ArrayList<String>();
	    String t_team_code=  board_List.get(0).get("r_team_code").toString();
		List<String> BLISTMap =(List<String>) board_List.get(0).get("BLISTMAP");
		List<String> CARDLISTMAP =(List<String>) board_List.get(0).get("CARDLISTMAP");
	
		Iterator itr = BLISTMap.iterator();
		while(itr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)itr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("TEAM_CODE")){
					BL_team_code.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("BLIST_NO")){
					BLIST_NO.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("BLIST_TITLE")){
					BLIST_TITLE.add(pMap.get(keys[j]).toString());
				}
				
			}
		}
		
		Iterator ctr = CARDLISTMAP.iterator();
		while(ctr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)ctr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("CARD_CODE")){
					CARD_CODE.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("BLIST_NO")){
					C_BLIST_NO.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("CARD_NAME")){
					CARD_NAME.add(pMap.get(keys[j]).toString());
				}
				
			}
		}
		
%>
<style type="text/css">
.testimonial-group > .row {
  overflow-x: auto;
  white-space: nowrap;
   height:830px; 
}
 .testimonial-group > .row > .col-sm-2 { 
    display: inline-block;  
    float: none;   
 } 
.es_info-color {
    background-color: rgb(51, 181, 229) !important;
}
.navbar-default .navbar-nav>li>a {
    color: #FFF;
    margin-bottom:5px;
}

 .modal.modal-center {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal.modal-center:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialogg {
          display: inline-block;  
        text-align: left;
        vertical-align: middle;
}

/* Decorations */
/* .col-sm-2 { color: #fff; font-size: 48px; padding-bottom: 20px; padding-top: 18px; } */
/* .col-sm-2:nth-child(3n+1) { background: #c69; } */
/* .col-sm-2:nth-child(3n+2) { background: #9c6; } */
/* .col-sm-2:nth-child(3n+3) { background: #69c; } */
</style>
<script type="text/javascript">
<%-- 	alert("<%=BLISTMap%>"); --%>
<%-- 	alert("<%=CARDLISTMAP%>"); --%>
<%-- 	alert("<%=CARD_CODE.size()%>"); --%>
var color ="btn-default";
var temp = new Array();
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
// 		alert(id);
		alert("<%=board_no%>");
		var r_BL_team_code = "<%=t_team_code%>";
		alert(r_BL_team_code);
		alert(r_BL_team_code.substring(1,2));
		var str_team_code = r_BL_team_code.substring(1,2);
		var input2 = document.getElementById('ggtextval').value;
		<%=titlee%> = input2;
// 		var param = "bd_title="+input2;
		var param = "crud=ins&team_code="+r_BL_team_code+"&mem_id=<%=mem_id%>&board_no=<%=board_no%>&BLIST_TITLE="+input2;
		alert(param);
		$('#jae').empty();
<%-- 		location.href="./boardList.for?crud=ins&team_code=<%=BL_team_code%>&mem_id=<%=mem_id%>&board_no=<%=board_no%>&BLIST_TITLE="+input2; --%>
		location.href="./boardList.for?"+encodeURI(param);
			
// 			$.ajax({
// 				type:"POST"
<%-- 			   ,url:"./boardList.for?crud=ins&team_code=<%=BL_team_code%>&mem_id=<%=mem_id%>&board_no=<%=board_no%>&BLIST_TITLE="+input2 --%>
// 			   ,data:param
// 			   ,dataType:"html"
// 			   ,success:function(result){
// 				   $("#jae").html(result);
				   
// 			   }
// 			  ,error:function(){
// 				  $("#d_table").text(e.responseText);
// 			  }
// 			});
	}
	function cardlist(id){

		var input = document.getElementById(id+'textval').value;
          $('#'+id+'tt').empty();
		$('#'+id+'bb').empty();
		document.getElementById(id+"cardAdd").innerHTML+="<input type='button' class='btn btn-default btn-block' value='"+input+"'>";
		var r_BL_team_code = "<%=t_team_code%>";
		var param = "crud=ins2&team_code="+r_BL_team_code+"&board_no=<%=board_no%>&mem_id=<%=mem_id%>&card_name="+input+"&BLIST_NO="+id;
		location.href="./boardList.for?"+encodeURI(param);
		

	}
	function cardOpen(id){
		var param = "crud=sel"
			$('#cardmodal').empty();
			$.ajax({
					type:"POST"
				,url:"../card/card.for"
					,data:param
						   ,dataType:"html"
						   ,success:function(result){
						    $('#cardmodal').append(result);
// // 							   $('#myModal').modal()  
// 							   $('#cardmodal').modal('show');
						   }
			,error:function(jqXHR, exception){
				  if (jqXHR.status === 0) {
			            alert('Not connect.\n Verify Network.');
			        }
			        else if (jqXHR.status == 400) {
			            alert('Server understood the request, but request content was invalid. [400]');
			        }
			        else if (jqXHR.status == 401) {
			            alert('Unauthorized access. [401]');
			        }
			        else if (jqXHR.status == 403) {
			            alert('Forbidden resource can not be accessed. [403]');
			        }
			        else if (jqXHR.status == 404) {
			            alert('Requested page not found. [404]');
			        }
			        else if (jqXHR.status == 500) {
			            alert('Internal server error. [500]');
			        }
			        else if (jqXHR.status == 503) {
			            alert('Service unavailable. [503]');
			        }
			        else if (exception === 'parsererror') {
			            alert('Requested JSON parse failed. [Failed]');
			        }
			        else if (exception === 'timeout') {
			            alert('Time out error. [Timeout]');
			        }
			        else if (exception === 'abort') {
			            alert('Ajax request aborted. [Aborted]');
			        }
			        else {
			            alert('Uncaught Error.n' + jqXHR.responseText);
			        }


			  }
			});
			
	}
			function labelAdd(){
				document.getElementById("card_label").innerHTML+="<input type='button' class='btn btn-default ' value='gg'>";
			}
			 function addInput() {
			      temp=document.getElementById("label_text").value;
//		 		  document.getElementById('parah').innerHTML+="<input type='button' class='btn "+color+" btn-lg btn-block' value="+temp+">"
				  location.href="../card/card.for?crud=ins&label_content="+temp+"&label_color="+color+"&mem_id=<%=mem_id%>&team_code=<%=t_team_code%>";
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
<body style="background-color:2489F8;">


	<div id="haha" class="panel panel-primary"  >
    <div class="panel-heading">
        <h3 class="panel-title"><img src="../images/team.png"> <%=titlee%></h3>
    </div>
    </div>
    
    <!--===================== 리스트들============================= -->
     <div  id="jae" class="testimonial-group">
      <div class="row">
		<% for(int i=0;i<BLIST_NO.size();i++){ %>
     <div id=<%=BLIST_NO.get(i) %> class="panel panel-default col-sm-2" style="background-color: #F6F6F6; margin-left:15px;">
  <!-- Default panel contents -->
     <div  class="panel-heading"><h4 id="listtitle"><%=BLIST_TITLE.get(i) %></h4></div>

  <!-- Table -->
     <table class="table" id=<%=BLIST_NO.get(i)+ "cardAdd"%>>
 	  <tr id=<%=BLIST_NO.get(i)+"tt" %>>
 	  </tr>
 	  <tr id=<%=BLIST_NO.get(i)+"bb" %>> 	
   	</tr>
   	<%for(int j=0;j<C_BLIST_NO.size();j++){
   	  if(C_BLIST_NO.get(j).equals(BLIST_NO.get(i))){
   	   %>
   	<input  id=<%=CARD_CODE.get(j) %> type="button" class="btn btn-default btn-block" value=<%=CARD_NAME.get(j) %> data-toggle="modal" data-target="#cardmodal" onClick="cardOpen(id)">
   	<%}} %>
  </table>
  <div class="panel-heading"><a id="gg" href="javascript:cardAdd(<%=BLIST_NO.get(i) %>)" >+ 새 카드 추가하기</a></div>
</div>

<%}%>
 <div id=min class="panel panel-default col-sm-2" style="background-color: #F6F6F6; margin-left:15px;">
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
    </div>
<!--=====================리스트 끝 ================================ -->
<!--  ======================= 모달 ============================= -->
<div class="modal fade" id="cardmodal" tabindex="-1" role="dialog" aria-labelledby="cardmodal" aria-hidden="true" >
</div>
<!--  ======================= 모달 ============================= -->

<!-- 라벨 모달  -->
<div id="label_modal" class="modal modal-center fade" role="dialog">
  <div class="modal-dialogg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">라벨 내용</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="label_text">
      </div>
      <div class="modal-footer">
      <input type="button" class="btn btn-default" onClick="defaultt()">
      <input type="button" class="btn btn-success" onClick="success()">
      <input type="button" class="btn btn-info" onClick="info()">
      <input type="button" class="btn btn-primary" onClick="primary()">
      <input type="button" class="btn btn-warning" onClick="warning()">
      <input type="button" class="btn btn-danger" onClick="danger()">
        <button type="button" class="btn btn-default" data-dismiss="modal" onClick="addInput()">생성</button>
      </div>
    </div>

  </div>
</div>
<!-- 라벨 모달  -->
</body>
</html>