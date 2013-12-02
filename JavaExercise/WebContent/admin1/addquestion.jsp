<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/image/favorite.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/index.css" type="text/css" />
<link href="/css/admin.css" rel="stylesheet" type="text/css" />
<title>大连理工大学JAVA上机平台</title>
</head>
<body>
	<%@ include file="/template/header.jsp"%>
	<script src="/js/ckeditor/ckeditor.js"></script>
	<link href="/js/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
	<script src="/js/uploadify/jquery.uploadify.js" type="text/javascript"></script>
	<link href="/css/admin.css" rel="stylesheet" type="text/css" />
	<div class="maindiv">
		<form id="news" method="post" action="/admin/QuestionHandler?cmd=add"
			style="margin: 20px">
			<p>
				题目：
				<textarea id="editor1" class="ckeditor" name="editor1" onfocus='myfocus(1);'></textarea>
			</p>
			<p>
				答案A：
				<textarea id="editor2" class="ckeditor" name="editor2" onfocus='myfocus(2);'></textarea>
			</p>
			<p>
				答案B：
				<textarea id="editor3" class="ckeditor" name="editor3" onfocus='myfocus(3);'></textarea>
			</p>
			<p>
				答案C：
				<textarea id="editor4" class="ckeditor" name="editor4" onfocus='myfocus(4);'></textarea>
			</p>
			<p>
				答案D：
				<textarea id="editor5" class="ckeditor" name="editor5" onfocus='myfocus(5);'></textarea>
			</p>
			<p>
				正确答案：<select name="rightanswer" id="rightanswer">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<option value="D">D</option>
				</select>
			</p>		
		</form>
		<a class="button white" onclick="senddata();">提交</a>
		<input type="file" name="uploadify" id="uploadify" />
	</div>
	<%@ include file="/template/footer.jsp"%>
</body>
</html>
<script>
	var lighttext;
	function myfocus(data){
		lighttext=data;
	}
    $(function () {
        	CKEDITOR.replace( 'editor1',
        			{
        			customConfig : '/js/myconfig.js'
        			});
        	CKEDITOR.replace( 'editor2',
        			{
        			customConfig : '/js/myconfig.js'
        			});
        	CKEDITOR.replace( 'editor3',
        			{
        			customConfig : '/js/myconfig.js'
        			});
        	CKEDITOR.replace( 'editor4',
        			{
        			customConfig : '/js/myconfig.js'
        			});
        	CKEDITOR.replace( 'editor5',
        			{
        			customConfig : '/js/myconfig.js'
        			});
        	CKEDITOR.instances.editor1.on('focus', myfocus);
        	CKEDITOR.instances.editor2.on('focus', myfocus);
        	CKEDITOR.instances.editor3.on('focus', myfocus);
        	CKEDITOR.instances.editor4.on('focus', myfocus);
        	CKEDITOR.instances.editor5.on('focus', myfocus);
        	//var con=$(".ckeditor");
        	//con.focus(function(){lighttext=this;});
        $("#uploadify").uploadify({
            //指定swf文件
            'swf': '/js/uploadify/uploadify.swf',
            //后台处理的页面
            'uploader': '/admin/UploadFileHandler',
            //按钮显示的文字
            'buttonText': '上传图片',
            //显示的高度和宽度，默认 height 30；width 120
            //'height': 15,
            //'width': 80,
            //上传文件的类型  默认为所有文件    'All Files'  ;  '*.*'
            //在浏览窗口底部的文件类型下拉菜单中显示的文本
            'fileTypeDesc': '*',
            //允许上传的文件后缀
            'fileTypeExts': '*.gif; *.jpg; *.png',
            //发送给后台的其他参数通过formData指定
            //'formData': { 'someKey': 'someValue', 'someOtherKey': 1 },
            //上传文件页面中，你想要用来作为文件队列的元素的id, 默认为false  自动生成,  不带#
            //'queueID': 'fileQueue',
            //选择文件后自动上传
            'auto': true,
            //设置为true将允许多文件上传
            'multi': false,
            'onUploadSuccess': function (file, data, response) {//当上传完成后的回调函数，ajax方式哦~~
            	var editor=lighttext.editor;
            	
            	
            	//var editor=lighttext;
            	if(editor!=null)
            	{
	                if (editor.mode == 'wysiwyg') {
	                    editor.insertHtml(data);
	                }
	                else
	                    alert('You must be in WYSIWYG mode!');
            	}
        }
        });
        });
    function senddata()
    {
    	$.post("/admin/QuestionHandler?cmd=add",
    			{editor1:CKEDITOR.instances.editor1.document.getBody().getHtml(),
    		editor2:CKEDITOR.instances.editor2.document.getBody().getHtml(),
    		editor3:CKEDITOR.instances.editor3.document.getBody().getHtml(),
    		editor4:CKEDITOR.instances.editor4.document.getBody().getHtml(),
    		editor5:CKEDITOR.instances.editor5.document.getBody().getHtml(),
    		rightanswer:$("#rightanswer").val()},function (data)
    		{
    			if(data=="True"){
    				alert("添加成功");
    				window.close();
    			}
    			else alert("添加失败");
    			
    		});
    }
</script>