<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
    <title>用户注册</title>
</head>


<body onLoad="document.forms.form_name.loginName.focus()">
<center>
        <div class="logina-logo" style="height: 55px">
                <img src="${pageContext.request.contextPath}/script/homeAction/res/passport/images/toplogo.png?v=3.9" height="60" alt="">
        </div>
        <div class="logina-main main clearfix">
            <div class="tab-con">
                <form id="form-login" method="post" action="Register.jsp" name="form_name">
                    <div id='login-error' class="error-tip"></div>
                    <table border="0" cellspacing="0" cellpadding="0" style="border-collapse:separate; border-spacing:0px 10px;">
                            <tr>
                              <td colspan="2"><font size="5">用户注册页面</font></td>
                            </tr>
                        <tbody>
                            <tr>
                                <th>昵称</th>
                                <td width="245">
                                    <input id="userName" type="text" name="userName" placeholder="请输入想注册的昵称" autocomplete="off" value="" onfocus = ""></td>
                                <td>
                                </td>
                            </tr>
                                <th>用户名</th>
                                <td width="245">
                                    <input id="loginName" type="text" name="loginName" placeholder="请输入想注册的用户名" autocomplete="off" value="" onfocus = ""></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>密&nbsp;&nbsp;码</th>
                                <td width="245">
                                    <input id="userpassword" type="password" name="userpassword" placeholder="请输入英文或数字密码" autocomplete="off">
                                </td>
                                <td>
                                </td>
                            </tr>
                           <tr>
                                <th>性别</th>
                                <td width="245">
                                    <input id="userSex" type="text" name="userSex" placeholder="请输入性别" autocomplete="off" value="" onfocus = ""></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                            <tr>
                                <th>邮箱</th>
                                <td width="245">
                                    <input id="email" type="text" name="email" placeholder="请输入常用的邮箱地址" autocomplete="off" value="" onfocus = ""></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th>地区编码</th>
                                <td width="245">
                                    <input id="areaId" type="text" name="areaId" placeholder="请输入所在地区邮政编码" autocomplete="off" value="" onfocus = ""></td>
                                <td>
                                </td>
                            </tr>
                            <tr>                              
                                <th><th width="245"><input class="confirm" type="submit" value="注  册"></th></th>
                                </tr>
                            <tr>
                                <th><th width="245"><input class="confirm" type="reset" value="重  置"></th></th>                              
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="refer" value="site/">
                </form>
            </div>
        </div>
        <div id="footer">
            <div class="copyright">Copyright © 2014 zzuli.cn. All Rights Reserved. 郑州轻工业学院 版权所有</div>
        </div>
      </center>  
    </body>
</html>