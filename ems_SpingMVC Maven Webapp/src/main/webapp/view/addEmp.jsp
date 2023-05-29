<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"  import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>add Emp</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/style.css" />
	</head>

	<body>
		<div id="wrap">
			<div id="top_content">
					<div id="header">
						<div id="rightheader">
							<p>
								<%= new Date() %>
								<br />
							</p>
						</div>
						<div id="topheader">
							<h1 id="title">
								<a href="${pageContext.request.contextPath}/protected/showAllEmpAction">Main</a>
							</h1>
						</div>
						<div id="navigation">
						</div>
					</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						add Emp info:
					</h1>
					<!-- 引入Action -->
					<form action="${pageContext.request.contextPath}/emp/addEmp.do" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="name" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									salary:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="salary" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									married
								</td>
								<td valign="middle" align="left">
									<input type="radio" class="inputgri" name="married" value="1"/>已婚
									<input type="radio" class="inputgri" name="married" value="0"/>未婚
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									deptName:
								</td>
								<td>
									<select name="did">
										<c:forEach var="e" items="${requestScope.list}">
											<option value="${e.did}">${e.deptname}</option>
										</c:forEach>
									</select>
								</td>
								<!-- <td valign="middle" align="left">
									<input type="text" class="inputgri" name="deptName" />
								</td> -->
							</tr>
						</table>
						<p>
							<input type="submit" class="button" value="Confirm" />
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
