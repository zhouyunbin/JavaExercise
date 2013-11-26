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
   <form id="news" method="post" action="/admin/CompileAndRunJavaFile?cmd=confirm" style="margin:20px">
	    <p>考试标题：<input  name="title" size="100" style="margin:2px" /></p>
	    <p>考试说明：<textarea  name="describe"  style="margin:2px;height:50px;width:630px;" /></textarea></p>
	    <p>考试时长(分钟)：<input name="examtime" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"></p>
	    <div style="width:100%;height:350px">
	    <div style="float:left"><p>单选题:</p>
	    <div style="overflow-y:scroll;width:400px;height:300px" class="myscroll">
	    <input type="checkbox" >aaabbbaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    
	    </div></div>
	    <div style="float:left;margin-left:10px"><p>编程题:</p>
	    <div style="overflow-y:scroll;width:400px;height:300px" class="myscroll">
	    <input type="checkbox" >aaabbbaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	     <input type="checkbox" >aaabbbaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaabbbaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    <input type="checkbox" >aaaaaabbbaaabbbaaabbb<br/>
	    
	    </div></div>
	    </div>
	   <br/>
	    <a id='getresult' class="button white" onclick="addnews();">提交</a>
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
		$.post("/admin/CompileAndRunJavaFile?cmd=add",{code:$("#code").val()},function(data){
			var result=$("#result");
			$("#result2").val(data);
			result.show();
			$("#confirm1").show();
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
</style>