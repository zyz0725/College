<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>

<script type="text/javascript">
    $(function () {
        $('#postTree').treegrid({
            onDblClickRow:function (row) {
                var row = $("#postTree").treegrid("getSelected");
                console.log(row.topic_id);
                if (row.topic_id == null) {
                    /* $("#dd_run").dialog("open");
                    //在线播放
                    $("#play").prop("src","../../audio/"+row.path); */
                	console.log(row.reply_id);
                }
            },
            url: '${base_path}/post/showAllPosts.do',
            idField: 'post_id',
            treeField: 'post_id',
            columns: [[
                {title: 'ID', field: 'post_id', width: 100},
                {title: '发帖人', field: 'user_name', width: 100},
                {field: 'post_pushtime', title: '发帖时间', width: 100,},
                {field: 'post_content', title: '内容', width: 120,},
                {field: 'topic_id', title: '隶属ID', width: 100},
                {field: 'zan', title: '获赞数', width: 80} 
            ]],
            fit: true,
            fitColumns: true,
            pagination:true,
            pageList:[5,8,10],
            pageSize:5,
            toolbar: [{
                text: "删除",
                iconCls: 'icon-no',
                handler: function () {
                	var row = $("#postTree").treegrid("getSelected");
                    //怎么判断当前行为是帖子还是回复
                    console.log(row.zan);
                    
                    if(row!=null){
                		//$.messager.alert('警告','警告消息');    
                		$.messager.confirm('确认','确定要删除吗',function(r){    
                		    if (r){
					                    if (row.zan != null) {
					                        //是帖子
					                    	$.ajax({
			                		    		   url:"${base_path}/post/removePost.do",
			                		    		   type:"post",
			                		    		   data:"post_id="+$("#postTree").treegrid("getSelected").post_id,
			                		    		   dataType:"text",  //指定响应的数据类型
			                		    		   success:function(result){  // 监听响应的
			                		    			   if(result=="success"){
				                		    			   $('#postTree').treegrid('reload');
				                		    			   $.messager.show({
				                								title:"系统提示",
				                								msg:"删除成功!"
				                							});
			                		    			   }
			                		    		   }
			                		    		});  
					                    }else{
					                    	//是回复
					                    	$.ajax({
			                		    		   url:"${base_path}/post/removeReply.do",
			                		    		   type:"post",
			                		    		   data:"reply_id="+$("#postTree").treegrid("getSelected").post_id,
			                		    		   dataType:"text",  //指定响应的数据类型
			                		    		   success:function(result){  // 监听响应的
			                		    			   if(result=="success"){
				                		    			   $('#postTree').treegrid('reload');
				                		    			   $.messager.show({
				                								title:"系统提示",
				                								msg:"删除成功!"
				                							});
			                		    			   }
			                		    		   }
			                		    		});
					                    }
                		    }  
                		}); 
                	}/* else{
                		$.messager.confirm('确认','请选择一个进行删除',function(r){     
                		});
                	} */
                    //location.href="${base_path}/notice/remove.do";
                

                }
            }/* , '-', {
                text: "添加专辑",
                iconCls: 'icon-help',
                handler: function () {
                    $("#addAlbum").dialog("open");
                }
            }, '-', {
                text: "添加章节",
                iconCls: 'icon-help',
                handler: function () {
                    var row = $("#postTree").treegrid("getSelected");
                    if (row.img_path != null) {
                        $("#add_chapter").dialog("open");
                        $("#aduio_parentId").prop("value",row.id);
                    }
                }
            }, '-', {
                text: "下载音频",
                iconCls: 'icon-help',
                handler: function () {
                    var row = $("#postTree").treegrid("getSelected");
                    console.log(row.img_path)
                    if (row.img_path == null) {
                        location.href="${base_path}/audio/download.do?url="+row.path+"&name="+row.title;
                    }
                }
            } */]

        });

    });


</script>
<table id="postTree" style="width:600px;height:400px"></table>


<div id="dd_query" class="easyui-dialog" title="专辑详情" style="width:600px;height:400px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'关闭',
				handler:function(){
				    $('#dd_query').dialog('close');
				}
			}]">


    <form id="ff_query" method="post" enctype="multipart/form-data">
        <div>
            <label for="files_name">文件名称</label>
            <input id="files_name" class="easyui-validatebox" type="text" readonly="readonly" name="title" data-options="required:true"/>
        </div>
        <div>
            <label for="files_brief">简介</label>
            <input id="files_brief" class="easyui-validatebox" type="text" multiline="true" readonly="readonly" name="brief" data-options="required:true"/>
        </div>

        <div>
            <img src="" id="img">
        </div>

    </form>
</div>





<div id="add_chapter" class="easyui-dialog" title="添加章节" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'保存',
				handler:function(){
                $('#ff_addAudio').form('submit', {url:'${base_path}/audio/uploadAudio.do',success:function(){$('#add_chapter').dialog('close');$('#postTree').treegrid('reload')}})
				}
			},  {
				text:'关闭',
				handler:function(){
				     $('#add_chapter').dialog('close');
				}
			}]">


    <form id="ff_addAudio" method="post" enctype="multipart/form-data">
        <input id="aduio_parentId" type="hidden" name="aid" value=""/>
        <div>
            <label for="audio_title">文件名称</label>
            <input id="audio_title" class="easyui-validatebox" type="text" name="title" data-options="required:true"/>
        </div>
        <div>
            <label for="audio">audio:</label>
            <input   id="audio" name="audio"  type="file" data-options="required:true" />
        </div>


    </form>
</div>


<div id="dd_run" class="easyui-dialog" title="在线播放" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'关闭',
				handler:function(){
				    $('#dd_run').dialog('close');
				}
			}]">


    <audio id="play" src=""  controls="controls"></audio>
</div>


<div id="addAlbum" class="easyui-dialog" title="新增专辑" style="width:400px;height:200px;text-align: center"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
buttons:[{
				text:'保存',
				handler:function(){
                $('#ff_add').form('submit', {url:'${base_path}/album/addNewAlbum.do',success:function(){$('#addAlbum').dialog('close');$('#postTree').treegrid('reload')}})
				}
			},  {
				text:'关闭',
				handler:function(){
				    $('#addAlbum').dialog('close');
				}
			}]">
    <form id="ff_add" method="post" enctype="multipart/form-data">
        <div>
            <label for="album_title">文件名称</label>
            <input id="album_title" class="easyui-validatebox" type="text" name="title" data-options="required:true"/>
        </div>
        <div>
            <label for="caster">配音:</label>
            <input   id="caster" name="caster"  type="text" data-options="required:true" />
        </div>
        <div>
            <label for="brief">简介:</label>
            <input   id="brief" name="brief"  type="text" data-options="required:true"/>
        </div>
        <div>
            <label for="author">作者:</label>
            <input id="author" name="author" value="">
        </div>
        <div>
            <label for="head_upload">封面上传</label>
            <input id="head_upload" class="easyui-validatebox" type="file" name="upload" data-options="" />
        </div>
    </form>
</div>
