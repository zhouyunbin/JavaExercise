<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/image/favorite.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/index.css" type="text/css"/>
<link href="/css/admin.css" rel="stylesheet" type="text/css" /> 
<title>大连理工大学JAVA上机平台</title>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="datacontroller.VideoController"%>
<%@ page import="model.Video"%>
</head>
<body>
	<%@ include file="/template/header.jsp" %>
	<div style="width: 950px;margin: 0 auto;height:300px">
		<div style="margin:30px">
		<table>
		<tr><td>姓名:</td><td><input id="name" value="123" readonly></td></tr>
		<tr><td>学号:</td><td><input id="stuid" value="123" readonly></td></tr>
		<tr><td>邮箱:</td><td><input id="email" value="123" readonly></td></tr>
		</table>
		<a id='getresult' class="button white" onclick="changedatail();">修改资料</a>
		<a id='getresult' class="button white" onclick="addnews();">修改密码</a>
		</div>
	</div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>
<script>
function changedatail(){
	$("#name").attr();
	
}
function save(){
	$.post("/UserHandler?cmd=change",{username:$("#username").val(),password:$("#upwd").val()},function(data){
		if(data=="True")
		{
			window.location.href="/";
		}
		else
		{
			alert("用户名或密码错误!");
			$("#username").val("");
			$("#upwd").val("");
		}
	});
}
</script>