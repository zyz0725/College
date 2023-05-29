<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"  import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<title>emplist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
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
							<a href="${pageContext.request.contextPath}/emp/showAllEmp.do">Main</a>
						</h1>
					</div>
					<div id="navigation">
					
					</div>
				</div>
				<div id="content">
					<p id="whereami">
						
					</p>
					<h1>
						Welcome! <s:property value="#session.user"/>
						&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/protected/exitAction">退出登录</a>
					</h1> 
					
					<table class="table">
						<tr class="table_header">
							<td>
								&nbsp;
							</td>
							<td>
								ID
							</td>
							<td>
								Name
							</td>
							<td>
								Salary
							</td>
							<td>
								婚姻状态
							</td>
							<td>
								部门名称
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;操作
							</td>
						</tr>
				<form action= "${pageContext.request.contextPath}/emp/deleteEmp.do" method="post">
				<c:forEach var="e" items="${requestScope.list}" varStatus="vs">
					<tr <c:if test="${ vs.count%2!=0 }">class="row1"</c:if> <c:if test="${vs.count%2==0 }">class="row2"</c:if> >
					<td><input type="checkbox" name="deleteId"  value=${e.id }  /></td>
							<td>${e.id}</td>
							<td>${e.name}</td>
							<td>${e.salary}</td>
							<td>${e.married}</td>
							<td>${e.dept.deptname}</td>
							<td>
								<a href='${pageContext.request.contextPath}/emp/dropOneEmp.do?id=${e.id}'>delete</a>&nbsp;
								<a href='${pageContext.request.contextPath}/emp/queryOneEmp.do?id=${e.id}'>update</a>
							</td>
							</tr>
				</c:forEach>
					</table>
					<p>
					    <c:if test="pageNum > 1">
						   <a href="${pageContext.request.contextPath}/emp/showAllAction?pageNum=<s:property value="pageNum-1"/>">上一页</a> 
						</c:if>
						<span style="margin-left:10px">&nbsp;</span> 
						<c:if test="count > pageNum*5">
					    	<a href='<s:url action="showAllAction" namespace="/emp"/>?pageNum=<s:property value="pageNum+1"/>'>下一页</a>
					    </c:if>
					    &nbsp;&nbsp;&nbsp;
					    <input type="submit" class="button" value = "Delete" />
				</form>
					</p>
					<p>
						<input type="button" class="button" value="Add Employee" onclick="location='${pageContext.request.contextPath}/view/addEmp.jsp'"/>
					</p>
					
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
