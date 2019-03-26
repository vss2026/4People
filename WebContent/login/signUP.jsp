<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int check =0;
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>회원가입</title>
        <%@ include file="../common/common.jsp" %>
        <script type="text/javascript">
        var result =0;
        	function signUp(){
        		
        		if(result==1){
//             		$("#f_signUp").attr("action","./index.jsp");
//             		$("#f_signUp").submit();
//             		 $("#f_signUp").attr("method","POST");
					var mem_id2=$("#dropdownMenu1").text();
             		$("#f_signUp").attr("action","./login.for?command=signUp&mem_id2="+mem_id2);
             		$("#f_signUp").submit();
        		}
        		else{
        			alert("회원가입실패"+result);
        		}
        		
        		
        	}
        	function check(){
        		var pass = $("#inputPassword").val();
        		var pass_check= $("#inputPasswordCheck").val();
        		
        		if(pass.length<8||pass.length>16){
        			document.getElementById('check').innerHTML = '암호를 8자이상 16자 이하로 설정해주세요';
        			document.getElementById('check').style.color='red';
        			result=0;
        		}
        		else{
        			document.getElementById('check').innerHTML = '';
        			document.getElementById('check').style.color='red';
        			result=1;
        		}
      	
        		if(pass!=pass_check){
        			document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
        			document.getElementById('same').style.color='red';
        			result=0;
        		}
        		else if(pass==pass_check){
        			document.getElementById('same').innerHTML = '비밀번호가 일치 합니다';
        			document.getElementById('same').style.color='blue';
        			result=1;
        			
        		}
        	}
        	
        </script>
  <!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->

    </head>
    <body >
    
        <article class="container" >
            <div class="page-header" align="center" style='font-color:#2489EE;'>
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입</h3>
                </div>
            </div>
            
        <div class="row align-items-center justify-content-center" style="height:100vh;"> 
            <div class="col-sm-6 col-md-offset-3" >
                <form id="f_signUp" role="form" method="POST">
                    <div class="form-group" >
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" id="inputName" name="mem_name" placeholder="이름을 입력해 주세요">
                    </div>
                    
                    <div class="form-inline">
                    <div class="form-group">
                        <label for="InputEmail">이메일 주소(ID)</label><br>
                        <input type="email" style='width:250px;' class="form-control" id="InputEmail" name="mem_id1" placeholder="이메일 주소를 입력해주세요">&nbsp;@&nbsp;
                    	<!--  -->
             <div class='input-group'>      	
            <button class="btn btn-default dropdown-toggle form-control" style='wdith:250px;'   type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
              	이메일주소(필수사항)	
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu"  aria-labelledby="dropdownMenu1" id="mydd" >
              <li><a href="#"><span style='font-size:16px;'>naver.com</span></a></li>
              <li><a href="#"><span style='font-size:16px;'>gmail.com</span></a></li>
              <li><a href="#"><span style='font-size:16px;'>daum.net</span></a></li>
              <li><a href="#"><span style='font-size:16px;'>yahoo.co.kr</span></a></li>
            </ul>
            </div> 
    
                    </div>
                    </div><br>
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" id="inputPassword" name="mem_pw" onchange="check()" placeholder="비밀번호를 입력해주세요">
                    	&nbsp;&nbsp;<span id="check"></span>
                    </div>
                    <div class="form-group">
                        <label for="inputPasswordCheck">비밀번호 확인</label>
                        <input type="password" class="form-control" id="inputPasswordCheck" onchange="check()" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                    	&nbsp;&nbsp;<span id="same"></span>
                    </div>
                    
                    <!-- HP -->
                    <div class="form-inline">
                    <div class="form-group">
                        <label>휴대폰 번호</label><br>
                        <input type="tel" class="form-control" style='width:150px;' id="inputMobile2" name="mem_hp1" >&nbsp;―&nbsp;
                        <input type="tel" class="form-control" style='width:150px;' id="inputMobile3" name="mem_hp2" >&nbsp;―&nbsp;
                        <input type="tel" class="form-control" style='width:150px;' id="inputMobile1" name="mem_hp3" >&nbsp;
                    </div>
                    </div><br>
                    <!-- HP -->
                    <div class='form-group'>
                    <label for="company">회사명</label><br>
                    <input type="text" class="form-control" id='company' name='mem_companyname' placeholder='선택사항'>
                    </div>
                    <div class='form-group'>
                    <label for="position">직급</label><br>
                    <input type="text" class="form-control" id='position' name='mem_position' placeholder='선택사항'>
                    </div>
					<div class="form-inline">
                    <div class="form-group">
                    <label for="sample6_postcode">회사주소(선택사항)</label><br>
                    <input type="text" class="form-control" style='width:200px;'id="sample6_postcode"  placeholder="우편번호">
			<input type="button" class="btn-info" class='border' onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
			</div>
			</div>
			<input type="text" class="form-control" id="sample6_address" name="mem_addr2" placeholder="주소"><br>
			<input type="text" class="form-control" id="sample6_extraAddress" name="mem_addr1" placeholder="상세주소"><br>
			<div class="form-inline">
                    <div class="form-group">
                        <label>내선 번호(선택사항)</label><br>
                        <input type="tel" class="form-control" style='width:150px;' id="inputMobile1" name="mem_companyphone2" >&nbsp;―&nbsp;
                        <input type="tel" class="form-control" style='width:150px;' id="inputMobile2" name="mem_companyphone3" >&nbsp;―&nbsp;
                        <input type="tel" class="form-control" style='width:150px;' id="inputMobile3" name="mem_companyphone1" >&nbsp;
                    </div>
                    </div><br>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


                    

                    <div class="form-group text-center">
<!--                         <button id="join-submit" class="btn btn-primary" onClick="signUp()"> -->
<!--                             회원가입<i class="fa fa-check spaceLeft"></i> -->
<!--                         </button> -->
                        <a id="join-submit" href="javascript:signUp()" class="btn btn-primary">회원가입</a>
                        <button type="submit" class="btn btn-warning">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                </form>
            </div>
		</div>
        </article>
        <script type="text/javascript">
        $(function () {
        	  $("#mydd a").click(function () {
        	    $("#dropdownMenu1").html($(this).html() + ' <span class="caret"></span>');
        	    
        	  });
        	});
        </script>
<!--         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script> -->
    </body>
</html>