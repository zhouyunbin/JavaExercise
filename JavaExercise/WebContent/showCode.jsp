<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/image/favorite.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/index.css" type="text/css"/>
<link rel="stylesheet" href="/css/admin.css" type="text/css"/>
<%@ page import="datacontroller.CodeController"%>
<%@ page import="model.Code"%>
<title>大连理工大学JAVA上机平台</title>
</head>
<body>
	<%@ include file="/template/header.jsp" %>
	<div style="width: 950px;margin: 0 auto;height:580px;border:1px solid;
         background: url(/image/bkg-tile-2.png) repeat left top;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-shadow: 0 0 5px #ddd;">
		<%
		CodeController nc=new CodeController(); 
		int id=Integer.parseInt(request.getParameter("informno"));
		Code n=nc.getCodebyId(id);
		
		%>
	<h1><center><%=n.getTitle() %></center></h1><br/>
	<hr/>
	<center><p style="margin:10px">说明:<%=n.getCdescribe() %></p></center>
	<hr/>
	<form id="pushcode" action="/admin/CompileAndRunJavaFile?cmd=execute" method="post">
	<input name='codeid' style="display:none" value='<%=n.getCodeid() %>'/>
	<center><textarea name="code" style="width:800px;height:400px">
	<%=n.getCcontent() %></textarea>
	<a class="button white" onclick="$(pushcode).submit();">提交</a></center>
	</form>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>