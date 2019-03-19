<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <%@ include file="../common/common.jsp" %>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!--     <meta name="description" content=""> -->
<!--     <meta name="author" content=""> -->
<!--     <meta name="google-signin-scope" content="profile email"> -->
<!--     <meta name="google-signin-client_id" content=366819733192-7fbk88uqpt1jcn0bt3i868tfmp9i0a3f.apps.googleusercontent.com> -->
<!--     <script src="https://apis.google.com/js/platform.js" async defer></script> -->
    
    <!-- Bootstrap CSS -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
    <title>Login</title>
    
    <script type="text/javascript">
    	function ID(){
    		alert($("#name").val());
    		alert($("#hp").val());
    		alert($("#br").val());
    	}
    	function loginCall(){
    		$("#f_login").attr("method","POST");
    		$("#f_login").attr("action","./login.for?command=login");
    		$("#f_login").submit();	
    		
    		
    	}
    	
    	
    </script>
	
  </head>
  
  <body align="center" style="color:#C7D3ED;">
   <form name="f_dept" id="f_dept" method="post" action="./login.for?command=id_find">
  <div class="modal fade" id="m_id" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header" >
        <!-- 닫기(x) 버튼 -->
        <h4 class="modal-title">아이디찾기</h4>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <!-- body -->
      <div class="modal-body">
        <div style="padding = 10px,0px,0px,3px;">
           <input id="name" name="name" type="text" placeholder="이름" required autofocus style="border-radius : 10px;"><br>
           <input id="hp" name="hp" type="text" placeholder="전화번호" required autofocus style="border-radius : 10px;"><br>
           <input id="br" name="br" type="date" style="border-radius : 10px;">
      	</div>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
      
        <input type="submit" value="찾기"/>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
       </form>

	<div class="container">
    <div class="row align-items-center justify-content-center" style="height:100vh;"> 
	<div class="card align-middle" style="width:35rem; border-radius:20px;">
		<div class="card-title" style="margin-top:35px;">
			<h1 class="card-title text-center" style="color:#86E57F;">Login</h1>
		</div>
		<div class="card-body" style="margin-top:100px; height:350px;">
		
      <form id="f_login" class="form-signin" method="POST">
        <label for="inputEmail" class="sr-only">Your ID</label>
        <input type="text" id="uid" name="mem_email" class="form-control" placeholder="ID" required autofocus style="border-radius : 10px;"><BR>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="upw" name="mem_pw"  class="form-control" placeholder="Password" required style="border-radius : 10px;"><br>
        <div class="btn float-right">
      	 <input type="button"  value="아이디찾기" style="border: 0px; background-color: white;" data-target="#m_id" data-toggle="modal">
         <input type="button" value="비밀번호찾기" style="border: 0px; background-color: white;">
         </div>
        <div id="button">
        <br>
        <br>
        
        <button id="btn-Yes" class="btn btn-lg btn-success btn-block" style="width=300px;height=350px"  onclick="loginCall()">로 그 인</button>
      	</div>
      </form>
		</div>
		<div class="card-footer">
			<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
			</div></div>
    <script>
        function onSignIn(googleUser) {
            // Useful data for your client-side scripts:
            var profile = googleUser.getBasicProfile();
            alert("ID: " + profile.getId()); // Don't send this directly to your server!
            alert('Full Name: ' + profile.getName());
            alert("Image URL: " + profile.getImageUrl());
            alert("Email: " + profile.getEmail());

            // The ID token you need to pass to your backend:
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
        };
    </script>
		</div>
		</div>

	<div class="modal">
	</div>
<!--     Optional JavaScript -->
<!--     jQuery first, then Popper.js, then Bootstrap JS -->
<!--     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  -->
<!--   </body> -->
</html>