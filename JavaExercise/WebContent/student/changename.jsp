<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/image/favorite.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/index.css" type="text/css"/>
<link rel="stylesheet" href="/css/admin.css" type="text/css"/>
<title>大连理工大学JAVA上机平台</title>
</head>
<body>
	<%@ include file="/template/header.jsp" %>
	<div style="width: 950px;margin: 0 auto;height:580px;border:1px solid;
         background: url(/image/bkg-tile-2.png) repeat left top;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-shadow: 0 0 5px #ddd;"><br/><br/><br/><br/>
		<center>
		新姓名：<input type="text" id="uname">
		
	<a class="button white" onclick="execute();">提交</a></center></div>
	
	<%@ include file="/template/footer.jsp" %>
</body>
</html>
<script>
function execute()
{
	$.post("/StudentHandler?cmd=changename",{name:$("#uname").val()},function(data){
		if(data=="True"){
			alert("修改成功!");
			window.close();
		}
		else 
			alert("由于未知原因，失败");
	});
}
</script>