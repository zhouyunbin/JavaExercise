<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/image/favorite.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/index.css" type="text/css"/>
<%@ page import="datacontroller.VideoController"%>
<%@ page import="model.Video"%>
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
		VideoController nc=new VideoController(); 
		int id=Integer.parseInt(request.getParameter("informno"));
		Video n=nc.getVideobyId(id);
		if(n==null){
		%>
			<jsp:forward page="/404.html"/>
			<%} %>

		
	<h1><center><%=n.getVname() %></center></h1><br/>
	<hr/><center>
	<embed src="<%=n.getPath() %>" 
	quality="high" width="720" height="480" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash">
	</embed></center>
	<hr/>
	<p style="margin:10px;word-wrap:break-word;">视频说明:<%=n.getVdescribe() %></p>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>