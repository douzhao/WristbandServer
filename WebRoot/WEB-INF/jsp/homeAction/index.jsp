<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/script/homeAction/index.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
  </head>
  
  <body class="easyui-layout">
    <!-- 头部标题 -->
    <div data-options="region:'north',border:false" style="height:100px; padding:5px; background:#B0E0E6"> 
        <div style="margin-top: 20px; font-size: 30px;">智能手环服务器端管理系统</div>
        <span id="nowTime" style="margin-top: -45px;"></span>
        <span class="loginInfo" style="font-size:15px;font-weight:bold;">登录用户：<a href="javascript:checkPersonInfor()"><ins><b>${user.loginName }</b></ins></a>&nbsp;&nbsp;姓名：${user.userName }&nbsp;&nbsp;角色：系统管理员&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <input type="hidden" id="userID"  value="${user.id}"/>
        <input type="hidden" id="userLoginName"  value="${user.loginName}"/>
    </div>

	<!-- 左侧导航 -->
	<div data-options="region:'west',split:true,title:'导航菜单'" style="width:200px;"> 
        <div id="divTree" class="easyui-accordion" fit="true" border="false">
         
        	 <div data-options="iconCls:'icon-health'" title="健康数据">
                <div class="easyui-panel" fit="true" border="false">
                    <ul class="easyui-tree">
                        <li><a href="javascript:heartRateData();" icon="tu1201">心脉</a></li>
                        <li><a href="#" icon="tu1201">血压</a></li>
                        <li><a href="javascript:remo();" icon="tu1201">徒步</a></li>
                    </ul>
                </div>
            </div>
            
            <!-- 
            <div data-options="iconCls:'icon-set'" title="系统管理">
                <div class="easyui-panel" fit="true" border="false">
                    <ul class="easyui-tree">
                    	<li><a href="#" icon="tu1201">增加维护人员</a></li>
                    	<li><a href="#" icon="tu1201">删除维护人员</a></li>
                    </ul>
                </div>
            </div> 
             -->
            <div data-options="iconCls:'icon-users'" title="用户管理">
                <div class="easyui-panel" fit="true" border="false">
                    <ul class="easyui-tree">
                    	<li><a href="javascript:usersList();" icon="tu1201">查看用户</a></li>
                    	<li><a href="add.jsp" icon="tu1201">添加用户</a></li>
                    	<li><a href="#" icon="tu1201">编辑用户</a></li>
                    	<li><a href="deleteForm.jsp" icon="tu1201">删除用户</a></li>
                    </ul>
                </div>
            </div>
            <div data-options="iconCls:'icon-global'" title="地理位置管理">
            	<div id="ppp" class="easyui-layout" data-options="fit:true">
					<div data-options="region:'north',split:true,border:false" style="width:100%;height:150px;padding:10px;"><br />
							<li><b>省：</b>
		                    	<select id="provinceList" name="provinceList" style="width: 70%;">
								<option value="">------请选择------</option>
								</select>
							</li>
	                    	<li><b>市：</b>
	                    		<select id="cityList" name="cityList" style="width: 70%; margin-top: 6px;">
	                    		<option value="">------请选择------</option>
	                    		</select>
	                    	</li>
	                    	<li><b>县：</b>
	                    		<select id="areaList" name="areaList" style="width: 70%; margin-top: 6px;">
	                    		<option value="">------请选择------</option>
	                    		</select>
	                    	</li>
					</div>
					<div data-options="region:'center',split:true,border:false" style="width:100%;overflow-y:hidden; overflow:auto;">
						<table id="userInfoList" align="center" style="width: 100%;text-align: center;margin-top: 3px;"></table>
					</div>
				</div>
            </div>
            <!--
            <div data-options="iconCls:'icon-user'" title="个人信息管理">
                <div class="easyui-panel" fit="true" border="false">
                    <ul class="easyui-tree">
                    	<li><a href="javascript:checkPersonInfor();" icon="tu1201">修改个人信息</a></li>
                    	<li><a href="javascript:updatePassword();" icon="tu1201">修改密码</a></li>
                    </ul>
                </div>
            </div>
            -->
            
        </div>
	</div>
	
    <!-- 内容tabs -->
    <div id="center" data-options="region:'center'">
      <div id="tabs" class="easyui-tabs" fit="true"  border="false">
        <div title="欢迎" style="padding:30px;" >
			<div align="center" style="font-size: 40px; font-style: inherit;">欢迎使用</div>
		</div>
        <div title="地图" style="padding:10px;margin-bottom: 3px;" id="container">
		</div>
      </div>
    </div>
    
    <!-- 菜单 -->
    <div id="menu" class="easyui-menu" style="width: 120px; display: none;">
    	<!--放置一个隐藏的菜单Div-->
    	<div onclick="getPosition();">定位</div>
    	<div onclick="getTraceReplay();">查看轨迹回放</div>
    	<div onclick="detailedInformation();">查看详细信息</div>
    	<div>
    		<span>人员健康数据</span>
    		<div style="width: 100px;">
    			<div onclick="heartRateData();">心率数据</div>
    			<div onclick="hinkingData();">徒步数据</div>
    			<div onclick="bloodPressureData();">血压数据</div>
    			<div onclick="sleepData();">睡眠数据</div>
    		</div>
    	</div>
	</div>
	
    <!-- 页脚信息 -->
    <div data-options="region:'south',border:false" style="height:20px; background:#F3F3F3; padding:2px; vertical-align:middle;">
        <span id="sysVersion">系统版本：V1.0</span>
    </div>

  </body>
</html>
