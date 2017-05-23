<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html class="login-alone">
    <head>
    	<base href="<%=basePath%>">
    
	    <title>运动手环服务器端管理系统</title>
	    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta name="keywords" content="登录页面" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/script/homeAction/res/homepage/favicon.ico?v=3.9" />
        <link rel="stylesheet" type="text/css" media="screen, projection" href="${pageContext.request.contextPath}/script/homeAction/res/ui/css/screen.css?v=3.9">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/script/homeAction/res/ui/css/base.css?v=3.9">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/script/homeAction/res/passport/css/login.css?v=3.9">
        <!--[if lt IE 9]>
        <script>
        window.location="homepage/support";
        </script>
        <![endif]-->
    </head>
    <body onLoad="document.forms.form_name.loginName.focus()">
        <div class="logina-logo" style="height: 55px">
                <img src="${pageContext.request.contextPath}/script/homeAction/res/passport/images/toplogo.png?v=3.9" height="60" alt="">
        </div>
        <div class="logina-main main clearfix">
            <div class="tab-con">
                <form id="form-login" method="post" action="homeAction_login.action" name="form_name">
                    <div id='login-error' class="error-tip"></div>
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <th>登录名</th>
                                <td width="245">
                                    <input id="loginName" type="text" name="loginName" placeholder="请输入登录名" autocomplete="off" value="" onfocus = ""></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>密&nbsp;&nbsp;&nbsp;&nbsp;码</th>
                                <td width="245">
                                    <input id="password" type="password" name="password" placeholder="请输入密码" autocomplete="off">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr id="tr-vcode" style="display: none;" >
                                <th>验证码</th>
                                <td width="245">
                                    <div class="valid">
                                        <input type="text" name="vcode" placeholder="请输入验证码"><img class="vcode" src="" width="85" height="35" alt="">
                                    </div>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr class="find">
                                <th></th>
                                <td>
                                    <div>
                                        <label class="checkbox" for="chk11"><input style="height: auto;" id="chk11" type="checkbox" name="remember_me" >记住我</label>
                                        <a href="passport/forget-pwd">忘记密码？</a>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td width="245"><input class="confirm" type="submit" value="登  录"></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="refer" value="site/">
                </form>
            </div>
             
            <div class="reg">
                <p><i><b>Welcome</b></i><br><i><b>to WristbandAppSystem！</b></i></p>
                
            </div>
            
            <!-- 
            //此处原为注册部件
            <div class="reg">
                <p>还没有账号？<br>赶快免费注册一个吧！</p>
                <a class="reg-btn" href="RegisterForm.jsp">立即免费注册</a>
            </div>
             -->
             
        </div>
        <div id="footer">
            <div class="copyright">Copyright © 2014 zzuli.cn. All Rights Reserved. 郑州轻工业学院 版权所有</div>
        </div>
    </body>
</html>