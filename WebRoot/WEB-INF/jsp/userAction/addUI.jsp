<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUI.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
    <form action="Register.jsp" method="post">
    <table>
        <tr>
            <td colspan="2">用户注册</td>
        </tr>
                <tr>
            <td>昵称：</td>
            <td><input type="text" name="userName"></td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="loginName"></td>
        </tr>
        <tr>
            <td>密&nbsp;&nbsp;码：</td>
            <td><input type="password" name="userpassword"></td>
        </tr>
                <tr>
            <td>性别：</td>
            <td><input type="text" name="userSex"></td>
        </tr>
        <tr>
            <td>邮箱：</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>地区编码：</td>
            <td><input type="text" name="areaId"></td>
        </tr>
        <tr>
             <td colspan="2">
             <input type="submit" value="注册">
             <input type="reset" value="重置">
             </td>
         </tr>     
    </table>
    </form>
    </center>  
  </body>
</html>