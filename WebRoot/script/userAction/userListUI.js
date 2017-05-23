$(function() { 
  $("#userList").datagrid({ 
      url : '${pageContext.request.contextPath}/userAction_usersList.action', 
      title : '用户列表', 
      pagination : true, 
//      pageSize : 10, 
//      pageList : [ 10, 20, 30, 40 ], 
      fit : true,//自适应窗口大小变化 
      striped: true,
      pagination:true,//分页控件 
      rownumbers:true,//行号 
      width: 700, 
      height: 'auto',
      singleSelect:true,
      fitColumns : true, 
      border : false, 
      idField : 'id', 
      columns : [ [ { 
          title : '用户编号', 
          field : 'id', 
          width : 100 
      //宽度必须，数值随便 
      }, { 
          title : '用户名', 
          field : 'userName', 
          width : 100 
      }, { 
          title : '用户密码', 
          field : 'password', 
          width : 100 
      },{ 
          title:'注册时间', 
          field:'date', 
          width:100 
      } ] ], 
      toolbar : [ { 
          text : '增加', 
          iconCls : 'icon-add', 
          handler : function() { 
          }
      }, '-', { 
          text : '删除', 
          iconCls : 'icon-remove', 
          handler : function() { 
          } 
      }, '-', { 
          text : '编辑', 
          iconCls : 'icon-edit', 
          handler : function() { 
          } 
      } ] 

  //两个[],实现多级表头，合并单元格的效果，产生不规则表头   
  }); 
  var p = $('#userList').datagrid('getPager');    
  $(p).pagination({    
       pageSize: 10,//每页显示的记录条数，默认为10    
       pageList: [10,20,30,40,50],//可以设置每页记录条数的列表    
       beforePageText: '第',//页数文本框前显示的汉字    
       afterPageText: '页    共 {pages} 页',    
       displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'  
   });
}); 
