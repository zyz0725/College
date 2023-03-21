<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>

<script type="text/javascript">
    $(function () {
        $('#showModels').edatagrid({
            url: '${base_path}/model/showAllModels.do',
            idField: 'model_id',
            treeField: 'title',
            columns: [[
                {title: '编号', field: 'model_id', width: 80},
                {field: 'model_name', title: '模块名', width: 80,},
                {field: 'model_desc', title: '描述', width: 120,},
                {field: 'model_img', title: '图片路径', width: 100},
                //{field: 'model_sum', title: '总数', width: 80}
            ]],
            fit: true,
            fitColumns: true,
            toolbar: [{
                text: "添加模块",
                iconCls: 'icon-help',
                handler: function () {
                    $("#addmodel").dialog("open");
                }
            }, '-', {
                text: "删除模块",
                iconCls: 'icon-help',
                handler: function () {
                    var row = $("#showModels").edatagrid("getSelected");
				                    if(row!=null){
				                		//$.messager.alert('警告','警告消息');    
				                		$.messager.confirm('确认','确定要删除吗',function(r){    
				                		    if (r){    
                    if (row.model_id != null) {
                        /* $("#add_chapter").dialog("open");
                        $("#aduio_parentId").prop("value",row.id); */
                        console.log(row.model_id);
                        $.ajax({
                        	   url:"${base_path}/model/removeModel.do",
                        	   type:"post",
                        	   data:"model_id="+row.model_id,
                        	   dataType:"text",  //指定响应的数据类型
                        	   success:function(result){  // 监听响应的
                        		   $('#showModels').edatagrid('reload');
                        		   $.messager.show({
               						title:"系统提示",
               						msg:"删除成功!"
               					});
                        	   }
                        	});
                    }
				                		    }  
				                		}); 
				                	}else{
				                		$.messager.confirm('确认','请选择一个进行删除',function(r){     
				                		});
				                	}
                }
            }],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 height=100px style="border:0"><img src="http://localhost:8989/image/'+rowData.model_img+' "style="height:100px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述: ' + rowData.model_desc + '</p>' +
                    /* '<p>状态: ' + rowData.status + '</p>' + */
                    '</td>' +
                    '</tr></table>';
            },

        });

    });


</script>
<table id="showModels" style="width:600px;height:400px"></table>


<div id="addmodel" class="easyui-dialog" title="新增模块" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'保存',
				handler:function(){
                $('#ff_add').form('submit', {url:'${base_path}/model/addNewModel.do',success:function(){$('#addmodel').dialog('close');$('#showModels').edatagrid('reload');$.messager.show({
               						title:'系统提示',
               						msg:'添加成功!'
               					});}})
				}
			},  {
				text:'关闭',
				handler:function(){
				    $('#addmodel').dialog('close');
				}
			}]">
    <form id="ff_add" method="post" enctype="multipart/form-data">
        <div>
            <label for="model_name">模块名称</label>
            <input id="model_name" class="easyui-validatebox" type="text" name="model_name" data-options="required:true"/>
        </div>
        <div>
            <label for="model_desc">介绍:</label>
            <input   id="model_desc" name="model_desc"  type="text" data-options="required:true" />
        </div>
       <!--  <div>
            <label for="model_target">目标路径:</label>
            <input   id="model_target" name="model_target"  type="text" data-options="required:true"/>
        </div> -->
        <div>
            <label for="model_img">封面上传</label>
            <input id="model_img" class="easyui-validatebox" type="file" name="upload" data-options="" />
        </div>
    </form>
</div>
