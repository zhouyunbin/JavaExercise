<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/image/favorite.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/index.css" type="text/css"/>

<title>大连理工大学JAVA上机平台</title>
</head>
<body>
	<%@ include file="/template/header.jsp" %>
	<div style="width: 950px;margin: 0 auto;height:680px">
	    <script src="/js/ckeditor/ckeditor.js"></script>
		<link href="/js/uploadify/uploadify.css" rel="stylesheet" type="text/css" /> 
		<script src="/js/uploadify/jquery.uploadify.js" type="text/javascript"></script>
		<link href="/css/admin.css" rel="stylesheet" type="text/css" /> 
<script>
    $(function () {
        $("#uploadify").uploadify({
            //指定swf文件
            'swf': '/js/uploadify/uploadify.swf',
            //后台处理的页面
            'uploader': '/admin/UploadFileHandler',
            //按钮显示的文字
            'buttonText': '上传文件',
            //显示的高度和宽度，默认 height 30；width 120
            //'height': 15,
            //'width': 80,
            //上传文件的类型  默认为所有文件    'All Files'  ;  '*.*'
            //在浏览窗口底部的文件类型下拉菜单中显示的文本
            'fileTypeDesc': '*',
            //允许上传的文件后缀
            'fileTypeExts': '*.*',
            //发送给后台的其他参数通过formData指定
            //'formData': { 'someKey': 'someValue', 'someOtherKey': 1 },
            //上传文件页面中，你想要用来作为文件队列的元素的id, 默认为false  自动生成,  不带#
            //'queueID': 'fileQueue',
            //选择文件后自动上传
            'auto': true,
            //设置为true将允许多文件上传
            'multi': false,
            'onUploadSuccess': function (file, data, response) {//当上传完成后的回调函数，ajax方式哦~~
                var editor = CKEDITOR.instances.editor1;
                if (editor.mode == 'wysiwyg') {
                    editor.insertHtml(data);
                }
                else
                    alert('You must be in WYSIWYG mode!');
        }
        });
    });
</script>
   <form id="news" method="post" action="/admin/NewsHandler?cmd=add">
    <p>标题：<input  name="title" size="80" style="margin:2px" /></p><div style="float:right;margin-top:-20px;margin-right:40px"><a class="button white" onclick="$(news).submit();">提交</a></div>
    <br/>
   <textarea id="editor1" class="ckeditor" name="editor1"></textarea>

   </form>
        <div>
        <!--a href="javascript:$('#uploadify').uploadify('upload')">上传</a!-->
            <a href="javascript:$('#uploadify').uploadify('cancel')" style="margin-left:20px">取消上传</a>
           <input type="file" name="uploadify" id="uploadify"  />

             <%--用来作为文件队列区域--%>
        <div id="fileQueue" style="float:right">
        </div>
    </div>
 
	</div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>