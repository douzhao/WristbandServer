/**
 * 
 */
$(function(){
	id=123;
	$.ajax({
		type: "GET",
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/phyCondAction_heartChartJson.action",
		dataType: "json",
		data : {
			id : id
		},
		success: function(datas){
			if(datas.length==0){
	//			map.removeMarker();
				jQuery.messager.alert('提示:','暂无心率信息!','info');
			}
			else{
				var by = function(name){
					 return function(o, p){
					   var a, b;
					   if (typeof o === "object" && typeof p === "object" && o && p) {
					     a = o[name];
					     b = p[name];
					     if (a === b) {
					       return 0;
					     }
					     if (typeof a === typeof b) {
					       return a < b ? -1 : 1;
					     }
					     return typeof a < typeof b ? -1 : 1;
					   }
					   else {
					     throw ("error");
					   }
					 }
					};
					datas.sort(by('time'))
				
				var value=[];
				var labels=[];
				for(var i=0;i<datas.length;i++)
					{
					value.push(datas[i].fre);
					labels.push(datas[i].time);
					}

				
				var data = [
				         	{
				         		name : '心率',
				         		value:value,
				         		color:'#0d8ecf',
				         		line_width:2
				         	}
				         ];
		         
				
				var line = new iChart.LineBasic2D({
					render : 'canvasDiv',
					data: data,
					align:'center',
					title : '心率折线图',
					subtitle : '用户心率(单位：次/分钟)',
					footnote : '数据来源：527智能手环',
					width : 1100,
					height : 600,
					sub_option:{
						smooth : true,//平滑曲线
						point_size:10
					},
					tip:{
						enable:true,
						shadow:true
					},
					legend : {
						enable : false
					},
					crosshair:{
						enable:true,
						line_color:'#62bce9'
					},
					coordinate:{
						width:1000,
						valid_width:500,
						height:500,
						axis:{
							color:'#9f9f9f',
							width:[0,0,2,2]
						},
						grids:{
							vertical:{
								way:'share_alike',
						 		value:12
							}
						},
						scale:[{
							 position:'left',	
							 start_scale:0,
							 end_scale:100,
							 scale_space:10,
							 scale_size:2,
							 scale_color:'#9f9f9f'
						},{
							 position:'bottom',	
							 labels:labels
						}]
					}
				});
			//开始画图
			line.draw();

			
			}
		}
	});
		});