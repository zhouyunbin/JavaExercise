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
            url: '/admin/NewsHandler?cmd=list',
            dataType: 'json',
            colModel: [
                       { display: '标题', name: 'title', width: 400, sortable: true, align: 'center' },
                       { display: '发布时间', name: 'createtime', width: 400, sortable: true, align: 'left' },
            ],
            sortname: "time",
            sortorder: "desc",
            singleSelect: true,
            usepager: true,
            title: "FAQ",
            useRp: true,
            rp: 15,
            showTableToggleBtn: true,
            width: 900,
            onSubmit: addFormData,
            height: 300,
            onSClick: selectAccount,
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
            window.open('/shownews.jsp?&informno=' + id);

        };
        function mousechang1(p,g)
        {
            $(p).css("cursor","pointer");
        }
</script>
	</div>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>