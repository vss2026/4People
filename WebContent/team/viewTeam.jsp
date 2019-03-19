<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트팀</title>
<jsp:include page="../include/top.jsp" flush="false">
		<jsp:param value="" name="top" />
	</jsp:include>
<%@ include file="../common/common.jsp" %>
</head>
<script type="text/javascript">
var arrInput = new Array(0);
var arrInputValue = new Array(0);
//버튼클릭시 해당버튼에 속성 부여
// $(function(){
// 	  var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
// 	  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
// 	   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
// 	   $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
// 	  })
// 	 })
// 	 $('#btn').on('click', function() {
      
//    });

function t_member(){
	alert("t_member호출");
	
}
  function addInput() {
	  arrInput.push(arrInput.length);
	  arrInputValue.push("");
	  display();
	}
	 
	function display() {
	  document.getElementById('parah').innerHTML="";
	  for (intI=0;intI<arrInput.length;intI++) {
	    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
	  }
	}
	function createInput(id,value) {
		  return "<input type='text' id='test "+ id +"' onChange='javascript:saveValue("+ id +",this.value)' value='"+ 
		value +"'><br>";
		}

</script>
<body>
	
	

<!-- 		<div class="img img-collaborate"> -->
			<div id="parah" class="col-md-6 col-md-offset-3">
			<img src="https://upload.wikimedia.org/wikipedia/commons/1/1e/Default-avatar.jpg" width="100" />
<!-- 	<form class="js-profile-form"> -->
	<!-- 팀프로필 수정 -->
<!-- 		<div id="update"> -->
<!-- 		<p class="error js-profile-form-error hide"></p> -->
<!-- 		<label> -->
<!-- 		<font style="vertical-align: inherit;"> -->
<!-- 			<font style="vertical-align: inherit;">프로젝트명</font> -->
<!-- 		</font> -->
<!-- 		</label> -->
<!-- 		 <input type="text" class="form-control" id="f_name" placeholder="프로젝트명을 입력하세요"> -->
<!-- 		<label> -->
<!-- 		내용 -->
<!-- 		<span class="quiet">(선택사항)</span> -->
<!-- 		</label> -->
<!-- 		<div class="form-group green-border-focus"> -->
<!-- 		<textarea class="form-control" id="p_comment" rows="3"></textarea> -->
<!-- 		</div> -->
<!-- 		</div> -->
		
		
<!-- 	</form> -->
    
			<button id="btn_update" type="button" class="btn btn-info navbar-btn" onClick="addInput()">팀 프로필 수정</button>
	     </div>
	    	
	     
	
	<br><br>

</body>
</html>