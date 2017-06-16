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
    
    <title>My JSP 'heartRateUI.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/script/phyCondAction/heartRate.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<div id="canvasDiv"><div id="shell-basicline2d_4841598019179" style="padding: 0px; margin: 0px auto; overflow: hidden; position: relative; width: 800px; height: 400px;"><canvas height="400" width="800" id="basicline2d_4841598019179" style="width: 800px; height: 400px;"><p>Your browser does not support the canvas element</p></canvas><div style="position: absolute; z-index: 999; width: 0px; height: 0px; top: 85px; left: 100px; visibility: visible; opacity: 1;"><div style="width: 600px; height: 1px; background-color: rgb(98, 188, 233); position: absolute; top: 163.3px;"></div><div style="width: 1px; height: 260px; background-color: rgb(98, 188, 233); position: absolute; left: 374.5px;"></div></div><div style="box-shadow: 0px 0px 4px rgb(102, 102, 102); border: 2px solid rgb(13, 142, 207); border-radius: 5px; position: absolute; z-index: 0; text-align: left; padding: 4px 5px; cursor: pointer; background-color: rgba(239, 239, 239, 0.85); font-size: 12px; color: black; opacity: 1; transition: opacity 0.3s ease-out 0s, top 0.1s ease-out 0s, left 0.1s ease-out 0s; top: 208.8px; left: 426px; visibility: visible;">PV 37</div></div></div>
  </body>
</html>
