<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String name = (String)session.getAttribute("MEM_NAME"); 
 String dept = (String)session.getAttribute("DEPT_NAME");
 String position = (String)session.getAttribute("MEM_POSITION");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <%@ include file="../common/common.jsp" %>
<title>Insert title here</title>
<style>
  
  /*
    DEMO STYLE
*/
@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

.es_bg-dark {
    background-color: #343a40 !important;
}
body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}

p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

/* .navbar { */
/*     padding: 15px 10px; */
/*     background: #fff; */
/*     border: none; */
/*     border-radius: 0; */
/*     margin-bottom: 40px; */
/*     box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1); */
/* } */

/* .navbar-btn { */
/*     box-shadow: none; */
/*     outline: none !important; */
/*     border: none; */
/* } */

.es_line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */
.es_wrapper {
    display: block;
    margin-bottom:80px;
}
.es_overlay {
    display: none;
    position: fixed;
    /* full screen */
    width: 100vw;
    height: 100vh;
    /* transparent black */
    background: rgba(0, 0, 0, 0.7);
    /* middle layer, i.e. appears below the sidebar */
    z-index: 998;
    opacity: 0;
    /* animate the transition */
    transition: all 0.5s ease-in-out;
}
/* display .overlay when it has the .active class */


#dismiss {
    width: 35px;
    height: 35px;
    position: absolute;
    /* top right corner of the sidebar */
    top: 10px;
    right: 10px;
    background:#6D7FCC;
    border:0;
    border-color:#6D7FCC;
}
#sidebar {
    min-width: 250px;
    max-width: 250px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: -250px;
    /* top layer */
    z-index: 9999;
    background: #7386D5;
    color: #fff;
    transition: all 0.3s;
}
#sidebar.active { 
    margin-left: 250px; 
} 

#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
    
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}
#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}


a[data-toggle="collapse"] {
    position: relative;
}

a[aria-expanded="false"]::before, a[aria-expanded="true"]::before {
    content: '\e259';
    display: block;
    position: absolute;
    right: 20px;
    font-family: 'Glyphicons Halflings';
    font-size: 0.6em;
}
a[aria-expanded="true"]::before {
    content: '\e260';
}


ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}
a.download {
    background: #fff;
    color: #7386D5;
}
a.article, a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}
.navbar-nav.navbar-center {
    position: absolute;
    left: 50%;
    transform: translatex(-50%);
}


/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
#content {
    width: calc(100% - 250px);
    padding: 40px;
    min-height: 100vh;
    transition: all 0.3s;
    position: absolute;
    top: 0;
    right: 250px;
}
#content.active {
    width: 100%;
}
</style>
</head>
<body>
<div class="es_wrapper">
 <!-- Sidebar -->
    <nav id="sidebar">

        <button id="dismiss" onclick="dismiss()">
            <i class="fas fa-arrow-left"></i>
        </button>

        <div class="sidebar-header">
            <h3><%=name %></h3><br>
            <h4><%=dept %>/<%=position %></h4>
        </div>
        <ul class="list-unstyled components">
            <li>
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">개인프로젝트</a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li>
                        <a href="#">개인프로젝트 1</a>
                    </li>
                    <li>
                        <a href="#">개인프로젝트 2</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">참여중인팀</a>
                <ul class="collapse list-unstyled" id="pageSubmenu">
                    <li>
                        <a href="#">Page 1</a>
                    </li>
                    <li>
                        <a href="#">Page 2</a>
                    </li>
                    <li>
                        <a href="#">Page 3</a>
                    </li>
                </ul>
                <a href="#">캘린더</a>
            </li>
            <li>
                <a href="#">회의실</a>
            </li>
            <li>
                <a href="#">채팅</a>
            </li>
            <li>
                <a href="#">내 보드</a>
            </li>
        </ul>
    </nav>
    <!-- Sidebar -->
<nav class="navbar navbar-default navbar-fixed-top es_bg-dark">
  <div class="container-fluid">
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="navbar-collapse collapse">
      <!-- 왼쪽 -->
      <ul class="nav navbar-nav navbar-left">
        <button type="button" id="sidebarToggle" class="btn btn-navbar" style="outline: none; margin-left:0px; margin-top:7px; margin-bottom:0px;">
        	<i class="fas fa-bars"></i>
        </button>
      
      </ul>
      
      <!-- 가운데 -->
      <ul class="nav navbar-nav navbar-center">
      <li><a href="#" style="font-size:1.5em;  color: white; ">4People</a></li>
      </ul>
      <!-- 오른쪽 -->
      <ul class="nav navbar-nav navbar-right">
      <li style="font-size:1.5em;  color: white; margin-top:15px"><%=name %></li>
      <li class="dropdown"   style="webkit-appearance:none;">
          <button class="btn btn-default" type="button" id="menu1" data-toggle="dropdown" style=" border:0; height:50px; background-color: #343a40; margin-bottom:5px; margin-left:10px;">
     <img src="http://icons.iconarchive.com/icons/papirus-team/papirus-status/48/avatar-default-icon.png" />
<!--        <span class="caret"></span> -->
    </button>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">프로필</a></li>
            <li><a href="#">설정</a></li>
            <li class="divider"></li>
            <li><a href="#">로그아웃</a></li>
          </ul>
        </li>
        </ul>
      <form class="navbar-form navbar-right" role="search">
      
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search" style="margin-top:5px;" >
        </div>
        <button type="submit" class="btn btn-default" style="margin-top:5px; margin-right:60px;">검색</button>
         
         <a class="btn btn-default" href="#" id="alertsDropdown" role="button" aria-haspopup="true" aria-expanded="false"  style="margin-right:10px;">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <a class="btn btn-default" href="#" id="messagesDropdown" role="button" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
      </form>
      
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="es_overlay"></div>
<script type="text/javascript">
function dismiss(){
   // hide sidebar
    $("#sidebar").removeClass("active");
    // hide overlay
    
}
    $(document).ready(function () {
        

        $('#dismiss, .es_overlay').on('click', function () {
            // hide sidebar
            $('#sidebar').removeClass("active");
            // hide overlay
        });
        

        $('#sidebarToggle').on('click', function () {
            // open sidebar
            $('#sidebar').addClass("active");
            // fade in the overlay
//             $('.overlay').addClass("active");
//             $('.collapse.in').toggleClass('in');
//             $('a[aria-expanded=false]').attr('aria-expanded', 'true');
        });
    });
</script>
</div>
</body>
</html>