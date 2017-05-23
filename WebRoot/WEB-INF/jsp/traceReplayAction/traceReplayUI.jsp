<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
    <title>智能手环服务器端管理系统</title>
    <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/script/traceReplayAction/traceReplayUI.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js"></script>

  </head>
  
  <body>
    <!-- 轨迹回放页面开始 -->
	<div class="easyui-layout" data-options="fit:true" id="trace">
		<div data-options="region:'center',border:false" style="height:10%;">
			<div data-options="fit:true" style="height:100%;" id="traceReplayUI">
			</div>
		</div>
		<div data-options="region:'east',split:true,title:'人员坐标'" style="width:260px;">
				<table id="userPositionList" align="center" style="width: 260px;height: 700px;text-align: center;margin-top: 3px;"></table>
		</div>
		<div data-options="region:'south',split:true,title:'信息栏',collapsed:false" style="padding:0px;height: 100%;">
			<ul class="layoutUL">
				<li class="layoutLI">
					<div id="findCondition" title="查询条件" class="easyui-panel" data-options="" style="padding:10px 5px 10px 5px;width: 350px;height: auto;">
						<form id="conditionFrom">
							<ul style="list-style: none;">
								<li style="display: none;">
									用户：<input id="userId" name="nickId" type="text" value="${userInfo.id }"/>
								</li>
								<li>
									查询用户：<input readonly="readonly" id="userName" name="userName" value="${userInfo.userName }" class="easyui-textbox" data-options="readonly:true" style="width:150px;"/>
								</li>
								<li>
									起始时间：<input id="startDatetime" name="startDatetime" class="easyui-datetimebox" data-options="required:true,editable:false" style="width:150px;"/>
								</li>
								<li>
									终止时间：<input id="endDatetime" name="endDatetime" class="easyui-datetimebox" data-options="required:true,editable:false" style="width:150px;"/>
								</li>
								<li>
									<a id="queryButton" name="queryButton" class="easyui-linkbutton" data-options="" onclick="query();">查询</a>
									<a id="pathButton" name="pathButton" class="easyui-linkbutton" data-options="" onclick="luShuPath();">轨迹</a>
									<a id="playButton" name="playButton" class="easyui-linkbutton" data-options="" onclick="luShuStart();">播放</a>
									<a id="pauseButton" name="pauseButton" class="easyui-linkbutton" data-options="" onclick="luShuPause();">暂停</a>
								</li>
							</ul>
						</form>
					</div>
					<!-- <div id="findCondition" title="播放速度" class="easyui-panel" data-options="" style="padding:30px;width:320px;height: auto;">
						<div style="margin: 10px;">
							<input id="locus-slider" class="easyui-slider slider-f" value="20" style="width: 235px; display: none;" data-options="min:20,max:100,showTip:true,rule:[20,'|',40,'|',60,'|',80,'|',100]" />
						</div>
					</div> -->
				</li>
			</ul>
		</div>
	</div>
	<div id="menu_1" class="easyui-menu" style="width: 120px; display: none;">
    	<!--放置一个隐藏的菜单Div-->
    	<div onclick="getPoint();">显示位置</div>
    	<div onclick="removePoint();">清除位置</div>
    </div>
  </body>
</html>
