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
	<link rel="stylesheet" type="text/css" href="/js/Flexigrid-master/css/flexigrid.css">
	<link rel="stylesheet" type="text/css" href="/js/Flexigrid-master/demo/style.css">
	<script type="text/javascript" src="/js/Flexigrid-master/js/flexigrid.js"></script>
	<div style="width: 950px;margin: 0 auto;height:380px">
	<div style="margin:15px"> <table id="flex1" style="display:none"></table> </div>       
	    <script type="text/javascript">
        $("#flex1").flexigrid({
            url: '/admin/ExamHandler?cmd=list',
            dataType: 'json',
            colModel: [
                       { display: '考试名称', name: 'title', width: 150, sortable: true, align: 'center' },
                       { display: '考试描述', name: 'describe', width: 350, sortable: true, align: 'left' },
                       { display: '考试时长(分钟)', name: 'examtime', width: 150, sortable: true, align: 'left' },
                       { display: '发布时间', name: 'createtime', width: 150, sortable: true, align: 'left' }
            ],
            buttons: [
					{ name: '开始考试', bclass: 'add', onpress: activ },
                    { separator: true }
                  ],
            sortname: "id",
            sortorder: "desc",
            singleSelect: true,
            usepager: true,
            title: "考试列表",
            useRp: true,
            rp: 15,
            showTableToggleBtn: true,
            width: 900,
            onSubmit: addFormData,
            height: 300,
            onMouseover: mousechang1
        });
        function addFormData() {
            //passing a form object to serializeArray will get the valid data from all the objects, but, if the you pass a non-form object, you have to specify the input elements that the data will come from
            var dt = $('#sform').serializeArray();
            $("#flex1").flexOptions({ params: dt });
            return true;
        }
        function selectAccount() {
            id = $('.trSelected').attr("id").replace("row", "");
            window.open('/question.jsp?informno=' + id);

        };
        function mousechang1(p,g)
        {
            $(p).css("cursor","pointer");
        }
        function activ(com, grid) {
           if(com =='开始考试')
           	{
            	var id = $('.trSelected', grid).attr("id").replace("row", "");
            	var conf = confirm('确认开始考试!(一旦开始，无法中止)')
            	if (conf)
            	{
	            	$.post("/RunexamHandler?cmd=start&examid="+id,function(data){
	            		if(data=="True")
            			{
	            			window.open('/showexam.jsp?informno='+id,'_self');
            			}
	            	});
            	}
           	}


        };
</script>
	</div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>