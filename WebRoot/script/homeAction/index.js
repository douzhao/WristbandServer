/*
	主页加载方法
	@eric
*/
//系统时间显示
setInterval("document.getElementById('nowTime').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
var setting = {
	data: {
		simpleData: {
			enable: true
		}
	},
	view: {
		selectedMulti: false
	}
};

var map;

/**
 * locationAction_getAreaList
 * 查询所有的省份
 * @WY
 */
$(function(){
	$.ajax({
		type : "GET",
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/locationAction_getAreaList.action",
		dataType : "json",
		data : {
		},
		success : function(provinceListdata) {
			$("#provinceList").empty();
			$("#provinceList").append("<option>"+"------请选择------"+"</option>");
			for ( var i = 0; i < provinceListdata.length; i++) {	
				$("#provinceList").append("<option value='"+provinceListdata[i].areaId+"+"+provinceListdata[i].areaName+"'>"+ provinceListdata[i].areaName + "</option>");
			}
		}
	});
	
});

$(function(){
	/**
	 * 添加百度地图
	 * @WY
	 */
	map = new BMap.Map(document.getElementById('container'),{minZoom:3,maxZoom:22});
	map.centerAndZoom(new BMap.Point(60.403765, 53.914850), 5);
	map.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]}));
	map.enableScrollWheelZoom();
	map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.ScaleControl());
    map.addControl(new BMap.OverviewMapControl());       //添加默认缩略地图控件
    
    /**
     * 根据所选省份，在百度地图上标记相应的省份，并显示该省下的县
     * @WY
     */
    $('#provinceList').change(function(){
		var str = this.value;
		var strs= new Array(); //定义一数组 
		strs=str.split("+"); //字符分割 
		var area=strs[1]; //省的名称
		var areaId=strs[0]; //省的代码
		getUsersList(areaId.substring(0,2));
		getBoundary(area);
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/locationAction_getAreaList.action",
			dataType : "json",
			data : {
				areaId:areaId
			},
			success : function(cityListdata) {
				$("#cityList").empty();
				$("#cityList").append("<option>"+"------请选择------"+"</option>");
				$("#areaList").empty();
				$("#areaList").append("<option>"+"------请选择------"+"</option>");
				for ( var i = 0; i < cityListdata.length; i++) {	
					$("#cityList").append("<option value='"+cityListdata[i].areaId+"+"+cityListdata[i].areaName+"'>"+ cityListdata[i].areaName + "</option>");
				}
			}
		});
	})
	
	/**
	 * 根据所选县，在百度地图上标记相应的县，并显示该县下的地区
	 * @WY
	 */
	 $('#cityList').change(function(){
		var str = this.value;
		var strs= new Array(); //定义一数组 
		strs=str.split("+"); //字符分割 
		var area=strs[1]; //省的名称
		var areaId=strs[0]; //省的代码
		getUsersList(areaId.substring(0,4));
		getBoundary(area);
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/locationAction_getAreaList.action",
			dataType : "json",
			data : {
				areaId:areaId
			},
			success : function(areaListdata) {
				$("#areaList").empty();
				$("#areaList").append("<option>"+"------请选择------"+"</option>");
				for ( var i = 0; i < areaListdata.length; i++) {	
					$("#areaList").append("<option value='"+areaListdata[i].areaId+"+"+areaListdata[i].areaName+"'>"+ areaListdata[i].areaName + "</option>");
				}
			}
		});
	})
	
	/**
	 * 地区改变时，在百度地图上标记相应的地区
	 * @WY
	 */
	$('#areaList').change(function(){
		var str = this.value;
		var strs= new Array(); //定义一数组 
		strs=str.split("+"); //字符分割 
		var area=strs[1]; //省的名称
		var areaId=strs[0]; //省的代码
		getBoundary(area);
		getUsersList(areaId);
	})
    
	/**
	 * 显示相应地区下的用户
	 * @WY
	 */
	function getUsersList(code){
    	$('#userInfoList').datagrid({
    		height: "100%",
		    width:"100%",
		    rownumbers:true,
		    url: "${pageContext.request.contextPath}/userAction_getUsersList.action",
		    method: 'POST',
		    queryParams: { 'code': code },
		    fit:true,
		    singleSelect: true,
		    columns:[[{field:'id',title:'主键',hidden:true},
			          {field:'userName',title:'用户名',width:'102',align:'center'},
		    		  {field:'userSex',title:'性别',width:'42',align:'center'}]],
			onClickRow:function(rowIndex,rowData){
//				alert(rowData.id);
			},
			onRowContextMenu: function(e, rowIndex, rowData) { //右键时触发事件
			     e.preventDefault(); //阻止浏览器捕获右键事件
			     $(this).datagrid("clearSelections"); //取消所有选中项
			     $(this).datagrid("selectRow", rowIndex); //根据索引选中该行
			              
			     $userInfo = rowData;
			              
			     $('#menu').menu('show', {//显示右键菜单
			          left: e.pageX,//在鼠标点击处显示菜单
			          top: e.pageY
			     });
			}
		});
    }
    
	/**
	 * 根据所选地区，标记该地区
	 */
    function getBoundary(area){       
	    var bdary = new BMap.Boundary();
	 	var name=area;
	    bdary.get(name, function(rs){       //获取行政区域
	        map.clearOverlays();        //清除地图覆盖物       
	        var count = rs.boundaries.length; //行政区域的点有多少个
	        var pointArray = [];
	        for(var i = 0; i < count; i++){
	            var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#ff0000",fillColor:""}); //建立多边形覆盖物
	            map.addOverlay(ply);  //添加覆盖物
	            map.setViewport(ply.getPath());    //调整视野    
	        	pointArray = pointArray.concat(ply.getPath());
	        } 
	        map.setViewport(pointArray);    //调整视野               
	    });   
	}
	
});

function usersList(){
	var url="${pageContext.request.contextPath}/userAction_usersListUI.action";
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>'; 
	$('#tabs').tabs('add',{
		title:"用户管理",
		content:content,
		closable:true
	});
}

/**
 * 地理位置信息管理表格菜单
 * getPosition -- 获取坐标并实现标注
 * getTraceReplay -- 轨迹回放
 * detailedInformation -- 查看详细信息
 * heartRateData -- 获取心率数据
 * hinkingData -- 获取徒步数据
 * bloodPressureData -- 获取血压数据
 * sleepData -- 获取睡眠数据
 */
function getPosition(){
	var id=$userInfo.id;
	$('#tabs').tabs('select', "地图");
	$.ajax({
		type: "GET",
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/positionAction_getPosition.action",
		dataType: "json",
		data : {
			id : id
		},
		success: function(data){
			if(data.length==0){
	//			map.removeMarker();
				jQuery.messager.alert('提示:','暂无位置信息!','info');
			}
			else{
				var latitude=data[0].latitude;
				var longitude=data[0].longitude;
				var new_point = new BMap.Point(longitude,latitude);
				var marker = new BMap.Marker(new_point);  // 创建标注
				map.addOverlay(marker);  // 将标注添加到地图中
//				map.panTo(new_point); 
				map.centerAndZoom(new_point, 10);
				var content = "<table>";  
                content = content + "<tr><td> 位置信息</td></tr>";  
                content = content + "<tr><td> 经度："+longitude+"</td></tr>"; 
                content = content + "<tr><td> 纬度："+latitude+"</td></tr>";  
                content = content + "<tr><td> 时间："+data[0].time+"</td></tr>";
                content += "</table>";
				var infoWindow = new BMap.InfoWindow(content);  // 创建信息窗口对象 
				marker.addEventListener("click", function(){          
					map.openInfoWindow(infoWindow,new_point); //开启信息窗口
				});
			}
		}
	});
}
	
function getTraceReplay(){
	var url="${pageContext.request.contextPath}/traceReplayAction_traceReplayUI.action?id="+$userInfo.id;
	var title = "轨迹回放" + "【" + $userInfo.userName + "】";
	if($("#tabs").tabs("getTab",title)){
		$("#tabs").tabs("close",title);
	}
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';    
	$('#tabs').tabs('add',{    
	       title:title,    
	       content:content,    
	       closable:true    
	});
}

function detailedInformation(){
	
}

function heartRateData(){
	var url="${pageContext.request.contextPath}/phyCondAction_heartRateUI.action?id="+$userInfo.id;
	var title = "心率数据" + "【" + $userInfo.userName + "】";
	if($("#tabs").tabs("getTab",title)){
		$("#tabs").tabs("close",title);
	}
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';    
	$('#tabs').tabs('add',{    
	       title:title,    
	       content:content,    
	       closable:true    
	}); 
}

function hinkingData(){
	var url="${pageContext.request.contextPath}/phyCondAction_hinkingUI.action?id="+$userInfo.id;
	var title = "徒步数据" + "【" + $userInfo.userName + "】";
	if($("#tabs").tabs("getTab",title)){
		$("#tabs").tabs("close",title);
	}
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';    
	$('#tabs').tabs('add',{    
	       title:title,    
	       content:content,    
	       closable:true    
	}); 
}

function bloodPressureData(){
	var url="${pageContext.request.contextPath}/phyCondAction_bloodPressureUI.action?id="+$userInfo.id;
	var title = "血压数据" + "【" + $userInfo.userName + "】";
	if($("#tabs").tabs("getTab",title)){
		$("#tabs").tabs("close",title);
	}
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';    
	$('#tabs').tabs('add',{    
	       title:title,    
	       content:content,    
	       closable:true    
	}); 
}

function sleepData(){
	var url="${pageContext.request.contextPath}/phyCondAction_sleepUI.action?id="+$userInfo.id;
	var title = "睡眠数据" + "【" + $userInfo.userName + "】";
	if($("#tabs").tabs("getTab",title)){
		$("#tabs").tabs("close",title);
	}
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';    
	$('#tabs').tabs('add',{    
	       title:title,    
	       content:content,    
	       closable:true    
	}); 
}

function checkPersonInfor(){
	var url="${pageContext.request.contextPath}/userAction_checkPersonInforUI.action?id=" + $('#userID').val();
	var title = "个人信息"+"【"+ $('#userLoginName').val() +"】";
	if($("#tabs").tabs("getTab",title)){
		$("#tabs").tabs("close",title);
	}
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';    
	$('#tabs').tabs('add',{    
	       title:title,    
	       content:content,    
	       closable:true    
	}); 
}

function updatePassword(){
	var url="${pageContext.request.contextPath}/userAction_updatePasswordUI.action";
	var title = "修改密码"+"【"+ $('#userLoginName').val() +"】";
	if($("#tabs").tabs("getTab",title)){
		$("#tabs").tabs("close",title);
	}
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';    
	$('#tabs').tabs('add',{    
	       title:title,    
	       content:content,    
	       closable:true    
	}); 
}