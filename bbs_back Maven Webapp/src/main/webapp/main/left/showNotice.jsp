<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
    $(function () {
        $('#showNotices').edatagrid({
            url:'${pageContext.request.contextPath}/notice/showNotices.do',
            columns:[[
                {field:'notice_id',title:'公告标号',width:100},
                {field:'notice_title',title:'公告标题',width:100,editor:{type:'text', options:{required:true}}}, 
                {field:'notice_content',title:'公告内容',editor:{type:'text', options:{required:true}},width:120,},
                {field:'notice_time',title:'发布时间',width:120,},
               
            ]],
            fit:true,
            fitColumns:true,
            //pagination:true,
            //pageList:[5,10],
            //pageSize:5,
            updateUrl:"${base_path}/notice/updateNoticeDetail.do",
            toolbar: [{
                text:"删除该公告",
                iconCls: 'icon-cancel',
                handler: function(){
                	if($("#showNotices").edatagrid("getSelected")!=null){
                		//$.messager.alert('警告','警告消息');    
                		$.messager.confirm('确认','确定要删除吗',function(r){    
                		    if (r){    
                		    	$.ajax({
                		    		   url:"${base_path}/notice/remove.do",
                		    		   type:"post",
                		    		   data:"notice_id="+$("#showNotices").edatagrid("getSelected").notice_id,
                		    		   dataType:"text",  //指定响应的数据类型
                		    		   success:function(result){  // 监听响应的
                		    			   if(result=="success"){
	                		    			   $('#showNotices').edatagrid('reload');
	                		    			   $.messager.show({
	                								title:"系统提示",
	                								msg:"删除成功!"
	                							});
                		    			   }
                		    		   }
                		    		});    
                		    }  
                		}); 
                	}else{
                		$.messager.confirm('确认','请选择一个进行删除',function(r){     
                		});
                	}
                    //location.href="${base_path}/notice/remove.do";
                }
            },'-',{
            	 text:"保存修改内容",
                 iconCls: 'icon-edit',
                 handler: function(){
                     $("#showNotices").edatagrid("saveRow");
                     $.messager.show({
							title:"系统提示",
							msg:"修改完成!"
						});
                 }
            }],
           /*  view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${base_path}/main/image/user.png' +' "style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述: ' + '统一用户头像' + '</p>' +
                     '<p>状态: ' + rowData.status + '</p>' + 
                    '</td>' +
                    '</tr></table>';
            } */
        });
    });
    
   
</script>

<table id="showNotices"></table>

<div id="addUsers" class="easyui-dialog" title="导入用户信息" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'上传',
				handler:function(){
                $('#ff_addUsers').form('submit', {url:'${base_path}/user/importUses.do',success:function(){$('#addUsers').dialog('close');$('#showNotices').edatagrid('reload');}})
				}
			},  {
				text:'关闭',
				handler:function(){
				     $('#addUsers').dialog('close');
				}
			}]">
    <form id="ff_addUsers" method="post" enctype="multipart/form-data">
        <div>
            <label for="excel" style="width: 250px">请选择上传与模板相同格式的xls文件:</label>
            <br/>
            <input id="excel" name="excel"  type="file" data-options="required:true" />
        </div>
    </form>
</div>

<div id="dd_update" class="easyui-dialog" title="修改用户信息" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'保存',
				handler:function(){
                $('#ff_update').form('submit', {url:'${base_path}/user/update.do',success:function(){$('#dd_update').dialog('close');$('#showNotices').datagrid('reload')}})
				}
			}]">
    <form id="ff_update" method="post" enctype="multipart/form-data">
        <div style="margin-bottom:5px">
            <label for="description">qq号</label>
            <input id="description" class="easyui-validatebox" type="text" name="description"  /><!-- data-options="required:true" -->
        </div>
        <div style="margin-bottom:5px">
            <label for="status">省份</label>
            <select id="province" runat="server" onchange="selectprovince(this);" style=" width:95px;" name="province"></select>
			
        </div>
        <div style="margin-bottom:5px">
            <label for="upload">城市</label>
            <select id="city" runat="server" style=" width:95px;" name="city"></select>
        </div>
        <div style="margin-bottom:5px">
            <label for="upload">性别</label>
            <select style=" width:95px;" name="sex">
            	<option value="男">男</option>
				<option value="女">女</option>
            </select>
        </div>
    </form>
</div>