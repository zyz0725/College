<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>



<script type="text/javascript" src="${base_path}/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function() {
		
		//聚焦失焦input
		$('input').eq(0).focus(
				function() {
					if ($(this).val().length == 0) {
						$(this).next("div").text(
								"支持中文，字母，数字，'-'，'_'的多种组合，但不能低于3个字符");
					}
				});
		$('input').eq(1).focus(
				function() {
					if ($(this).val().length == 0) {
						$(this).next("div").text(
								"建议使用字母、数字和符号两种以上的组合，4-12个字符");
					}
				});
		$('input').eq(2).focus(function(){
			if($(this).val().length==0){
				$(this).next("div").text("请再次输入密码");
			}
		});
		/* $('input').eq(3).focus(function(){
			if($(this).val().length==0){
				$(this).next("div").text("请选择省份");
			}
		}); */

		//input各种判断
		//用户名：
		$('input').eq(0).blur(function() {
			//$(this).parent().next("div").text("");
			if ($(this).val().length == 0) {
				$(this).next("div").text("");
				$(this).next("div").css("color", '#ccc');
			} else if ($(this).val().length > 0 && $(this).val().length < 3) {
				$(this).next("div").text("长度只能在3-16个字符之间");
				$(this).next("div").css("color", 'red');
			} else if ($(this).val().length >= 3 && !isNaN($(this).val())) {
				$(this).next("div").text("用户名不能为纯数字");
				$(this).next("div").css("color", 'red');
			} else {
				$.ajax({
					url : "${base_path}/user/isOrNot.do",
					type : "post",
					data : "user_name=" + $(this).val(),
					dataType : "json", //指定响应的数据类型
					success : function(result) { // 监听响应的
						if (result=="false") {
							$('input').eq(0).next("div").text("用户名已存在");
							$('input').eq(0).next("div").css("color", 'red');
						} else {
							$('input').eq(0).next("div").text("此用户名可以使用√");
							$('input').eq(0).next("div").css("color", 'green');
						}
					}
				});
			}
		});
		//密码
		$('input').eq(1).blur(function() {
			$(this).next("div").text("");
			if ($(this).val().length == 0) {
				$(this).next("div").text("");
				$(this).next("div").css("color", '#ccc');
			} else if ($(this).val().length > 0 && $(this).val().length < 4) {
				$(this).next("div").text("长度只能在4-16个字符之间");
				$(this).next("div").css("color", 'red');
			} else {
				$(this).next("div").text("");
				$(this).next("div").css("color", 'green');
				$(this).next("div").text("格式正确√");
			}
		});
//		确认密码
		$('input').eq(2).blur(function(){
			if($(this).val().length==0){
				$(this).next("div").text("");
				$(this).next("div").css("color",'#ccc');
			}else if($(this).val()!=$('input').eq(1).val()){
				$(this).next("div").text("两次密码不匹配");
				$(this).next("div").css("color",'red');
			}else{
				$(this).next("div").css("color", 'green');
				$(this).next("div").text("正确√");
			}		
		});

//		提交按钮
		$("#addUser_btn").click(function(e){	
			var options=$("#select option:selected");
			var user_name=document.getElementById("input_un");
			var user_pwd=document.getElementById("input_pwd");
			for(var j=0 ;j<3;j++){
				if($('input').eq(j).val().length==0){				
					$('input').eq(j).focus();				
					$('input').eq(j).next(".tips").text("此处不能为空");
					$('input').eq(j).next(".tips").css("color",'red');	
					e.preventDefault();
					return;
				}			
			}
		});
	});
</script>
<style type="text/css">
.sec {
	width: 1000px;
	margin: 0px auto;
	background-color: white;
}
/*提交按钮*/
.addUser_btn button {
	width: 100%;
	height: 44px;
	text-align: center;
	color: #fff;
	background: #3A71D0;
	border: 0;
	font-size: 16px;
	font-family: "Microsoft YaHei", "Hiragino Sans GB";
}

.register-box {
	border: 2px solid #ddd;
	margin-bottom: 24px;
}

.register-box input {
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

.register-box .tips {
	position: absolute;
	margin-top: 5px;
	font-size: 14px;
	color: #ccc;
}
/*用户名*/
.register-box .username_label {
	word-spacing: 10px;
}
/*密码，确认密码，*/
.register-box .other_label {
	word-spacing: 2px;
}
</style>


<section class="sec">

	<form action="${base_path }/user/addUser.do" method="post"
		style="width: 400px;
	margin: auto;
	padding-top: 100px;
	padding-bottom: 100px;
	margin-top: 30px;
	margin-bottom: 30px;">
	<h3 style="text-align:center">以下为创建新用户的必填内容</h3>
		<div class="register-box">
			<!-- <label for="username" class="username_label"> -->
			用 户 名 <input maxlength="20" name="user_name" type="text"
				placeholder="您的用户名和登录名" id="input_un"/>
			<!-- </label> -->
			<div class="tips"></div>
		</div>
		<div class="register-box">
			设 置 密 码 <input maxlength="20" type="password" name="user_pwd"
				placeholder="建议至少使用两种字符组合" id="input_pwd"/>

			<div class="tips"></div>
		</div>
		<div class="register-box">

			确 认 密 码 <input maxlength="20" type="password" placeholder="请再次输入密码" />

			<div class="tips"></div>
		</div>

		<div class="register-box">

			选择性别 <select id="sex_cc" class="easyui-combobox" name="sex"
				style="width:200px;">
				<option value="男">男</option>
				<option value="女">女</option>

			</select>

			<div class="tips"></div>
		</div>

		<div class="addUser_btn">
			<button type="submit" id="addUser_btn">添加新用户</button>
		</div>
	</form>
</section>