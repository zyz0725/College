<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>

<script type="text/javascript">
    $(function () {
        $('#showTopics').edatagrid({
            url: '${base_path}/topic/showTopicsByPage.do',
            idField: 'topic_id',
            treeField: 'title',
            columns: [[
                {title: '编号', field: 'topic_id', width: 60},
                {field: 'topic_title', title: '话题标题', width: 80,},
                {field: 'topic_pushtime', title: '发布时间', width: 80},
                {field: 'user_name', title: '发起人', width: 60},
                {field: 'model_id', title: '隶属模块编号', width: 60},
            ]],
            fit: true,
            fitColumns: true,
            pagination:true,
            pageList:[5,8,10],
            pageSize:5,
            toolbar: [{
                text: "删除话题",
                iconCls: 'icon-help',
                handler: function () {
                    var row = $("#showTopics").edatagrid("getSelected");
                    if (row.model_id != null) {
                        /* $("#add_chapter").dialog("open");
                        $("#aduio_parentId").prop("value",row.id); */
                        console.log(row.model_id);
                        $.ajax({
                        	   url:"${base_path}/topic/removeTopic.do",
                        	   type:"post",
                        	   data:"topic_id="+row.topic_id,
                        	   dataType:"text",  //指定响应的数据类型
                        	   success:function(result){  // 监听响应的
                        		   $('#showTopics').edatagrid('reload');
                        		   $.messager.show({
               						title:"系统提示",
               						msg:"删除成功!"
               					});
                        	   }
                        	});
                    }
                }
            }],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td style="border:0">' +
                    '<p>内容: ' + rowData.topic_content + '</p>' +
                    /* '<p>状态: ' + rowData.status + '</p>' + */
                    '</td>' +
                    '</tr></table>';
            },

        });

    });


</script>
<table id="showTopics" style="width:600px;height:400px"></table>


