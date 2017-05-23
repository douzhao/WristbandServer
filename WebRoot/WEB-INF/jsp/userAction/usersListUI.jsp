<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>智能手环服务器端管理系统</title>
    <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/script/userAction/userListUI.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/script/jquery-easyui-1.3.5/themes/color.css">
  </head>
  
  <body>
    <table id="userList"></table>
  </body>
</html>
