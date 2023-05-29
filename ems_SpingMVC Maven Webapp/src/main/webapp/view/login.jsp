<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<title>login</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/style.css" />
		 <script type="text/javascript">
	        function fun(){
	           var image = document.getElementById("image");
	           image.src="${pageContext.request.contextPath}/manager/ImageAction";
	        }
	     </script>
	</head>

	<body>
		<div id="wrap">
			<div id="top_content">
					<div id="header">
						<div id="rightheader">
							<p>
								2017/10/31
								<br />
							</p>
						</div>
						<div id="topheader">
							<h1 id="title">
								<a href="/emp/showAllEmp.do">Main</a>
							</h1>
						</div>
						<div id="navigation">
						</div>
					</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						login
					</h1>
					<form action="${pageContext.request.contextPath}/manager/login.do" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									username:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="username" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									password:
								</td>
								<td valign="middle" align="left">
									<input type="password" class="inputgri" name="password" />
								</td>
							</tr>
							<tr>
								<td>  
									验证码:
								<td/>
									<input type="text" name="vcode"/>
									<img src="${pageContext.request.contextPath}/manager/ImageAction.do" onclick="fun()" id="image"/> 
      								<a href="javascript:" onclick="document.getElementById('image').src='${pageContext.request.contextPath}/manager/ImageAction?time-'+(new Date()).getTime();">看不清，换一张</a>
                  			</tr>
						</table>
						<p>
							<input type="submit" class="button" value="Submit &raquo;" />&nbsp;&nbsp;
							<input type="button" class="button" value="Add Manager &raquo;" onclick="location='${pageContext.request.contextPath}/view/register.jsp'"/>
						</p>
						
						
					</form>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
					ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>