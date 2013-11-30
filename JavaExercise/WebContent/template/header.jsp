<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/header.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
<%@ page import="model.Student"%>
<div class="menu_navcc">
<img src="/image/banner.gif">
<div class="menu_nav clearfix">
<ul class="nav_content">
<li><a href="/" title="首页"><span>首页</span></a></li>
<li><a href="/newslist.jsp" title="新闻公告"><span>新闻公告</span></a></li>
<li><a href="/videolist.jsp" title="上机视频"><span>上机视频</span></a></li>
<li><a href="/codelist.jsp" title="在线code"><span>在线code</span></a></li>
<li><a href="/examlist.jsp" title="在线测验"><span>在线测验</span></a></li>
<li><a href="/faqlist.jsp" title="FAQ"><span>FAQ</span></a></li>
<% 
	Student s=(Student)session.getAttribute("student");
	if(s!=null)
	{
%>
<li><a href="/student/stumanage.jsp" title="welcome"><span>欢迎您，<%=s.getSname() %></span></a></li>
<li><a href="/logout.jsp" title="注销"><span>注销</span></a></li>
<% } %>
</ul>
<div class="menu_nav_right">
</div>
</div>
</div>