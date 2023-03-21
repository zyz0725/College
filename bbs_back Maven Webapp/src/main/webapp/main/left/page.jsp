<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
    $(function () {
        $('#dg').edatagrid({
            url:'${pageContext.request.contextPath}/page/showAllPages.do',
            columns:[[
                {field:'id',title:'编号',width:100},
                {field:'description',title:'描述',width:100,editor:{type:'text', options:{required:true}}},
                {field:'status',title:'状态',width:100,editor:{type:'text', options:{required:true}}},
                {field:'path',title:'路径',width:100,}
            ]],
            fit:true,
            fitColumns:true,
            pagination:true,
            pageList:[5,8,10],
            pageSize:5,
            updateUrl:"${base_path}/page/updatePageDetail.do",
            toolbar: [{
                text:"保存",
                iconCls: 'icon-edit',
                handler: function(){
                    $("#dg").edatagrid("saveRow");
                }
            },'-',{
                text:"图片上传",
                iconCls: 'icon-help',
                handler: function(){
                    $("#dd").dialog("open");
                }
            }],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="http://localhost:8989/img/' + rowData.path+' "style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述: ' + rowData.description + '</p>' +
                    '<p>状态: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
    })


</script>




<table id="dg"></table>

<div id="dd" class="easyui-dialog" title="上传图片" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'保存',
				handler:function(){
                $('#ff1').form('submit', {url:'${base_path}/page/uploadPicture.do',success:function(){$('#dd').dialog('close');$('#dg').datagrid('reload')}})
				}
			}]">
    <form id="ff1" method="post" enctype="multipart/form-data">
        <div>
            <label for="description">文件描述</label>
            <input id="description" class="easyui-validatebox" type="text" name="description" data-options="required:true" />
        </div>
        <div>
            <label for="status">文件状态</label>
            <select id="status" class="easyui-combobox" name="status" style="width:160px">
                <option value="未展示">未展示</option>
                <option value="展示中">展示中</option>
            </select>
        </div>
        <div>
            <label for="upload">文件上传</label>
            <input id="upload" class="easyui-validatebox" type="file" name="upload" data-options="" />
        </div>
    </form>
</div>


