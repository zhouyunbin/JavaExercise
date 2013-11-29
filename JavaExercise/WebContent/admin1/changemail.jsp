<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div style="width: 950px;margin: 0 auto;height:580px;border:1px solid;
         background: url(/image/bkg-tile-2.png) repeat left top;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-shadow: 0 0 5px #ddd;"><br/><br/><br/><br/>
		<center>
		新邮箱：<input type="text" id="mail" >
		
	<a class="button white" onclick="execute();">提交</a></center></div>
<script>
function checkEmail(cEmail)  //验证邮箱地址是否正确，cEmail为邮箱地址。
{
	 var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	 if (filter.test(cEmail)) return true;
	 else {

	 return false;
	 }
  }
function execute()
{
	if(checkEmail($("#mail").val()))
	{
	$.post("/UserHandler?cmd=changemail",{email:$("#mail").val()},function(data){
		if(data=="True"){
			alert("修改成功!");
			window.close();
		}
		else 
			alert("由于未知原因，失败");
	});}
	else alert("邮箱格式不正确");
}
</script>