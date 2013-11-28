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
	<%@ page import="datacontroller.ExamController"%>
	<%@ page import="datacontroller.ExamitemController"%>
	<%@ page import="datacontroller.ExamcodeController"%>
		<%@ page import="model.Exam"%>
		<%@ page import="model.Examitem"%>
		<%@ page import="model.Examcode"%>
		<%@ page import="java.util.List"%>
		<%
		ExamController ec=new ExamController(); 
		Exam e=ec.getExambyId(Integer.parseInt(request.getParameter("informno")));
		
		%>
   <form id="news" method="post" action="/admin/CompileAndRunJavaFile?cmd=confirm" style="margin:20px">
	    <p>考试标题：<%=e.getExamtitle() %></p>
	    <p>考试说明：<%=e.getEdescribe() %></p>
	    <p>考试时长(分钟)：<%=e.getExamtime() %></p>
	    <div style="width:100%;height:350px">
	    <%@ page import="datacontroller.QuestionController"%>
		<%@ page import="model.Question"%>
		<%
		ExamitemController eic=new ExamitemController();
		QuestionController nc=new QuestionController(); 
		List<Examitem> lei=eic.getByExamid(e.getExamid());
		
		%>
	    <div style="float:left"><p>单选题:</p>
	    <div style="overflow-y:scroll;width:400px;height:300px" class="myscroll">
	    <% for(int i=0;i<lei.size();i++) {%>
	    <div class="item"><%=nc.getQuestionbyId(lei.get(i).getQuestionid()).getTitle()%><br/></div>
	    <% }%>
	  
	    
	    </div></div>
	     <%@ page import="datacontroller.CodeController"%>
		<%@ page import="model.Code"%>
		<%
		CodeController cc=new CodeController(); 
		ExamcodeController ecc=new ExamcodeController();
		List<Examcode> lc=ecc.getByExamid(e.getExamid());
		
		%>
	    <div style="float:left;margin-left:10px"><p>编程题:</p>
	    <div style="overflow-y:scroll;width:400px;height:300px" class="myscroll">
	   <% for(int i=0;i<lc.size();i++) {%>
	    <div class="item"><%=cc.getCodebyId(lc.get(i).getCodeid()).getTitle()%><br/></div>
	    <% }%>
	    
	    </div></div>
	    </div>
	   <br/>
   </form>
	</div>
	<div id="loading" style="display:none"></div>  
	<%@ include file="/template/footer.jsp" %>
</body>
</html>
<script>
	function addnews(){
		var ajaxbg = $("#background,#progressBar"); 
		jQuery("#loading").fadeIn();
		$.post("/admin/ExamHandler?cmd=add",$('#news').serialize(),function(data){
			if(data=="True")
				alert("添加成功！");
			else 
				alert("由于未知原因，添加失败");
		});
		jQuery("#loading").fadeOut() ;
	}
</script>
<style>
.myscroll {
scrollbar-3dlight-color:#D4D0C8; /*- 最外左 -*/
scrollbar-highlight-color:#fff; /*- 左二 -*/
scrollbar-face-color:#E4E4E4; /*- 面子 -*/
scrollbar-arrow-color:#666; /*- 箭头 -*/
scrollbar-shadow-color:#808080; /*- 右二 -*/
scrollbar-darkshadow-color:#D7DCE0; /*- 右一 -*/
scrollbar-base-color:#D7DCE0; /*- 基色 -*/
scrollbar-track-color:#;/*- 滑道 -*/
}
.myscroll p{
	float:left;
	margin-left:3px;
}
.myscroll input{
	float:left;
	margin-top:4px;
}
.item{
	display:block;
	border:1px #111;
	margin:2px;
}
</style>