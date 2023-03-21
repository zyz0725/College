<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>


<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/head.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<!-- <script src="js/index.js" type="text/javascript" charset="utf-8"></script> -->
<script type="text/javascript" src="${base_path}/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function() {
		var modal = document.getElementById('myModal');
		// 点击按钮打开弹窗
		document.getElementById('ckxieyi').onclick = function() {
		    modal.style.display = "block";
		};
	if(${requestScope.error!=null}){
		alert("用户名或密码错误！");
	};
		// 获取 <span> 元素，用于关闭弹窗
		var span = document.querySelector('.close');
		// 点击 <span> (x), 关闭弹窗
		span.onclick = function() {
			modal.style.display = "none";
		};
		//聚焦失焦input
		$('input').eq(0).focus(
				function() {
					if ($(this).val().length == 0) {
						$(this).parent().next("div").text(
								"支持中文，字母，数字，'-'，'_'的多种组合，但不能低于3个字符");
					}
				});
		$('input').eq(1).focus(
				function() {
					if ($(this).val().length == 0) {
						$(this).parent().next("div").text(
								"建议使用字母、数字和符号两种以上的组合，4-12个字符");
					}
				});

		$('input').eq(2).focus(function() {
			//if ($(this).val().length == 0) {
				$(this).parent().next("div").css("color", '#ccc');
				$(this).parent().next().next("div").text("看不清？点击图片更换验证码");
			//}
		});
		//input各种判断
		//用户名：
		$('input').eq(0).blur(function() {
			//$(this).parent().next("div").text("");
			if ($(this).val().length == 0) {
				$(this).parent().next("div").text("");
				$(this).parent().next("div").css("color", '#ccc');
			} else if ($(this).val().length > 0 && $(this).val().length < 3) {
				$(this).parent().next("div").text("长度只能在3-16个字符之间");
				$(this).parent().next("div").css("color", 'red');
			} else if ($(this).val().length >= 3 && !isNaN($(this).val())) {
				$(this).parent().next("div").text("用户名不能为纯数字");
				$(this).parent().next("div").css("color", 'red');
			} else {
				$(this).parent().next("div").css("color", 'green');
				$(this).parent().next("div").text("格式正确√");
			}
		});
		//密码
		$('input').eq(1).blur(function() {
			$(this).parent().next("div").text("");
			if ($(this).val().length == 0) {
				$(this).parent().next("div").text("");
				$(this).parent().next("div").css("color", '#ccc');
			} else if ($(this).val().length > 0 && $(this).val().length < 4) {
				$(this).parent().next("div").text("长度只能在4-16个字符之间");
				$(this).parent().next("div").css("color", 'red');
			} else {
				$(this).parent().next("div").text("");
				$(this).parent().next("div").css("color", 'green');
				$(this).parent().next("div").text("格式正确√");
			}
		});
		//			验证码
		$('input').eq(2)
				.blur(
						function() {
							$(this).parent().next().next("div").text(
							"");
							if ($(this).val().length == 0) {
								$(this).parent().next().next("div").css(
										"color", 'red');
								$(this).parent().next().next("div").text(
										"请输入验证码");
							} else {
								$.ajax({
									url : "${base_path}/manager/codeEquals.do",
									type : "post",
									data : "code=" + $(this).val(),
									dataType : "json", //指定响应的数据类型
									success : function(result) { // 监听响应的
										if (result=="true") {
											$('input').eq(2).parent().next().next("div").css(
													"color", 'green');
											$('input').eq(2).parent().next().next("div").text(
													"输入正确√");
										} else {
											$('input').eq(2).parent().next().next("div")
													.css("color", 'red');
											$('input').eq(2).parent().next().next("div")
													.text("验证码错误");
										}
									}
								});
							}
							/* else if($(this).val().toUpperCase()!=responseCode.toUpperCase()){
								$(this).parent().next().next("div").text("验证码不正确");
								$(this).parent().next().next("div").css("color",'red');
							}else{
								$(this).parent().next().next("div").text("");
								$(this).parent().next("div").css("color",'green');
								$(this).parent().next("div").text("验证码正确√");
							}	 */
						});
//		提交按钮
		$("#submit_btn").click(function(e){		
			for(var j=0 ;j<4;j++){
				if($('input').eq(j).val().length==0){				
					$('input').eq(j).focus();				
					if(j==3){
						$('input').eq(j).parent().next().next("div").text("此处不能为空");
						$('input').eq(j).parent().next().next("div").css("color",'red');
						e.preventDefault();
						return;
					}
					$('input').eq(j).parent().next(".tips").text("此处不能为空");
					$('input').eq(j).parent().next(".tips").css("color",'red');	
					e.preventDefault();
					return;
				}			
			}
			//协议
			if($("#xieyi")[0].checked){
				//向变量stuList数组添加一个数值，数值内部格式Student(name,password,tel,id)
				//发送用户信息
				$("form").submit();
			}else{						
				$("#xieyi").next().next().next(".tips").text("请勾选协议");
				$("#xieyi").next().next().next(".tips").css("color",'red');
				e.preventDefault();
				return;
			}
		});
	});
	function fun() {
		var image = document.getElementById("image");
		image.src = "${base_path}/manager/ImageAction.do?" + Math.random();
	}
</script>
<style type="text/css">
/* 弹窗 (background) */
.modal {
	display: none; /* 默认隐藏 */
	position: fixed; /* 固定定位 */
	z-index: 1; /* 设置在顶层 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

/* 弹窗内容 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	heigth:50%;
}

/* 关闭按钮 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover,.close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>

<body>
	<!-- 弹窗 -->
	<div id="myModal" class="modal">

		<!-- 弹窗内容 -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<p style="">
				<h3>请阅读并遵守以下规则：</h3>
				<li>1.管理员应妥善保管管理员帐号及密码，未经上级领导同意，管理员不得擅自买卖、转让、出租任何管理员帐号。</li>
				<li>2.管理员使用后台管理系统过程中，须对自身使用的行为，对任何由管理员通过后台管理系统发布、公开的信息，及对由此产生的任何后果承担全部责任。</li>
				<li>3.管理员不得利用管理员账号或本服务制作、上载、复制、发布、传播如下法律、法规和政策禁止的内容：

<li style="list-style-type:none">(1) 反对宪法所确定的基本原则的；</li>

<li style="list-style-type:none">(2) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</li>

<li style="list-style-type:none">(3) 损害国家荣誉和利益的；</li>

<li style="list-style-type:none">(4) 煽动民族仇恨、民族歧视，破坏民族团结的；</li>

<li style="list-style-type:none">(5) 破坏国家宗教政策，宣扬邪教和封建迷信的；</li>

<li style="list-style-type:none">(6) 散布谣言，扰乱社会秩序，破坏社会稳定的；</li>

<li style="list-style-type:none">(7) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</li>

<li style="list-style-type:none">(8) 侮辱或者诽谤他人，侵害他人合法权益的；</li>

<li style="list-style-type:none">(9) 不遵守法律法规底线、社会主义制度底线、国家利益底线、公民合法权益底线、社会公共秩序底线、道德风尚底线和信息真实性底线的“七条底线”要求的；</li>

<li style="list-style-type:none">(10) 含有法律、行政法规禁止的其他内容的信息。</li>
				</li>
			</p>
		</div>

	</div>



	<div class="dvhead">
		<div class="dvlogo">
			<a href="#">日语学习交流论坛</a>
		</div>
		<div class="dvsearch"></div>
		<div class="dvreg">
			<!-- 已有账号，立即&nbsp;<a href="login.html">登录</a> -->
			后台管理系统
		</div>
	</div>
	<section class="sec">
		<form action="${base_path }/manager/login.do" method="post">
			<div class="register-box">
				<label for="username" class="username_label"> 用 户 名 <input
					maxlength="20" name="manager_name" type="text" placeholder="您的用户名和登录名" />
				</label>
				<div class="tips"></div>
			</div>
			<div class="register-box">
				<label for="username" class="other_label"> 设 置 密 码 <input
					maxlength="20" type="password" name="manager_pwd"
					placeholder="建议至少使用两种字符组合" />
				</label>
				<div class="tips"></div>
			</div>
			<!-- <div class="register-box">
					<label for="username" class="other_label">
					确 认 密 码
					<input maxlength="20" type="password" placeholder="请再次输入密码" />
				</label>
					<div class="tips">

					</div>
				</div> -->

			<div class="register-box">
				<label for="username" class="other_label"> 验 证 码 <input
					maxlength="20" type="text" placeholder="请输入验证码" />
				</label> <span id="code"><img
					src="${base_path}/manager/ImageAction.do" onclick="fun()"
					id="image" /> </span>
				<!-- <span id="code"></span> -->
				<div class="tips"></div>
			</div>
			<div class="arguement">
				<input type="checkbox" id="xieyi" /> 阅读并同意 <a
					href="javascript:void(0)" id="ckxieyi">《管理员操作协议》</a> <!-- 没有账号？<a
					href="register.html">立即注册</a> -->
				<div class="tips"></div>
			</div>
			<div class="submit_btn">
				<button type="submit" id="submit_btn">立 即 登录</button>
			</div>
		</form>
	</section>


</body>