<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../common/common.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">

	function newNoteModal(){
	 	alert('호출');
		$('#okModal').modal('show');
	}

</script>
</head>
<body>
<a href='javascript:newNoteModal()'>모달</a>
<div class="modal fade bs-example-modal-lg" id="okModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      ...
    </div>
  </div>
</div>

<!-- Small modal -->


<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      ...
    </div>
  </div>
</div>
</body>
</html>