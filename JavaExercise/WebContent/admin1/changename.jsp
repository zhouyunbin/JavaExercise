<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div style="width: 950px;margin: 0 auto;height:580px;border:1px solid;
         background: url(/image/bkg-tile-2.png) repeat left top;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-shadow: 0 0 5px #ddd;"><br/><br/><br/><br/>
		<center>
		部门名称：<input type="text" id="uname">
		
	<a class="button white" onclick="execute();">提交</a></center></div>
	
<script>
function execute()
{
	$.post("/UserHandler?cmd=changedepart",{department:$("#uname").val()},function(data){
		if(data=="True"){
			alert("修改成功!");
			window.close();
		}
		else 
			alert("由于未知原因，失败");
	});
}
</script>