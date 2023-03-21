<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
    $(function () {
        $('#showAllLogs').edatagrid({
            url:'${pageContext.request.contextPath}/log/showAllLogs.do',
            columns:[[
                {field:'id',title:'编号',width:100},
                {field:'username',title:'人员',width:100},
                {field:'operation',title:'操作',width:100},
                {field:'time',title:'时间',width:100,}
            ]],
            fit:true,
            fitColumns:true,
            pagination:true,
            pageList:[5,8,10],
            pageSize:5,
        });
    })


</script>




<table id="showAllLogs"></table>

