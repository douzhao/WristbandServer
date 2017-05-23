<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
    <title>添加用户</title>
</head>
<body>
<center>
<form action="Register.jsp" method="post">
<table>
<tr>
    <td colspan="2"><font size="5"><b>注册用户</b></font></td>
</tr>
<tr>
    <td>昵称：</td>
    <td><input Type="text" name="userName"></td>
    </tr>
    <tr>
    </tr>
    <tr>
    <td>用户名：</td>
    <td><input Type="text" name="loginName"></td>
    </tr>
    <tr>
    </tr>
    <tr>
     <td>密&nbsp;&nbsp;码：</td>
    <td><input Type="password" name="userpassword"></td>
    </tr>
    <tr>
        <td colspan="2">
        <input Type="submit" value="注册">
        <input Type="reset" value="重置">
        </td>
        </tr> 
</table>
</form>
</center>
</body>
</html>