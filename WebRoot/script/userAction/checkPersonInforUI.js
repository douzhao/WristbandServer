$(function(){
	$('#province').change(function(){
		var str = this.value;
		var strs= new Array(); //定义一数组 
		strs=str.split("+"); //字符分割 
		var area=strs[1]; //省的名称
		var areaId=strs[0]; //省的代码
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/locationAction_getAreaList.action",
			dataType : "json",
			data : {
				areaId:areaId
			},
			success : function(cityListdata) {
				$("#city").empty();
				$("#city").append("<option>"+"------请选择------"+"</option>");
				$("#area").empty();
				$("#area").append("<option>"+"------请选择------"+"</option>");
				for ( var i = 0; i < cityListdata.length; i++) {	
					$("#city").append("<option value='"+cityListdata[i].areaId+"+"+cityListdata[i].areaName+"'>"+ cityListdata[i].areaName + "</option>");
				}
			}
		});
	})
	
	$('#city').change(function(){
		var str = this.value;
		var strs= new Array(); //定义一数组 
		strs=str.split("+"); //字符分割 
		var area=strs[1]; //省的名称
		var areaId=strs[0]; //省的代码
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/locationAction_getAreaList.action",
			dataType : "json",
			data : {
				areaId:areaId
			},
			success : function(areaListdata) {
				$("#area").empty();
				$("#area").append("<option>"+"------请选择------"+"</option>");
				for ( var i = 0; i < areaListdata.length; i++) {	
					$("#area").append("<option value='"+areaListdata[i].areaId+"+"+areaListdata[i].areaName+"'>"+ areaListdata[i].areaName + "</option>");
				}
			}
		});
	})
	
});


