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
	    <p>程序标题：<input  name="title" size="100" style="margin:2px" /></p>
	    <p>程序描述：<textarea  name="describe"  style="margin:2px;height:50px;width:630px;" /></textarea></p>
	    <p>正确代码：<textarea id='code'  name="code"  style="margin:2px;height:150px;width:630px;" /></textarea></p>
	    <p>出题代码：<textarea  name="content" style="margin:2px;height:150px;width:630px;" /></textarea></p>
	    <p>注意:出题代码为学生做题时显示的代码，将考点代码删除提交即可，也可加部分注释提示</p>
	    <p id='result' style="display:none">运行结果：<textarea id='result2' name='result' style="margin:2px;height:150px;width:630px;" readonly></textarea></p>
	    <a id='getresult' class="button white" onclick="addnews();">提交</a>
	    <a id='confirm1' class="button white" style="display: none;" onclick="$(news).submit();">确认</a>
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