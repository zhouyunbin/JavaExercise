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
</head>
<body>
	<%@ include file="/template/header.jsp" %>
	<div class="maindiv" >
	<%@ page import="datacontroller.VideoController"%>
<%@ page import="model.Video"%>
<%
VideoController ff=new VideoController();
Video fa=ff.getVideobyId(Integer.parseInt(request.getParameter("informno")));
%>
   <form id="news" method="post" action="/admin/VideoHandler?cmd=modify" style="margin:20px">
   <input name="uid" style="display:none" value="<%= fa.getVideoid()%>">
	    <p>视频标题：<input  name="title" size="100" style="margin:2px" value="<%= fa.getVname()%>"/></p>
	    <p>视频描述：<textarea  name="describe" size="240" style="margin:2px;height:50px;width:630px;" /><%=fa.getVdescribe() %></textarea></p>
	    <p>视频链接：<input  name="link" size="100" style="margin:2px" value="<%= fa.getPath()%>"/></p>
	    <p>例如:"http://player.youku.com/player.php/sid/XNjM3NDEwMDky/v.swf"，将视频上传至土豆，
	    优酷等视频网站，获取其flash地址即可</p>
	    <a class="button white" onclick="$(news).submit();">提交</a>
   </form>
	</div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>