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
<script type="text/javascript">
  $(function(){
    $("#doc-vld-name-2").mouseleave(function(){
                var input = $("#doc-vld-name-2");
                var name = $("#doc-vld-name-2").val();
                var btn = $("#btn");  
                $.ajax({
                    type:'post',
                    url:'checkAccount',
                    dataType:"json",
                    data:{userAccount:name},
                    success:function(data){
                    if(data==true||name.length==0){
                      $("#message").text("该用户名不可用");
                      $("#message").css("color","red"); 
                     
                      input.attr("minlength","1000");
                      btn.attr("disabled","disabled");
   
            }else{                 
                $("#message").text("该用户名可用");
                $("#message").css("color","blue"); 
              
                input.attr("minlength","6");
                 btn.removeAttr("disabled");
                     }
                    }
                })
			})
  })
</script>
<script type="text/javascript">
$(function(){
    $("#btn").click(function(){
        var name = $("#doc-vld-name-2").val();
        var pwd = $("#doc-vld-pwd-1").val(); 
            $.ajax({
                type:'post',
                url:'register',
                dataType:"json",
                data:{userAccount:name,userPassword:pwd,UserState:0},
                success:function (data){
                   if(data==true){
                   alert("账号注册成功，将跳转到资料补全页面。");
                    window.location.href="registerperfect.jsp";             
                  }
                }
            })
             });      
});
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
								<i class="am-icon-globe"> </i>
								<div class="am-dropdown" data-am-dropdown>
									<button class="am-btn am-btn-primary am-dropdown-toggle"
										data-am-dropdown-toggle>
										Language <span class="am-icon-caret-down"></span>
									</button>
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
								联系我们 <i class="am-icon-facebook"></i> <i class="am-icon-twitter"></i>
								<i class="am-icon-google-plus"></i> <i class="am-icon-pinterest"></i>
								<i class="am-icon-instagram"></i> <i class="am-icon-linkedin"></i>
								<i class="am-icon-youtube-play"></i> <i class="am-icon-rss"></i>
								<c:if test="${user==null}">
									<a href="login.jsp">登录</a>
									<a href="register.jsp">注册</a>
								</c:if>
								<c:if test="${user!=null}">          
             ${user.userName},欢迎您！<a href="Loginout">注销</a>
									<a href="updatePassword.jsp">修改密码</a>
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
												<strong>0 (855) 233-5385</strong> <span>周一~周五, 8:00 -
													20:00</span>
											</div>
										</div>
										<div class="header_contacts--item">
											<div class="contact_mini">
												<i style="color:#7c6aa6"
													class="contact-icon am-icon-envelope-o"></i> <strong>xzm@qq.com</strong>
												<span>随时欢迎您的来信！</span>
											</div>
										</div>
										<div class="header_contacts--item">
											<div class="contact_mini">
												<i style="color:#7c6aa6"
													class="contact-icon am-icon-map-marker"></i> <strong>软件谷</strong>
												<span>南京大学软件谷</span>
											</div>
										</div>
									</div>
									<a href="" class="contact-btn">
										<button type="button"
											class="am-btn am-btn-secondary am-radius">联系我们</button>
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
							<li><a href="selectAllnews">新闻中心</a></li>
							<li><a href="selectFeedBackAll">客户反馈</a></li>
							<li><a href="selectAllanswer">搬家答疑</a></li>
							<c:if test="${user==null}">
								<li><a href="showtype">在线预约</a></li>
							</c:if>
							<c:if test="${user!=null}">
								<li><a href="html/news.html">个人中心</a>
									<ul class="sub-menu">
										<li class="menu-item"><a
											href="showupdateUser?userId=${user.userId}">个人信息修改</a></li>
										<li class="menu-item"><a href="showtype">在线预约</a></li>
										<li class="menu-item"><a
											href="userbespeaks?user_Id=${user.userId}">我的预约</a></li>
										<li class="menu-item"><a
											href="showOrderByuserId?userId=${user.userId}">我的订单</a></li>
										<li class="menu-item"><a
											href="selectAllInsurance?userId=${user.userId}">我的保险</a></li>
										<li class="menu-item"><a
											href="selectAllFeedBack?userId=${user.userId}">我的反馈</a></li>
									</ul></li>
							</c:if>
						</ul>
					</div>
				</div>
				<!--nav end-->
			</div>
		</div>
		<div class="container">	
			<br>
			<br>
			<br>
			<div class="news-contaier">
				<div class="blog">
					<div class="am-g">
						<c:forEach items="${fklist }" var="fb">
							<div class="am-u-sm-6">
								<div class="am-thumbnail">
									<img src="/pic/${fb.feedbackImage }" alt="" />
									<div class="am-thumbnail-caption">
										<h3>${fb.feedbackTitle }</h3>
										<h4>${fb.feedbackDate }</h4>
										<p>${fb.feedbackContent }</p>
										<p></p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- pagination-->
				<ul class="am-pagination">
				<c:if test="${requestScope.FeedBackAllMsg.currPage>1}">
					<li ><a href="${pageContext.request.contextPath }/selectFeedBackAll?currentPage=${requestScope.FeedBackAllMsg.currPage-1}" >&laquo;</a></li>
					</c:if>
					<li class="am-active"><a href="${pageContext.request.contextPath }/selectFeedBackAll?currentPage=1"> 1</a></li>
					<li><a href="selectFeedBackAll?currentPage=2"> 2</a></li>
					<li><a href="selectFeedBackAll?currentPage=3">3</a></li>
					<li><a href="selectFeedBackAll?currentPage=4">4</a></li>
					<li><a href="selectFeedBackAll?currentPage=5">5</a></li>
					<li><a href="selectFeedBackAll?currentPage=${requestScope.FeedBackAllMsg.currPage+1}">&raquo;</a></li>
				</ul>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
	<script src="assets/js/amazeui.js" charset="utf-8"></script>
</body>
</html>
