<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/image/favorite.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/index.css" type="text/css"/>
<title>大连理工大学JAVA上机平台</title>
</head>
<body>
	<%@ include file="/template/header.jsp" %>
	<div style="width: 950px;margin: 0 auto;height:300px">
		<div class="newsdiv" style="margin:0px;width:350px;height:300px;float:left">
		    <div class="headt">
		    	<h1 class="newstitle"><img src="/image/text_01.png" />新闻公告<a href="#"><span>更多</span></a></h1>
		    </div>
		    <ul class="newsul">
		        <li><a href="#"><span class="sidespan">软件学院召开深入开展党的群众路线教育实践活动动员大会</span><span class="sidetimespan">07-28</span></a></li>
		        <li><a href="#"><span class="sidespan">软件学院召开深入开展党的群众路线教育实践活动动员大会</span><span class="sidetimespan">07-28</span></a></li>
		        <li><a href="#"><span class="sidespan">软件学院召开深入开展党的群众路线教育实践活动动员大会</span><span class="sidetimespan">07-28</span></a></li>
		   </ul>
		</div>
		<div class="newsdiv" style="margin:0 0 0 5px;width:350px;height:300px;float:left">
		    <div class="headt">
		    	<h1 class="newstitle"><img src="/image/text_01.png" />最新题目<a href="#"><span>更多</span></a></h1>
		    </div>
		    <ul class="newsul">
		        <li><a href="#"><span class="sidespan">软件学院召开深入开展党的群众路线教育实践活动动员大会</span><span class="sidetimespan">07-28</span></a></li>
		        <li><a href="#"><span class="sidespan">软件学院召开深入开展党的群众路线教育实践活动动员大会</span><span class="sidetimespan">07-28</span></a></li>
		        <li><a href="#"><span class="sidespan">软件学院召开深入开展党的群众路线教育实践活动动员大会</span><span class="sidetimespan">07-28</span></a></li>
		   </ul>
		</div>
		<div class="newsdiv" style="margin:0 0 0 5px;width:200px;height:300px;float:left">
			<h1 style="font-size: 14px;"><center>学生登录</center></h1><br/>
			<table>
			<tr><td>用户名:</td><td><input type="text" id='username' style="width:120px"/></td></tr>
			<tr><td>密码:</td><td><input type="password" id='upwd' style="width:120px"></td></tr>
			</table>
			<a href='#'><div title="value">登录</div></a><br/>
			<p style='width:180px;white-space:normal;margin:5px '>注意：未登录用户禁止在线测验和在线code，请登录后再使用，如果您没有学生账户，请联系管理员开通！</p>
		</div>
	</div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>