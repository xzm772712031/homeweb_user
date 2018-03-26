<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
  <base href="<%=basePath%>">
  <title>因为专注，所以专业</title>
   <link rel="stylesheet" href="assets/css/amazeui.css" />
   <link rel="stylesheet" href="assets/css/common.min.css" />
   <link rel="stylesheet" href="assets/css/other.min.css" />
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <link rel="stylesheet" href="css/layui.css">
   <script src="layui.all.js"></script>
 </head>
 
 <body class="register-container">
    <div class="register-box">
        <legend>客户预约信息详情</legend>  
        <table class="am-table">
    <thead>
        <tr>
            <td>预约编号</td>
            <td>${bespeak.bespeakId }</td>   
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>客户姓名</td>
            <td>${bespeak.bespeakAtten }</td>
        
        </tr>
        <tr>
            <td>搬迁城市</td>
            <td>${bespeak.bespeakCity }</td>
         
        </tr>
        <tr >
            <td>搬出地</td>
            <td>${bespeak.bespeakOut }</td>
            
        </tr>
        <tr>
            <td>搬入地</td>
            <td>${bespeak.bespeakIn }</td>
          
        </tr>
        
          <tr>
            <td>搬运时间</td>
            <td>${bespeak.strDate }</td>
      
        </tr>
        <tr>
            <td>提交时间</td>
            <td>${bespeak.strDate2 }</td>
      
        </tr>
        <tr>
            <td>联系电话</td>
            <td>${bespeak.bespeakTel }</td>     
        </tr>
        <tr>
            <td>服务类型</td>
            <td>${bespeak.servicetype.serviceTypeName }</td>      
        </tr>
        <tr>
            <td>物品类型</td>
            <td>${bespeak.goodsType }</td>
        </tr>      
        <tr>
            <td>预约状态</td>
            <c:if test="${bespeak.bespeakState==0 }">
            <td>等待审核确认</td>
            </c:if>
            <c:if test="${bespeak.bespeakState==1 }">
            <td>已确认，等待订单分配</td>
            </c:if>     
            <c:if test="${bespeak.bespeakState==2 }">
            <td>预约的服务已经完成订单创建，相关详情可以查看订单</td>
            </c:if>
            <c:if test="${bespeak.bespeakState==5 }">
            <td>已取消</td>
            </c:if>
        </tr>         
         <tr>
            <td>其他说明</td>
            <td>${bespeak.bespeakAdd }</td>
        </tr>     
    </tbody>
</table>        
    </div> 
  <script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
  <script src="assets/js/amazeui.js" charset="utf-8"></script>
</body>

</html>
