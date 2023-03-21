<!-- main.jsp -->
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>后台管理主页</title>
    <link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../themes/IconExtension.css">
    <link rel="stylesheet" type="text/css" href="${base_path }/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${base_path }/css/main.css">
    <script type="text/javascript" src="${base_path}/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="../js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="../js/echarts.min.js"></script>
    <script type="text/javascript" src="../js/china.js"></script>
    <script type="text/javascript">
    if(${sessionScope.manager==null}){
    	window.self.location = "${base_path}/login.jsp";
    };
    
        function addTab(title, href) {
            var flag=$('#contentTab').tabs("exists",title);
            if (flag){
                $('#contentTab').tabs("select",title);
            }else{
            	if(${sessionScope.manager.jurisdiction==null}&&(href=="showAllLogs.jsp"||href=="showManager.jsp")){
            		alert("对不起，您没有权限访问！");
            	}else{ 
            		$('#contentTab').tabs('add',{
                        title: title,
                        href:"${base_path}/main/left/"+href,
                        selected: true,
                        closable:true,
                    });
            	}
                
            }
        }
        <!--菜单处理-->
        $(function () {
            $.ajax({
                url: "${base_path}/module/showAllModules.do",
                type: "post",
                dataType: "json",
                success: function (result) {
                    for (var i = 0; i < result.length; i++) {
                        var child = "";
                        for (var j = 0; j < result[i].moduls.length; j++) {
                            child += "<p style='text-align: center'><a href='#' class='easyui-linkbutton' data-options=\"iconCls:'"+result[i].moduls[j].iconcls+"'\" onclick=\"addTab('"+result[i].moduls[j].name+"','"+result[i].moduls[j].href+"')\">"+result[i].moduls[j].name+"</a><p>";
                        }
                        var f = result[i];

                        //追加一级菜单
                        $("#menu").accordion('add', {
                            //在面板头部显示的标题 文本
                            title: f.name,
                            //面板主体内容
                            content: child,
                            selected: true,
                        });
                        //默认选中
                        $("#menu").accordion({
                            selected: 0,
                            fit: true,
                            //multiple:true
                        });
                    }
                },
            });
            //欢迎页面
            $("#contentTab").tabs({
                fit: true,
                border: false,
            });

        });
        if(${sessionScope.success=="success"}){
        	alert("添加成功~");
        	$.ajax({
				url : "${base_path}/user/removeSuccess.do",
				type : "post",
				dataType : "json", //指定响应的数据类型
				success : function(result) { // 监听响应的
					
				}
			});
        	//session.invalidate();
        };

    </script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px;background-color:  #3A71D0">
    <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px">
       日语学习交流平台后台管理系统
    </div>
    <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.manager.manager_name }
        &nbsp;<!-- <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a> -->&nbsp;&nbsp;<a href="${base_path }/manager/exit.do"
                                                                                                              class="easyui-linkbutton"
                                                                                                              data-options="iconCls:'icon-cancel'">退出系统</a>
                                                                                                             <!--  iconCls:'icon-01' -->
    </div>
</div>
<div data-options="region:'south',split:true" style="height: 40px;background: #3A71D0"><!-- #5C160C -->
    <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体">&copy;zzu@zyz.com.cn</div>
</div>

<div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    <div id="menu" class="easyui-accordion" <%--data-options="fit:true"--%>>

    </div>
</div>
<div data-options="region:'center'">
    <div id="contentTab" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="主页" data-options="iconCls:'icon-neighbourhood',"
             style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
    </div>
</div>
</body>
</html>