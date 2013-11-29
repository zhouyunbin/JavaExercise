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
   <form id="news" method="post" style="margin:20px">
	    <p>学号前缀：<input  id="prefix" size="100" style="margin:2px" /></p>
	    <p>起始号码：<input  id="startnumber" size="100" style="margin:2px"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/></p>
	    <p>终止号码：<input  id="endnumber" size="100" style="margin:2px"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/></p>
	    <p>初始密码：<input  id="pwd" size="100" style="margin:2px" /></p>
		<p>如前缀为S200992，起始号码为001，中止号码为400，最终会生成S200992001-S200992400的学生</p>
	    
	    
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
		$.post("/StudentHandler?cmd=addstu",
				{prefix:$("#prefix").val(),start:$("#startnumber").val(),
			end:$("#endnumber").val(),pwd:$("#pwd").val()},
			function(data){
			if(data=="True") alert("添加成功");
			else alert("添加失败");
			$("#confirm1").show();
		});
		jQuery("#loading").fadeOut() ;
	}
</script>