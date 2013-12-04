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
	<script src="/js/jquery.countdown.js" type="text/javascript" charset="utf-8"></script>
	<div class="maindiv" >
	<%@ page import="datacontroller.ExamController"%>
	<%@ page import="datacontroller.ExamitemController"%>
	<%@ page import="datacontroller.ExamcodeController"%>
		<%@ page import="model.Exam"%>
		<%@ page import="model.Examitem"%>
		<%@ page import="model.Examcode"%>
		<%@ page import="java.util.List"%>
		<%@ page import="java.util.Date"%>
		<%
		ExamController ec=new ExamController(); 
		Exam e=ec.getExambyId(Integer.parseInt(request.getParameter("informno")));
		
		%>
   <form id="news" method="post" style="margin:20px">
	    <p>考试标题：<%=e.getExamtitle() %></p>
	    <p>考试说明：<%=e.getEdescribe() %></p>
	    <p>考试时长(分钟)：<%=e.getExamtime() %></p>
	    <p>剩余时间:<div id="counter" ></div></p>
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
	    <div class="item"><a target="_blank" href="/question2.jsp?informno=<%=lei.get(i).getQuestionid()%>">
	    <% if(nc.getQuestionbyId(lei.get(i).getQuestionid()).getTitle().length()>23){%>
	    <%=(i+1)+". "+nc.getQuestionbyId(lei.get(i).getQuestionid()).getTitle().substring(3,23)%>
	    <%}else{ %>
	     <%=(i+1)+". "+nc.getQuestionbyId(lei.get(i).getQuestionid()).getTitle().substring(3)%>
	     <% }%>
	    </a><br/></div>
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
	    <div class="item"><a target="_blank" href="/showCode2.jsp?informno=<%=lc.get(i).getCodeid()%>"><%=i+1 %>. <%=cc.getCodebyId(lc.get(i).getCodeid()).getTitle()%></a><br/></div>
	    <% }%>
	    
	    </div></div>
	    <a class="button white" onclick="addnews();">完成考试!</a>
	    </div>
	   <br/>
   </form>
	</div>
	<div id="loading" style="display:none"></div>  
	<%@ include file="/template/footer.jsp" %>
</body>
</html>
<%
		Date d1=(Date)request.getSession().getAttribute("starttime");
		int t1=(int)((new Date()).getTime()-d1.getTime())/1000/60;
		int result=0;
		if(t1<e.getExamtime())
			result=e.getExamtime()-t1;
		
	%>
<script>
	function addnews(){
		var ajaxbg = $("#background,#progressBar"); 
		var conf = confirm('确认交卷吗?');
		if(conf)
		{
		jQuery("#loading").fadeIn();
		$.post("/RunexamHandler?cmd=finish",function(data){
			if(data=="True"){
				alert("交卷成功!");
				window.close();
			}
		});
		
		jQuery("#loading").fadeOut() ;
		}	
	};
	//time conuter
	
     $(function(){
       $('#counter').countdown({
         image: '/image/digits.png',
         startTime: '<%=String.format("%02d", result/60)%>:<%=String.format("%02d", result%60)%>:00',
         timerEnd: function endexam(){
     		$.post("/RunexamHandler?cmd=finish",function(data){
    			if(data=="True"){
    				alert("交卷成功!");
    			}
    		});
    	},
         format: 'hh:mm:ss',
         stepTime: 60
       });
     });
    

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
.myscroll a p{
	float:left;
	margin-left:3px;
}
.myscroll a{
float:left; overflow:hidden;word-break:break-all;height:20px; line-height:20px;width:350px;
}
.item{
	display:block;
	border:1px #111;
	margin:2px;
}
</style>