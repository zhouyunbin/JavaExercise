<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/header.css" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
<%@ page import="model.Student"%>
<%@ page import="model.User"%>
<div class="menu_navcc">
<div style="width:950px;height:25px;background: #0099ff;padding-top:5px
">
<%
	Student s=(Student)session.getAttribute("student");
	User us=(User)session.getAttribute("user");
	if(s==null&&us==null){
		response.sendRedirect("/login.html");
		}else{
%>
<a href="http://www.dlut.edu.cn" style="margin-left:15px;color:#fff;font-size:12px;">大工首页</a>
<% if(s!=null){ %>
<a href="/student/stumanage.jsp" style="float:right;margin-right:15px;color:#fff;font-size:12px;">欢迎您，<%=s.getSname() %></a>
<%}} %>
</div>
<img src="/image/logo.png" style="width:950px;">
<div class="menu_nav clearfix">
<ul class="nav_content">
<li><a href="/" title="首页"><span>首页</span></a></li>
<li><a href="/newslist.jsp" title="新闻公告"><span>新闻公告</span></a></li>
<li><a href="/videolist.jsp" title="上机视频"><span>上机视频</span></a></li>
<li><a href="/codelist.jsp" title="在线code"><span>在线code</span></a></li>
<li><a href="/questionlist.jsp" title="在线答题"><span>在线答题</span></a></li>
<li><a href="/examlist.jsp" title="在线考试"><span>在线考试</span></a></li>
<li><a href="/faqlist.jsp" title="FAQ"><span>FAQ</span></a></li>
<li><a href="/logout.jsp" title="注销"><span>注销</span></a></li>
</ul>
<div class="menu_nav_right">
</div>
</div>
</div>