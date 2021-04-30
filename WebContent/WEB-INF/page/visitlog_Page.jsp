<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/layui/css/layui.css">
</head>
<body>
<ul class="layui-timeline">
<c:forEach items="${loglist}" var="log" >
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
    <div class="layui-timeline-content layui-text">
      <h3 class="layui-timeline-title">${log.User_realname}--${log.Visit_time}</h3>
      <p>
        <c:if test="${log.Visit_payment==1}">
              志愿时长：${log.Visit_money}小时
        </c:if>
        <br>留言：
        <br>&nbsp;&nbsp;&nbsp;${log.Visit_customer_info}
      </p>
    </div>
  </li>
</c:forEach>

  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title">过去</div>
    </div>
  </li>
   
</ul>
<script src="static/layui/layui.all.js"></script>
</body>
</html>