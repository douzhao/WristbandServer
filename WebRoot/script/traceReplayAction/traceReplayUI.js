var map;
var lushu;
var points;

$(function(){
	/**
	 * 添加百度地图
	 * @WY
	 */
	$('#trace').layout('collapse','east');
	
	map = new BMap.Map(document.getElementById('traceReplayUI'),{minZoom:3,maxZoom:22});
	map.centerAndZoom(new BMap.Point(101.403765, 38.914850), 5);
	
	map.enableScrollWheelZoom();
	map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]}));
    map.addControl(new BMap.ScaleControl());
    map.addControl(new BMap.OverviewMapControl());       //添加默认缩略地图控件
});

function query(){
	var id=$("#userId").val();
	var beginTime=$("#startDatetime").datetimebox("getValue");
	var endTime=$("#endDatetime").datetimebox("getValue");
	beginTime=formatString(beginTime);
	endTime=formatString(endTime);
	if(endTime<beginTime)
		jQuery.messager.alert('提示:','终止时间早于起始时间！','info');
	else{
		var url="${pageContext.request.contextPath}/traceReplayAction_getTraceReplayPositions.action?id="+id+"&beginTime="+beginTime+"&endTime="+endTime;
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : url,
			dataType : "json",
			data : {
			},
			success : function(locations) {
				points=locations;
				if(locations.length==0){
					jQuery.messager.alert('提示:','无位置信息！','info');
				}
				else{
					$('#trace').layout('expand','east');
					$('#userPositionList').datagrid({
			    		height: "300",
					    width:"100",
					    rownumbers:true,
					    data:locations,
					    fit:true,
					    singleSelect: true,
					    columns:[[{field:'time',title:'时间',align:'center'},
						          {field:'longitude',title:'经度',align:'center'},
					    		  {field:'latitude',title:'纬度',align:'center'}]],
						onClickRow:function(rowIndex,rowData){
			//				alert(rowData.id);
						},
						onRowContextMenu: function(e, rowIndex, rowData) { //右键时触发事件
						     e.preventDefault(); //阻止浏览器捕获右键事件
						     $(this).datagrid("clearSelections"); //取消所有选中项
						     $(this).datagrid("selectRow", rowIndex); //根据索引选中该行
						              
						     $positionInfo = rowData;
						              
						     $('#menu_1').menu('show', {//显示右键菜单
						          left: e.pageX,//在鼠标点击处显示菜单
						          top: e.pageY
						     });
						}
					});
				}
			}
		});
	}
}

function getPoint(){
	var new_point = new BMap.Point($positionInfo.longitude,$positionInfo.latitude);
	var marker = new BMap.Marker(new_point);  // 创建标注
	map.addOverlay(marker);  // 将标注添加到地图中
//	map.panTo(new_point); 
	map.centerAndZoom(new_point, 10);
	var content = "<table>";  
    content = content + "<tr><td> 位置信息</td></tr>";  
    content = content + "<tr><td> 经度："+$positionInfo.longitude+"</td></tr>"; 
    content = content + "<tr><td> 纬度："+$positionInfo.latitude+"</td></tr>";  
    content = content + "<tr><td> 时间："+$positionInfo.time+"</td></tr>";
    content += "</table>";
	var infoWindow = new BMap.InfoWindow(content);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){          
		map.openInfoWindow(infoWindow,new_point); //开启信息窗口
	});
}

function luShuPath(){
	map.clearOverlays(); 
	var longitude;
	var latitude;
	var point = new Array(); //存放标注点经纬信息的数组  
	var marker = new Array(); //存放标注点对象的数组 
	for(var i=0;i<points.length;i++){
		longitude=points[i].longitude;
		latitude=points[i].latitude;
		point[i] = new window.BMap.Point(longitude, latitude);
	}
	var polyline = new BMap.Polyline(point); //创建折线
	map.addOverlay(polyline); //绘制折线 
	map.setViewport(point);  //调整视野
	
	lushu = new BMapLib.LuShu(map, point, {
        defaultContent: "",
        autoView: true, //是否开启自动视野调整，如果开启那么路书在运动过程中会根据视野自动调整
        icon: new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/Mario.png', new BMap.Size(52, 26), { anchor: new BMap.Size(27, 13) }),
        enableRotation: true, //是否设置marker随着道路的走向进行旋转
        speed:100
    });    

}

function luShuStart(){
	lushu.start(); 
}

function luShuPause(){
	lushu.pause();
}

function formatString(str){
	str=str.replace(/-/g,"");
	str=str.replace(/:/g,"");
	str=str.replace(" ","");
	return str;
}