<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
    $(function () {
        $('#showManagers').edatagrid({
            url:'${pageContext.request.contextPath}/manager/showManagerByPage.do',
            columns:[[
                {field:'manager_name',title:'管理员账号',width:100},
                {field:'manager_pwd',title:'密码',editor:{type:'text', options:{required:true}},width:100}, 
                {field:'jurisdiction',title:'是否是超级管理员',editor:{type:'text', options:{required:true}},width:120,},
               
            ]],
            fit:true,
            fitColumns:true,
            pagination:true,
            pageList:[5,10],
            pageSize:5,
            updateUrl:"${base_path}/manager/updateManagerDetail.do",
            toolbar: [{
                text:"删除该管理员",
                iconCls: 'icon-cancel',
                handler: function(){
                	if($("#showManagers").edatagrid("getSelected")!=null){
                		//$.messager.alert('警告','警告消息');    
                		$.messager.confirm('确认','确定要删除吗',function(r){    
                		    if (r){    
                		    	$.ajax({
                		    		   url:"${base_path}/manager/remove.do",
                		    		   type:"post",
                		    		   data:"manager_name="+$("#showManagers").edatagrid("getSelected").manager_name,
                		    		   dataType:"text",  //指定响应的数据类型
                		    		   success:function(result){  // 监听响应的
                		    			   if(result=="success"){
	                		    			   $('#showManagers').edatagrid('reload');
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
                }
            },'-',{
            	text:"保存修改内容",
                iconCls: 'icon-edit',
                handler: function(){
                    $("#showManagers").edatagrid("saveRow");
                    $.messager.show({
						title:"系统提示",
						msg:"修改成功!"
					});
                }
            },'-',{
                text:"新增管理员",
                iconCls: 'icon-add',
                handler: function(){
                    $('#addManager').dialog('open');
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

<table id="showManagers"></table>

<div id="addManager" class="easyui-dialog" title="添加管理员" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'添加',
				handler:function(){
                $('#ff_addManager').form('submit', {url:'${base_path}/manager/inserNewtManager.do',success:function(){$('#addManager').dialog('close');$('#showManagers').edatagrid('reload');$.messager.show({
	                								title:'系统提示',
	                								msg:'添加成功!'
	                							});}})
				}
			},  {
				text:'关闭',
				handler:function(){
				     $('#addManager').dialog('close');
				}
			}]">
    <form id="ff_addManager" method="post">
        <div>
            <label for="excel" style="width: 250px">请输入要注册的账号:</label>
            <br/>
            <input id="excelname" name="manager_name"  type="text" data-options="required:true" />
        </div>
        <div>
            <label for="excel" style="width: 250px">请输入密码:</label>
            <br/>
            <input id="excelpwd" name="manager_pwd"  type="text" data-options="required:true" />
        </div>
    </form>
</div>

<%-- <div id="dd_update" class="easyui-dialog" title="修改用户信息" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'保存',
				handler:function(){
                $('#ff_update').form('submit', {url:'${base_path}/user/update.do',success:function(){$('#dd_update').dialog('close');$('#showManagers').datagrid('reload')}})
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
</div> --%>