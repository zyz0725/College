<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>



<script type="text/javascript" src="${base_path}/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
$(function () {
	/* $("#addNotice_btn").click(function(){	
		$.ajax({
			url : "${base_path}/notice/addNotice.do",
			type : "post",
			data : "notice_title=" + $('#input_title').val()+"&notice_content="+$('#input_content').val(),
			dataType : "json", //指定响应的数据类型
			success : function() { // 监听响应的
				window.location.reload();
				$.messager.show({
					title:"系统提示",
					msg:"添加成功!"
				});
			}
		});
	}); */
});
</script>
<style type="text/css">
.sec {
	width: 1000px;
	margin: 0px auto;
	background-color: white;
}
/*提交按钮*/
.addNotice_btn button {
	width: 100%;
	height: 44px;
	text-align: center;
	color: #fff;
	background: #3A71D0;
	border: 0;
	font-size: 16px;
	font-family: "Microsoft YaHei", "Hiragino Sans GB";
}

.rebox {
	border: 2px solid #ddd;
	margin-bottom: 24px;
}

.rebox input {
	width: 308px;
	height: 18px;
	padding-bottom: 11px;
	padding-left: 20px;
	padding-top: 15px;
	font-size: 14px;
	color: #666;
	font-family: "Microsoft YaHei", "Hiragino Sans GB";
	outline: none;
	border: none;
}

.rebox .tips {
	position: absolute;
	margin-top: 5px;
	font-size: 14px;
	color: #ccc;
}
/*用户名*/
.rebox .username_label {
	word-spacing: 10px;
}
/*密码，确认密码，*/
.rebox .other_label {
	word-spacing: 2px;
}
</style>


<section class="sec">

	<form id="ff_addNotice" action="${base_path}/notice/addNotice.do" method="post"
		style="width: 400px;
	margin: auto;
	padding-top: 100px;
	padding-bottom: 100px;
	margin-top: 30px;
	margin-bottom: 30px;">
	<h3 style="text-align:center">公告信息</h3>
		<div class="rebox">
			<!-- <label for="username" class="username_label"> -->
			标题<input maxlength="20" name="notice_title" type="text"
				placeholder="公告标题" id="input_title"/>
			<!-- </label> -->
			<div class="tips"></div>
		</div>
		<div>
			<div style="float:left ">内容</div><div style="float:left, margin-bottom:10px;"><textarea cols="55%" rows=5 type="text" name="notice_content"
				placeholder="请输入公告信息" id="input_content"/>
</div>
			
		</div>
		

		<div class="addNotice_btn">
			<button type="submit" id="addNotice_btn">发布新公告</button>
		</div>
	</form>
</section>