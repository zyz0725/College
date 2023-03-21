<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="base_path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>echars sex map</title>
<!-- 引入echarts.js的js -->
<script src="js/echarts.min.js"></script>
</head>
<body>
<!-- 创建一个DOM -->
<div id="showSex" style="width:100%;height:100%;"></div>
 <script type="text/javascript">
 //获取DOM
 var myecharts=echarts.init(document.getElementById("showSex"));
 $(function () {
     $.post("${base_path}/user/sex.do", function (data) {
    	 var option=({
    	     title:{
    	         text:'性别比例',//主标题文本，支持\n换行
    	         subtext: '用户性别比例，更新于'+new Date().getFullYear()+"-"+(new Date().getMonth()+1)+"-"+new Date().getDate(),//副文本
    	       //副文本链接sublink : 'http://esa.un.org/wpp/Excel-Data/population.htm',
    	         left:'center',//离容器左侧的距离
    	         top:'30px',//距离容器上测的距离
    	         itemGap: 15,
    	         textStyle: {//主标题文本样式{"fontSize": 18,"fontWeight": "bolder","color": "#333"}
    	                //fontFamily: 'Arial, Verdana, sans...',
    	                fontSize: 24,
    	                //fontStyle: 'normal',
    	                //fontWeight: 'normal',
    	                color:'white'
    	            },
    	     },
    	     color:['red', 'green'],
    	     backgroundColor: '#3c456c',//背景颜色
    	     textStyle: {
    	                 color: 'rgba(255, 255, 255, 200)'//文字的颜色
    	             },
    	     series : [
    	         {
    	             name: '性别',
    	             type: 'pie',//每个系列，通过type决定自己的系列型号
    	             radius: '55%',
    	             //center: ['50%', '60%'],
    	             data:data,
    	             //roseType: 'angle',
				
    	             itemStyle: {//图形样式 normal，emphasis
    	                 emphasis: {
    	                     shadowBlur: 250,
    	                     shadowColor: 'rgba(255, 255, 255, 0.5)'
    	                 }
    	             },
    	            /*  label: {//饼形图上的文本标签
    	                 normal: {
    	                     textStyle: {
    	                         color: 'rgba(255, 255, 255, 200)'
    	                     }
    	                 }
    	             }, */
    	             label : {
    	            	 normal : {
    	            	 formatter: '{b}:{c}: ({d}%)',
    	            	 textStyle : {
    	            	 fontWeight : 'normal',
    	            	 fontSize : 15
    	            	 }
    	            	 }
    	            	 }, 
    	             labelLine: {//标签的视觉引导线
    	                 normal: {
    	                     lineStyle: {
    	                         color: 'rgba(255, 255, 255, 0.3)'
    	                     }
    	                 }
    	             }

    	         }
    	     ]
    	 });
    	 myecharts.setOption(option);
  	 
     }, "json");

 });

 </script>
<!-- 
1.引入echarts.min.js
2.准备DOM
3.初始化echars实例
4.准备数据项
5.调用setOption方法将数据和图标显示在图表上
 -->
</body>
</html>