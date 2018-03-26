<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript">
   </script>
</head>




<body class="register-container">
	
    <!--===========layout-header================-->
    <div class="layout-header am-hide-sm-only">
    

<div>


</div>
		<div class="register-box">
					
					<table class="am-table">
							<thead>
								<tr>
									<td>保险编号</td>
									<td>${insurance.insuranceId }</td>
								</tr>
							</thead>
							<tbody>
			 				<tr>
									<td>保单创建时间</td>
									<td>${insurance.strDate }</td>
								</tr>
								<tr>
									<td>收益人</td>
									<td>${insurance.insuranceOwner }</td>
								</tr>
								<tr>
									<td>身份证</td>
									<td>								
	                                  ${insurance.ownerIdentify }		
									</td>
								</tr>	
								<tr>
									<td>保单费用（元）</td>
									<td>${insurance.insuranceCost }</td>
								</tr>	
								<tr>
									<td>保额（万元）</td>
									<td>${insurance.insurancePrice }</td>
								</tr>
								<tr>
									<td>状态</td>
									<c:if test="${insurance.insuranceState==0 }">
									<td>未确认</td>
									</c:if>
									<c:if test="${insurance.insuranceState==1 }">
									<td>已确认</td>
									</c:if>
									<c:if test="${insurance.insuranceState==2 }">
									<td>已提交</td>
									</c:if>
										<c:if test="${insurance.insuranceState==3 }">
									<td>受理成功</td>
									</c:if>
										<c:if test="${insurance.insuranceState==4 }">
									<td>驳回</td>
									</c:if>
								</tr>			
								<tr>
									<td>保险说明</td>
									<td>${insurance.insuranceComment }</td>
								</tr>		
							</tbody>
						</table>
					</div>
				  </div>
	<script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
	<script src="assets/js/amazeui.js" charset="utf-8"></script>
</body>

</html>
 