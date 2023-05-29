<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"  import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>update Emp</title>
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
						update Emp info:
					</h1>
					<s:action namespace="/emp" name="selectAllDeptAction" executeResult="false"></s:action>
					<form action="${pageContext.request.contextPath}/emp/updateEmpAction" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									id:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="id" value='<s:property value="#request.emp.id" />' readonly/>
								</td>
							</tr>
							
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="name" value='<s:property value="#request.emp.name" />'/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									salary:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="salary" value='<s:property value="#request.emp.salary" />' />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									married
								</td>
								<td valign="middle" align="left">
									<input type="radio" class="inputgri" name="married" value="1" <s:if test="#request.emp.married01==1" > checked </s:if>/>已婚
									<input type="radio" class="inputgri" name="married" value="0" <s:if test="#request.emp.married01==0" > checked </s:if>/>未婚
									
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									deptname:
								</td>
								<td valign="middle" align="left">
							
									<select name="did">
										<s:iterator value="#request.list">
											
											<option value='<s:property value="did"/>' <s:if test="did==#request.emp.did">selected="selected"</s:if>><s:property value="deptname"/></option>
										</s:iterator>
									</select>
								</td>
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
