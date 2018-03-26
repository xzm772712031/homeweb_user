<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">
 $(function(){
    $("#btn").click(function(){
        var name = $("#doc-vld-name-2").val();
            $.ajax({
                type:'post',
                url:'login2',
                dataType:"json",
                data:{userAccount:name},
                success:function (data){    
                    alert(123);                                           
              },       
              error:function(data){
               alert(13);
              }
            })
             }); 
             
             
}); 
</script>
  </head>
  
  <body>
   <form action="">
   <input type="text" id="doc-vld-name-2"> 
   <input type="button" value="测试"id="btn">
   </form>
  </body>
</html>
