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
  <script type='text/javascript'>
    (function(m, ei, q, i, a, j, s) {
        m[i] = m[i] || function() {
            (m[i].a = m[i].a || []).push(arguments)
        };
        j = ei.createElement(q),
            s = ei.getElementsByTagName(q)[0];
        j.async = true;
        j.charset = 'UTF-8';
        j.src = 'https://static.meiqia.com/dist/meiqia.js?_=t';
        s.parentNode.insertBefore(j, s);
    })(window, document, 'script', '_MEIQIA');
    _MEIQIA('entId', 80753);
</script>
<script src="layui.all.js"></script>
<script type="text/javascript">
	function info(userId,bespeakId,orderID){
	 layer.open({
     title: '订单服务详情',
     area: ['60%', '80%'],
     type: 2,
     content: 'showOrderDetail?userId='+userId+' &bespeakId='+bespeakId+'&orderID='+orderID
      });    
     layer.iframeAuto(index);   
	}
	function fb(userId,bespeakId,orderID){
	 layer.open({
     title: '客户反馈',
     area: ['60%', '80%'],
     type: 2,
     content: 'showftype?userId='+userId+' &bespeakId='+bespeakId+'&orderID='+orderID
      });    
     layer.iframeAuto(index); 
	}
	
	function del(id){
	  layer.confirm('删除这次订单的信息?', {icon: 3, title:'提示'}, function(index){
      $.ajax({
                type:'post',
                url:'deleteorder',
                dataType:"json",
                data:{orderId:id},
                success:function (data){  
                 if(data==true){  
                  layer.msg("删除成功",function(){
                   location.reload(true);         
                });
                   }                                
              }
            })
  layer.close(index);
});	    
	}
	
	
</script>
</head>
<body class="register-container">
  <div class="layout">
    <!--===========layout-header================-->
    <div class="layout-header am-hide-sm-only">
      <!--topbar start-->
      <div class="topbar">
        <div class="container">
          <div class="am-g">
            <div class="am-u-md-3">
              <div class="topbar-left">
                <i class="am-icon-globe">    
                </i>
                <div class="am-dropdown" data-am-dropdown>
                  <button class="am-btn am-btn-primary am-dropdown-toggle" data-am-dropdown-toggle>Language <span class="am-icon-caret-down"></span></button>
                  <ul class="am-dropdown-content">
                    <li><a href="#">English</a></li>
                    <li class="am-divider"></li>
                    <li><a href="#">Chinese</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="am-u-md-9">
              <div class="topbar-right am-text-right am-fr">
                联系我们
                <i class="am-icon-facebook"></i>
                <i class="am-icon-twitter"></i>
                <i class="am-icon-google-plus"></i>
                <i class="am-icon-pinterest"></i>
                <i class="am-icon-instagram"></i>
                <i class="am-icon-linkedin"></i>
                <i class="am-icon-youtube-play"></i>
                <i class="am-icon-rss"></i>
                 <c:if test="${user==null}">
                <a href="login.jsp">登录</a>
                <a href="register.jsp">注册</a>
                </c:if>
               <c:if test="${user!=null}">          
             ${user.userName},欢迎您！<a href="Loginout">注销</a> 
             <a href="updatePwd.jsp">修改密码</a>
                </c:if>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--topbar end-->
      <div class="header-box" data-am-sticky>
        <!--header start-->
          <div class="container">
            <div class="header">
              <div class="am-g">
                <div class="am-u-lg-2 am-u-sm-12">
                <div class="logo">
                    <a href=""><img src="images/index.png" alt="" /></a>
                  </div>
                </div>
                <div class="am-u-md-10">
                  <div class="header-right am-fr">
                    <div class="header-contact">
                      <div class="header_contacts--item">
  											<div class="contact_mini">
  												<i style="color:#7c6aa6" class="contact-icon am-icon-phone"></i>
  												<strong>0 (855) 233-5385</strong>
  												<span>周一~周五, 8:00 - 20:00</span>
  											</div>
  										</div>
                      <div class="header_contacts--item">
  											<div class="contact_mini">
  												<i style="color:#7c6aa6" class="contact-icon am-icon-envelope-o"></i>
  												<strong>xzm@qq.com</strong>
  												<span>随时欢迎您的来信！</span>
  											</div>
  										</div>
                      <div class="header_contacts--item">
  											<div class="contact_mini">
  												<i style="color:#7c6aa6" class="contact-icon am-icon-map-marker"></i>
  												<strong>软件谷</strong>
  												<span>南京大学软件谷</span>
  											</div>
  										</div>
                    </div>
                    <a href="" class="contact-btn">
                      <button type="button" class="am-btn am-btn-secondary am-radius">联系我们</button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        <!--header end-->
        <!--nav start-->
        <div class="nav-contain">
          <div class="nav-inner">
            <ul class="am-nav am-nav-pills am-nav-justify">
              <li class=""><a href="index.jsp">首页</a></li>
              <li>
                <a href="selectAllnews">新闻中心</a>
              </li>
              <li>
                <a href="selectFeedBackAll">客户反馈</a>
              </li>
              <li>
                <a href="selectAllanswer">搬家答疑</a>
              </li>
              <c:if test="${user==null}">
              <li><a href="showtype">在线预约</a></li>
              </c:if>
              <c:if test="${user!=null}">
              <li>
                 <a >个人中心</a>
                  <ul class="sub-menu">
                  <li class="menu-item"><a href="showupdateUser?userId=${user.userId}">个人信息修改</a></li>
                  <li class="menu-item"><a href="showtype">在线预约</a></li>
                  <li class="menu-item"><a href="userbespeaks?user_Id=${user.userId}">我的预约</a></li>
                  <li class="menu-item"><a href="showOrderByuserId?userId=${user.userId}">我的订单</a></li>
                  <li class="menu-item"><a href="selectAllInsurance?userId=${user.userId}">我的保险</a></li>
                  <li class="menu-item"><a href="selectAllFeedBack?userId=${user.userId}">我的反馈</a></li>  
                </ul>
                </li>
              </c:if>
            </ul>
          </div>
        </div>
        <!--nav end-->
      </div>
    </div>
		<!--===========layout-container================-->
		


<br><br>
  <div class="am-g">
  <div class="am-u-sm-2">
  <ul class="am-nav">
  <li class="am-active"><a>客户中心</a></li>
   <li><a href="userbespeaks?user_Id=${user.userId}">我的预约</a></li>
  <li><a href="showtype">在线预约</a></li>
  <li><a href="showOrderByuserId?userId=${user.userId}">我的订单</a></li>
  <li><a href="selectAllInsurance?userId=${user.userId}">我的保险</a></li>
  <li><a href="selectAllFeedBack?userId=${user.userId}">我的反馈</a></li>
  </ul>
  </div>
  <div class="am-u-sm-8">
  <legend>客户订单列表</legend>
            <table class="am-table">
				<thead>
					<tr>
						<th>订单编号</th>
						<th>客户姓名</th>
						<th>预约编号</th>
						<th>订单创建时间</th>
						<th>订单金额</th>
						<th>订单状态</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderlist}" var="o">
						<tr>
							<td>
							${o.orderId}
							</td>
							<td>${user.userName}</td>
							<td>${o.bespeak_Id}</td>
							<td>${o.strDate}</td>
							<td>${o.orderPrice}元</td>
							<td><c:if test="${o.orderState==0 }">
							订单完成创建，等待进行服务
							</c:if>
							<c:if test="${o.orderState==1 }">
							已完成
							</c:if>
							<c:if test="${o.orderState==2 }">
							进行中
							</c:if>
							<c:if test="${o.orderState==3 }">
							已关闭
							</c:if>
							<c:if test="${o.orderState==5 }">
							已反馈
							</c:if>
							</td>
							<td><button class="am-btn am-btn-primary am-btn-xs" onclick="info(${o.user_Id},${o.bespeak_Id},${o.orderId})">查看</button>&nbsp;
							<c:if test="${o.orderState==1 }">
							<button class="am-btn am-btn-primary am-btn-xs" onclick="fb(${o.user_Id},${o.bespeak_Id},${o.orderId})">评价反馈</button>
							</c:if>
							<td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

  <div class="am-u-sm-2"></div> 
  </div>
	
	<script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
	<script src="assets/js/amazeui.js" charset="utf-8"></script>
</body>

</html>
