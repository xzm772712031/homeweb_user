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
									<td>反馈编号</td>
									<td>${feedback.feedbackId }</td>
								</tr>
							</thead>
							<tbody>
			 				<tr>
									<td>反馈类型</td>
									<td>${feedback.feedbacktype.feedbackTypeName }</td>
								</tr>
								<tr>
									<td>反馈标题</td>
									<td>${feedback.feedbackTitle }</td>
								</tr>
								<tr>
									<td>反馈时间</td>
									<td>								
	                                  ${feedback.strDate }		
									</td>
								</tr>	
								<tr>
									<td>反馈内容</td>
									<td>${feedback.feedbackContent }</td>
								</tr>
								<tr>
									<td>图片附件</td>
									<td>
									<img  src="/pic/${feedback.feedbackImage }" width="300" height="200">
									</td>
								</tr>
								<tr>
									<td>反馈状态状态</td>
									<c:if test="${feedback.feedbackState==0 }">
									<td>未处理</td>
									</c:if>
									<c:if test="${feedback.feedbackState==1 }">
									<td>已处理</td>
									</c:if>
								</tr>
								<tr>
									<td>客服回复</td>
									<td>${feedback.feedback }</td>
								</tr>		
							</tbody>
						</table>
					</div>
				  </div>
	<script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
	<script src="assets/js/amazeui.js" charset="utf-8"></script>
</body>
</html>
 
 