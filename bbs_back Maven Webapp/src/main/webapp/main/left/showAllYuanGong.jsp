<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
    $(function () {
        $('#showUsers').edatagrid({
            url:'${pageContext.request.contextPath}/yuangong/showYuanGongByPage.do',
            columns:[[
				{field:'id',title:'编号',width:65},
                {field:'name',title:'姓名',width:65},
                {field:'sex',title:'性别',width:100},
                {field:'age',title:'年龄',width:100,},
                {field:'tel',title:'联系方式',width:100,},
                {field:'address',title:'住址',width:100,},
                {field:'zhiwei',title:'职位',width:100,},
                {field:'quanxian',title:'权限',width:80,},
                /* {field:'register_time',title:'注册时间',width:150,},
                {field:'last_time',title:'最后登录时间',width:100,} */
            ]],
            fit:true,
            fitColumns:true,
            pagination:true,
            pageList:[5,8,10],
            pageSize:5,
            //updateUrl:"${base_path}/page/updatePageDetail.do",
            toolbar: [{
                text:"导出模板",
                iconCls: 'icon-edit',
                handler: function(){
                    location.href="${base_path}/user/exportTitle.do";
                }
            },'-',{
                text:"导出所有用户信息",
                iconCls: 'icon-help',
                handler: function(){
                    location.href="${base_path}/user/exportAll.do";
                }
            },'-',{
                text:"导入用户信息",
                iconCls: 'icon-help',
                handler: function(){
                    $('#addUsers').dialog('open');
                }
            },'-',{
                text:"修改用户信息",
                iconCls: 'icon-help',
                handler: function(){
                	if($("#showUsers").edatagrid("getSelected")==null){
                		//$.messager.alert('警告','警告消息');    
                		$.messager.confirm('确认','请选择一个用户',function(r){    
                		    /* if (r){    
                		        alert('确认删除');    
                		    }   */  
                		}); 
                	}else{
                		//alert($("#showUsers").edatagrid("getSelected").city);
                		$('#dd_update').dialog('open');
                		$("#update_user_name").val($("#showUsers").edatagrid("getSelected").user_name);
                		$("#update_qq").val($("#showUsers").edatagrid("getSelected").qq);
                		$("#province").val($("#showUsers").edatagrid("getSelected").province);
                		selectprovince(document.getElementById("province"));
                		//$("#city").val($("#showUsers").edatagrid("getSelected").city);
                		$("#city").find("option[value = '"+$("#showUsers").edatagrid("getSelected").city+"']").attr("selected","selected");
                		$("#update_sex").val($("#showUsers").edatagrid("getSelected").sex);
                    	
                    	
                	}
                }
            }],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${base_path}/main/image/user.png' +' "style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述: ' + '统一用户头像' + '</p>' +
                    /* '<p>状态: ' + rowData.status + '</p>' + */
                    '</td>' +
                    '</tr></table>';
            }
        });
    });
    
    
    
</script>

<table id="showUsers"></table>

<div id="addUsers" class="easyui-dialog" title="导入用户信息" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'上传',
				handler:function(){
                $('#ff_addUsers').form('submit', {url:'${base_path}/user/importUses.do',success:function(){$('#addUsers').dialog('close');$('#showUsers').edatagrid('reload')}})
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
                $('#ff_update').form('submit', {url:'${base_path}/user/update.do',success:function(){$('#dd_update').dialog('close');$('#showUsers').datagrid('reload');;$.messager.show({
						title:'系统提示',
						msg:'修改成功!'
					});}})
				}
			}]">
    <form id="ff_update" method="post" enctype="multipart/form-data">
        <input id="update_user_name" type="hidden" name="user_name"  />
        <div style="margin-bottom:5px">
            <label for="description">qq号</label>
            <input id="update_qq" class="easyui-validatebox" type="text" name="qq"  /><!-- data-options="required:true" -->
        </div>
        <div style="margin-bottom:5px">
            <label for="status">省份</label>
            <select id="province" runat="server" onchange="selectprovince(this);" style=" width:95px;" name="province"></select>
			
        </div>
        <div style="margin-bottom:5px">
            <label for="upload">城市 </label>
            <select id="city" runat="server" style=" width:95px;" name="city"></select>
        </div>
        <div style="margin-bottom:5px">
            <label for="upload">性别</label>
            <select style=" width:95px;" name="sex" id="update_sex">
            	<option value="男">男</option>
				<option value="女">女</option>
            </select>
        </div>
    </form>
</div>