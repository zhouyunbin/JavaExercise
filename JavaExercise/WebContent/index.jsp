<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/image/favorite.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/index.css" type="text/css"/>
<title>大连理工大学JAVA上机平台</title>
<%@ page import="datacontroller.NewsController"%>
<%@ page import="model.News"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="datacontroller.VideoController"%>
<%@ page import="model.Video"%>
</head>
<body>
	<%@ include file="/template/header.jsp" %>
	<div style="width: 950px;margin: 0 auto;height:300px">
		<div class="newsdiv" style="margin:0px;width:350px;height:300px;float:left">
		    <div class="headt">
		    	<h1 class="newstitle"><img src="/image/text_01.png" />新闻公告<a href="/newslist.jsp"><span>更多</span></a></h1>
		    </div>
		    <ul class="newsul">
		    <%
		    	NewsController nc=new NewsController(); 
				List<News> li=nc.getListByColumn(0, 10);
				int i;
				for(i=0;i<li.size();i++)
				{
			%>
		        <li><a href="/shownews.jsp?informno=<%=li.get(i).getNewsid() %>"><span class="sidespan"><%=li.get(i).getTitle() %></span><span class="sidetimespan"><%= DateFormat.getDateInstance().format(li.get(i).getCreatetime()) %></span></a></li>
		    <% } %>
		   </ul>
		</div>
		<div class="newsdiv" style="margin:0 0 0 5px;width:350px;height:300px;float:left">
		    <div class="headt">
		    	<h1 class="newstitle"><img src="/image/text_01.png" />最新视频<a href="/videolist.jsp"><span>更多</span></a></h1>
		    </div>
		    <%
		    	VideoController vc=new VideoController();
		    	List<Video> n=vc.getListByColumn(0, 1);
		    %>
		    <embed src="<%=n.get(0).getPath() %>" 
	quality="high" width="345" height="270" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash">
	</embed></center>
		</div>
		<div class="newsdiv" style="margin:0 0 0 5px;width:200px;height:300px;float:left">
		<%
			Student stu=(Student)session.getAttribute("student");
			if(stu==null)
			{
		%>
		
			<h1 style="font-size: 14px;"><center>学生登录</center></h1><br/>
			<table>
			<tr><td>学号:</td><td><input type="text" id='username' style="width:120px"/></td></tr>
			<tr><td>密码:</td><td><input type="password" id='upwd' style="width:120px"></td></tr>
			</table>
			<a href="#" onclick="login();"><div title="value">登录</div></a><br/>
			<p style='width:180px;white-space:normal;margin:5px '>注意：未登录用户禁止在线测验和在线code，请登录后再使用，如果您没有学生账户，请联系管理员开通！</p>
			<%
				}
			else{
				
			}
			%>
		</div>
	</div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>
<script>
function login(){
	$.post("/UserHandler?cmd=login",{username:$("#username").val(),password:$("#upwd").val()},function(data){
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