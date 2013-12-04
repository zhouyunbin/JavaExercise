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
	<%@ page import="datacontroller.StuanswerController"%>
	<%@ page import="datacontroller.ExamController"%>
	<%@ page import="model.Stuanswer"%>
	<%@ page import="model.Student"%>
	<%@ page import="model.Exam"%>
	<%@ page import="java.util.List"%>
	<%
		StuanswerController stuc=new StuanswerController();
		Student sss=(Student)session.getAttribute("student");
		Exam exam=(Exam)session.getAttribute("exam");
		ExamController ecc=new ExamController();
		
		Stuanswer stu=stuc.getByStuidandExamidandQuestionid(sss.getStudentid(), exam.getExamid(),Integer.parseInt(request.getParameter("informno")), 1);
	%>
	题目：<h3 id="title" style="word-wrap:break-word;">test</h3><br/>
	A:<h3 id="answera" style="word-wrap:break-word;">test</h3><br/>
	B:<h3 id="answerb" style="word-wrap:break-word;">test</h3><br/>
	C:<h3 id="answerc" style="word-wrap:break-word;">test</h3><br/>
	D:<h3 id="answerd" style="word-wrap:break-word;">test</h3><br/>
	<%if(stu!=null){%>
	您已经答过该题<br/>
	<%}%>
	请选择答案：<select name="rightanswer" id="rightanswer">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
				</select>
				<br/><br/><br/>
	<a id='next' class="button white" onclick="next();">提交</a>
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
	<%if(stu!=null){%>
	$("#rightanswer").val('<%=stu.getStudentanswer()%>');
	<%}%>
});
function next()
{
	$.post("/RunexamHandler?cmd=question&questionid="+getQueryString('informno'),{answer:$("#rightanswer").val()},function(data)
			{
				if(data=="True")
				{
					alert("提交成功!");
					window.close();
				}
				else alert("提交失败");
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