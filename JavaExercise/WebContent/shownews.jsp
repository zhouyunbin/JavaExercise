<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/image/favorite.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/index.css" type="text/css"/>
<%@ page import="datacontroller.NewsController"%>
<%@ page import="model.News"%>
<title>大连理工大学JAVA上机平台</title>
</head>
<body>
	<%@ include file="/template/header.jsp" %>
	<div style="width: 950px;margin: 0 auto;min-height:380px;border:1px solid;
         background: url(/image/bkg-tile-2.png) repeat left top;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-shadow: 0 0 5px #ddd;">
		<%
		NewsController nc=new NewsController(); 
		int id=Integer.parseInt(request.getParameter("informno"));
		News n=nc.getNewsbyId(id);
		
		%>
	<h1><center><%=n.getTitle() %></center></h1><br/>
	<h3><center>发布时间:<%=n.getCreatetime() %> 作者:<%=nc.getAuthorByid(n.getAuthorid()) %></center></h3>
	<hr/>
	<div style="margin:10px"><%=n.getContent() %></div></div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>