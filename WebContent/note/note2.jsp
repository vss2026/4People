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

	function newNoteModal(){
		alert('함수호출');
		$('#okModal').modal('show');
	}

</script>

</head>
<body class='bggrey'>
<div class="modal fade" id="okModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Solved</h4>

        </div>
        <div class="modal-body">
          <p>Are you sure you don't need this note anymore?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="yesButton" data-dismiss="modal">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
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
     

        <li><a href="javascript:newNoteModal()"><i class="fas fa-plus-circle fa-2x"></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;새 노트</span></a></li>
        <li><a href="#"><i class="fas fa-envelope-open fa-2x"></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;내 우편함</span></a></li>
        <li><a href="#"><i class="fas fa-paper-plane fa-2x"></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;메모 보내기</span></a></li>
      </ul>
      
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- /상단 -->
<!-- body -->
<!-- <div class="container-fluid" style="height: 95vh"> -->
<!--     <div class="row content" style="height: 100%"> -->
<!--       <div class="col-sm-12" style="height: 100%"> -->
<!--         <h1>메모</h1> -->
<!--         <div class="row border" style="height: 50%; overflow:auto"> -->
<!--           <div class="col-sm-12" id="container"> -->

<!--           </div> -->
<!--         </div> -->
<!--         <div class="row" style="height: 50%; overflow:auto"> -->
<!--           <div class="col-sm-12"> -->
<!--             <h1>쪽지</h1> -->
<!--             <div class="row" id="deletedContainer"> -->

<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       </div> -->
<!--       </div> -->
<!-- body -->
</body>
</html>