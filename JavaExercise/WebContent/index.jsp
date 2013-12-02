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
<%@ page import="datacontroller.FaqController"%>
<%@ page import="model.Faq"%>
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
		
				 <div class="headt">
		    	<h1 class="newstitle"><img src="/image/text_01.png" />最新FAQ<a href="/faqlist.jsp"><span>更多</span></a></h1>
		    </div>
		    <ul class="newsul">
		    <%
		    	FaqController cc=new FaqController(); 
				List<Faq> lic=cc.getListByColumn(0, 10);
				for(i=0;i<lic.size();i++)
				{
			%>
		        <li><a href="/showfaq.jsp?informno=<%=lic.get(i).getNewsid() %>"><span class="sidespan"><%=lic.get(i).getTitle() %></span></a></li>
		    <% } %>
		   </ul>
		</div>
	</div>
	<div class="footer" style="height:30px;margin-bottom:-10px;padding-top:10px;font-size:16px">
 友情链接：<a href="http://ssdut.dlut.edu.cn">大连理工大学软件学院</a>
 <a href="http://teach.dlut.edu.cn">大连理工大学教务处</a>
 <a href="http://career.dlut.edu.cn">大连理工大学招生就业处</a>
  <a href="http://www.edlut.com">大连理工大学继续教育学院</a>
  <a href="http://gs.dlut.edu.cn">大连理工大学研究生院</a>
</div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>
