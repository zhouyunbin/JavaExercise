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
	<div style="width: 950px;margin: 0 auto;min-height:380px;border:1px solid;
         background: url(/image/bkg-tile-2.png) repeat left top;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-shadow: 0 0 5px #ddd;">
		<div style="margin:20px">
	题目：<h3 id="title">test</h3><br/>
	A:<h3 id="answera">test</h3><br/>
	B:<h3 id="answerb">test</h3><br/>
	C:<h3 id="answerc">test</h3><br/>
	D:<h3 id="answerd">test</h3><br/>
	
	请选择答案：<select name="rightanswer" id="rightanswer">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
				</select>
				<br/><br/><br/>
	<a id='next' class="button white" onclick="next();">下一题</a>
	<a id='previous' class="button white" onclick="previous();">上一题</a>
	</div></div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>
<script>
$(function (){
	$.post("/student/Stuquestion?cmd=question&id="+getQueryString('informno'),function(data)
			{
				var q=$.parseJSON(data);
				$("#title").html(q.title);
				$("#answera").html(q.selectionA);
				$("#answerb").html(q.selectionB);
				$("#answerc").html(q.selectionC);
				$("#answerd").html(q.selectionD);
			});
});
function next()
{
	$.post("/student/Stuquestion?cmd=next&id="+getQueryString('informno'),{answer:$('#rightanswer').val()},function(data)
			{
				saveanswer();
				var q=$.parseJSON(data);
				if(q.isright==1) alert("您答对了!");
				else alert("您答错了!");
				if(q.isend==1) alert("您已经答完所有题目！");
				else {
					window.location.href="/question.jsp?informno="+q.nextid;
				}
			});
}
function previous()
{
	$.post("/student/Stuquestion?cmd=previous&id="+getQueryString('informno'),{answer:$('#rightanswer').val()},function(data)
			{
				saveanswer();
				var q=$.parseJSON(data);
				if(q.isright==1) alert("您答对了!");
				else alert("您答错了!");
				if(q.isend==1) alert("您已到达第一道题!");
				else {
					window.location.href="/question.jsp?informno="+q.nextid;
				}
			});
}
function saveanswer()
{
	$.post("/student/Stuquestion?cmd=save&id="+getQueryString('informno'),function(data)
			{
				
			});
}
function getQueryString(name)
{
	  var reg = new RegExp("(^|&amp;)" + name + "=([^&amp;]*)(&amp;|$)", "i");
	  var r = window.location.search.substr(1).match(reg);
	  if (r == null)
	  return null;
	  else
	  return unescape(r[2]);
}
</script>