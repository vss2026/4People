<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/top.jsp" flush="false">
		<jsp:param value="" name="top" />
</jsp:include>
<title>Insert title here</title>
<style type="text/css">
.es_info-color {
    background-color: rgb(51, 181, 229) !important;
}
.navbar-default .navbar-nav>li>a {
    color: #FFF;
    margin-bottom:5px;
}
body.bggrey {
  background-color: white;
  padding-right:0 !important;
}
.margin {
  margin-top: 25px;
}
.grayout {
  opacity: .45;
}
.headingcolor {
  color: #333;
  background-color: lightgreen;
  border-color: #ddd;
  padding: 10px 15px;
  border-bottom: 1px solid transparent;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
}
.border {
  border-bottom: 1px solid #ebebeb;
  border-top: 1px solid #ebebeb;
}
.panel {
  transition: box-shadow 200ms;
}
.panel:hover {
  box-shadow: 2px 1px 6px 4px grey;
}
.glyphicon:after {
  pointer-events: none;
}
</style>

<script type="text/javascript">
var color ="btn-default";
$(document).ready(function () {
	//메모 저장 버튼 눌럿을때
	document.getElementById("editButton").onclick = function () {
		alert('저장');
		alert(color);
		var contents=document.getElementById("editcontent").value();
	};
	
});
	//색 저장
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
	
	
	//새 메모눌럿을떄 모달띄우기
	function newNoteModal(){
		$('#editModal').modal('show');
	}

</script>

</head>
<body class='bggrey'>

<!-- 상단 -->
<nav class="navbar navbar-default es_info-color" style='border:0;'>
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
     

        <li><a href="javascript:newNoteModal()"><i class="fas fa-plus-circle fa-2x"></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;새 메모</span></a></li>
        <li><a href="#"><i class="fas fa-envelope-open fa-2x"></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;내 우편함</span></a></li>
        <li><a href="#"><i class="fas fa-paper-plane fa-2x"></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;메모 보내기</span></a></li>
      </ul>
      
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- /상단 -->
<!-- body -->
<div class="container-fluid" style="height: 95vh">
    <div class="row content" style="height: 100%">
      <div class="col-sm-12" style="height: 100%">
        <h1>메모</h1>
        <div class="row border" style="height: 50%; overflow:auto">
          <div class="col-sm-12" id="container">

          </div>
        </div>
        <div class="row" style="height: 50%; overflow:auto">
          <div class="col-sm-12">
            <h1>쪽지</h1>
            <div class="row" id="deletedContainer">

            </div>
          </div>
        </div>
      </div>
      </div>
      </div>
<!-- body -->
<!-- modal -->
<div class="modal fade" id="editModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Memo</h4>
        </div>
        <div class="modal-body">
          <form role="form" name="editNote" id="editSticky">
            <div class="control-group form-group">
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label for="content">내용</label>
                <textarea id="editcontent" class="form-control" maxlength="999" rows="10" cols="100" required style="resize: none;"></textarea>
              </div>
            </div>
            <div class="modal-footer" id="create">
            <input type="button" style="float:left" class="btn btn-default" onClick="defaultt()"/>
            <input type="button" style="float:left" class="btn btn-primary" onClick="primary()"/>
            <input type="button" style="float:left" class="btn btn-success" onClick="success()"/>
            <input type="button" style="float:left" class="btn btn-info" onClick="info()"/>
            <input type="button" style="float:left" class="btn btn-warning" onClick="warning()"/>
            <input type="button" style="float:left" class="btn btn-danger" onClick="danger()"/>
            </div>
            <div id="success"></div>
            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary pull-right" id="editButton" style="margin-bottom:10px" data-dismiss="modal">저장</button>
          </form>
        </div>
      </div>
    </div>
  </div>
<!-- modal -->
</body>
</html>