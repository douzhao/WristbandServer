<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatePasswordUI.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<%@ include file="/WEB-INF/jsp/public/common.jspf" %>
  </head>
  
  <body>
  	<div class="easyui-panel" style="width:auto" border="false">
    <form>
    	<table align="center">
    		<tr height="50">
                <td>用户名:</td>
                <td><input readonly="readonly" class="easyui-textbox" type="text" name="userName" data-options="required:true" value="${user.userName }"></input></td>
            </tr>
            <tr height="50">
                <td>旧密码:</td>
                <td><input class="easyui-textbox" type="password" name="oldPassword" data-options="required:true"></input></td>
            </tr>
            <tr height="50">
                <td>新密码:</td>
                <td><input class="easyui-textbox" type="password" name="Password" data-options="required:true"></input></td>
            </tr>
            <tr >
            	<td colspan="2" align="center">
            		<input class="easyui-button" type="submit" />
            		<input class="easyui-button" type="reset" />
            	</td>
            </tr>
    	</table>
    </form>
    </div>
  </body>
</html>

