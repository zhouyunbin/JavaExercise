<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>JAVA上机后台管理系统</title>
	<meta name="author" content="zyb">
	<link rel="shortcut icon" href="/image/favicon.ico">
	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="/css/admin.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>		
</head>
<body>
		<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">

				<a class="brand" href="index.jsp"> <img alt="Charisma Logo" src="img/logo20.png" /> <span>JAVA上机后台管理系统</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone">主题</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
					<%@ page import="model.User"%>
					<%
						User u=(User)request.getSession().getAttribute("user");
							
					%>
						<i class="icon-user"></i><span class="hidden-phone"><%=u.getUsername() %></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="ajax-link" href="./changepwd.jsp">修改密码</a></li>
						<li class="divider"></li>
						<li><a class="ajax-link" href="./changemail.jsp">修改邮箱</a></li>
						<li class="divider"></li>
						<li><a class="ajax-link" href="./changename.jsp">修改部门</a></li>
						<li class="divider"></li>
						<li><a class="ajax-link" href="./logout.jsp">注销</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="/">Visit Site</a></li>
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->
		<div class="container-fluid">
		<div class="row-fluid">				
			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">信息管理</li>
						<li><a class="ajax-link" href="./main.jsp"><i class="icon-home"></i><span class="hidden-tablet">个人信息</span></a></li>
						<li><a class="ajax-link" href="./newslist.jsp" ><i class="icon-eye-open"></i><span class="hidden-tablet">新闻管理</span></a></li>
						<li><a class="ajax-link" href="./Videolist.jsp"><i class="icon-edit"></i><span class="hidden-tablet">视频管理</span></a></li>
						<li><a class="ajax-link" href="./examlist.html"><i class="icon-list-alt"></i><span class="hidden-tablet">考试管理</span></a></li>
						<li><a class="ajax-link" href="./questionlist.jsp"><i class="icon-font"></i><span class="hidden-tablet">试题管理</span></a></li>
						<li><a class="ajax-link" href="./codelist.jsp"><i class="icon-picture"></i><span class="hidden-tablet">编程题管理</span></a></li>
						<li><a class="ajax-link" href="./messagelist.jsp"><i class="icon-align-justify"></i><span class="hidden-tablet">留言板管理</span></a></li>
						<li class="nav-header hidden-tablet">人员管理</li>		
						<li><a class="ajax-link" href="./userlist.html"><i class="icon-calendar"></i><span class="hidden-tablet">管理员管理</span></a></li>
						<li><a class="ajax-link" href="./studentlist.html"><i class="icon-th"></i><span class="hidden-tablet">学生管理</span></a></li>
					</ul>
					<label id="for-is-ajax" class="hidden-tablet" for="is-ajax" style="display:none"><input id="is-ajax" type="checkbox" checked> Ajax on menu</label>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			<div id="content" class="span10" style="height:550px">
			<div style="margin:30px">
<table style="font-size:20px" class='brand'>
<tr>
<td>当前用户:</td><td><%=u.getUsername() %></td></tr>
<tr><td>邮箱:</td><td><%=u.getEmail()%></td></tr>
<tr><td>部门:</td><td><%=u.getDepartment() %></td>
</tr>
</table>
</div>
			</div>
		</div>
		</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>
	
		
</body>
</html>
