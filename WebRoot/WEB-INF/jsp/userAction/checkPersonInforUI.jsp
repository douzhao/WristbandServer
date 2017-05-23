<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkPersonInforUI.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<%@ include file="/WEB-INF/jsp/public/common.jspf" %>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/userAction/checkPersonInforUI.js"></script>
  	
  </head>
  
  <body>
   <div class="easyui-panel" style="width:auto" border="false">
        <form id="personInfor" method="post">
            <table align="center" width="700">
            	<input  type="hidden" name="id" value="${user.id }"></input>
                <tr height="40">
                    <td>用户名:</td>
                    <td><input readonly="readonly" class="easyui-textbox" type="text" name="userName" data-options="required:true" value="${user.userName }"></input></td>
                    <td>登录名:</td>
                    <td><input class="easyui-textbox" type="text" name="loginName" data-options="required:true" value="${user.loginName }"></input></td>
                </tr>
                <tr height="40">
                    <td>性&nbsp;&nbsp;别:</td>
                    <td><input class="easyui-textbox" type="text" name="userSex" data-options="required:true" value="${user.userSex }"></input></td>
                    <td>Email:</td>
                    <td><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'" value="${user.email }"></input></td>
                </tr>
                <tr height="40">
                    <td>所在省:</td>
                    <td>
                    	<select id="province" name="province" style="width: 140px;">
                    		<c:forEach items="${provinces }" var="item" varStatus="status">
                    			<c:choose>
                    				<c:when test="${item.areaId == province.areaId }">
                    					<option value="${item.areaId }+${item.areaName }" selected="selected">${item.areaName }</option>
                    				</c:when>
                    				<c:otherwise>
                    					<option value="${item.areaId }+${item.areaName }">${item.areaName }</option>
                    				</c:otherwise>
	                        	</c:choose>
                    		</c:forEach>
                        </select>
                    </td>
                    <td>所在市:</td>
                    <td>
                    	<select id="city" name="city" style="width: 140px;">
	                        <c:forEach items="${citys }" var="item">
	                        	<c:choose>
		                        	<c:when test="${item.areaId == city.areaId }">
		                        		<option value="${item.areaId }+${item.areaName }" selected="selected">${item.areaName }</option>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<option value="${item.areaId }+${item.areaName }">${item.areaName }</option>
		                        	</c:otherwise>
                        		</c:choose>
                        	</c:forEach>
                        </select>
                    </td>
                </tr>
                <tr height="40">
                    <td>所在县:</td>
                    <td>
                        <select id="area" name="area" style="width: 140px;">
                        	<c:forEach items="${areas }" var="item">
	                        	<c:choose>
	                        		<c:when test="${item.areaId == area.areaId}">
	                        			<option value="${item.areaId }+${item.areaName }" selected="selected">${item.areaName }</option>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<option value="${item.areaId }+${item.areaName }">${item.areaName }</option>
	                        		</c:otherwise>
	                        	</c:choose>
                        	</c:forEach>
                        </select>
                    </td>
                </tr>
                
                <td><font size="5" color="blue"><strong>密码修改!</strong></font></td>
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
            
                <!-- <tr height="40">
                	<td colspan="4" align="center">
                		<input type="submit"/>
                		<input type="reset"/>
                	</td>
                </tr> -->
                
            </table>
        </form>
    </div>
  </body>
</html>