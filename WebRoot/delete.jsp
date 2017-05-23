<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>删除用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
      //设置接收编码格式
      request.setCharacterEncoding("utf-8");
      //接收参数loginName
      String reqLoginName = request.getParameter("loginName");
     %>
     <%
       String Url = "jdbc:mysql://localhost:3306/wristbandappsystem";
       String user = "root";
       String password = "123456";
       Connection conn = null;
       PreparedStatement pstmt = null;
       try{
         Class.forName("com.mysql.jdbc.Driver");//加载JDBC驱动
         conn = DriverManager.getConnection(Url,user,password);//连接sql数据库
          }catch (ClassNotFoundException e){
            out.println("找不到驱动类");
            } catch (SQLException e){
              out.println("连接sql数据库失败");
              }
              try{
              //添加注册用户信息
              String deleteUser = "DELETE FROM app_user WHERE loginName = ?;";
              //创建预处理语句对象preparedStatement
              pstmt = conn.prepareStatement(deleteUser);
              //设置参数
              pstmt.setString(1, reqLoginName);
              //删除用户
              pstmt.executeUpdate();
              } catch(SQLException e){
                out.println("添加用户信息失败");
                e.printStackTrace();
                }
              //关闭数据库
              try{
                if(pstmt != null){
                pstmt.close();
                pstmt = null;
                }
                if(conn != null){
                conn.close();
                conn = null;
                }
                  }catch(Exception e){
                  out.println("数据库关闭异常");
                  }
      %>
  </body>
</html>
