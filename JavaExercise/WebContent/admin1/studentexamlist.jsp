<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/js/Flexigrid-master/css/flexigrid.css">
	<link rel="stylesheet" type="text/css" href="/js/Flexigrid-master/demo/style.css">
	<script type="text/javascript" src="/js/Flexigrid-master/js/flexigrid.js"></script>
	<div style="width: 950px;margin: 0 auto;height:480px">
	<div style="margin:0px"> <table id="flex1" style="display:none"></table> </div>      
	    <script type="text/javascript">
        $("#flex1").flexigrid({
            url: '/admin/ExamHandler?cmd=stulist&examid='+<%=request.getParameter("examid")%>,
            dataType: 'json',
            colModel: [
                { display: '学号', name: 'studentid', width: 100, sortable: true, align: 'center' },
                { display: '姓名', name: 'name', width: 100, sortable: true, align: 'left' },
                { display: '考试名称', name: 'title', width: 100, sortable: true, align: 'left' },
                { display: '选择题正确数', name: 'q_right', width: 100, sortable: true, align: 'center' },
                { display: '选择题错误数', name: 'q_wrong', width: 100, sortable: true, align: 'center' },
                { display: '编程题正确数', name: 'c_right', width: 100, sortable: true, align: 'center' },
                { display: '编程题错误数', name: 'c_wrong', width: 100, sortable: true, align: 'center' },
                { display: '考试时间', name: 'examtime', width: 150, sortable: true, align: 'center' }
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
            window.open('/showCode.jsp?&informno=' + id);

        };
        function mousechang1(p,g)
        {
            $(p).css("cursor","pointer");
        }
        function activ(com, grid) {

        };
        function getQueryString(name)
        {
        	  var reg = new RegExp("(^|&amp;)" + name + "=([^&amp;]*)(&amp;|$)", "i");
        	  var r = window.location.search.substr(1).match(reg);
        	  if (r == null)
        	  return null;
        	  else
        	  return unescape(r[2]);
        }
</script>
	</div>