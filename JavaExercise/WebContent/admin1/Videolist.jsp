<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<link rel="stylesheet" type="text/css" href="/js/Flexigrid-master/css/flexigrid.css">
	<link rel="stylesheet" type="text/css" href="/js/Flexigrid-master/demo/style.css">
	<script type="text/javascript" src="/js/Flexigrid-master/js/flexigrid.js"></script>
	<div style="width: 950px;margin: 0 auto;height:380px">
	<div style="margin:0px"> <table id="flex1" style="display:none"></table> </div>      
	    <script type="text/javascript">
        $("#flex1").flexigrid({
            url: '/admin/VideoHandler?cmd=list',
            dataType: 'json',
            colModel: [
                { display: '视频名称', name: 'title', width: 400, sortable: true, align: 'center' },
                { display: '视频描述', name: 'describe', width: 400, sortable: true, align: 'left' },
            ],
            buttons: [
						{ name: '添加', bclass: 'add', onpress: activ },
						{ name: '打开', bclass: 'edit', onpress: activ },
                      { name: '删除', bclass: 'delete', onpress: activ },
                      { separator: true }
                    ],
            sortname: "id",
            sortorder: "desc",
            singleSelect: true,
            usepager: true,
            title: "视频列表",
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
            window.open('/showVideo.jsp?&informno=' + id);

        };
        function mousechang1(p,g)
        {
            $(p).css("cursor","pointer");
        }
        function activ(com, grid) {
            if (com == '删除') {
            	var id = $('.trSelected', grid).attr("id").replace("row", "");
                var conf = confirm('删除 ' + $('.trSelected').children('td').eq(0).children('div').html() + ' 吗?')
                if (conf) {
                    $.each($('.trSelected', grid),
                        function (key, value) {
                            $.post('/admin/VideoHandler?cmd=delete&informno=' + id,
                                 function (result) {
                                     // when ajax returns (callback), update the grid to refresh the data
                                     $("#flex1").flexReload();
                                     if (result == "True") {
                                         alert("删除成功！");
                                     }
                                     else {
                                         alert("删除失败！");
                                     }
                                 });
                        });
                }
            }
            else if(com =='添加')
           	{
           		window.open('./addvideo.jsp');
           	}
            else if(com =='打开')
           	{
            	var id = $('.trSelected', grid).attr("id").replace("row", "");
           		window.open('/showVideo.jsp?informno='+id);
           	}


        };
</script>
	</div>
