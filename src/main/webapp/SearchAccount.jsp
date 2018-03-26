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
    $("#btn").click(function(){
        var account = $("#doc-vld-name-2").val();
        var name = $("#doc-vld-pwd-1").val();
        var PersonId = $("#doc-vld-pwd-2").val();
            $.ajax({
                type:'post',
                url:'selectPassword',
                dataType:"json",
                data:{userAccount:account,userName:name,userPersonId:PersonId},
                success:function (data){
                   if(data!=null){
                    window.location.href="updatePassword.jsp";            
                  } 
                },
               error:function(data){
               alert("请核对信息后重试！");
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
                <a href="answer.jsp">搬家答疑</a>
              </li>
              <c:if test="${user==null}">
              <li><a href="showtype">在线预约</a></li>
              </c:if>
              <c:if test="${user!=null}">
              <li>
                 <a href="html/news.html">个人中心</a>
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
    <!--mobile header start-->
    <div class="m-header">
      <div class="am-g am-show-sm-only">
        <div class="am-u-sm-2">
          <div class="menu-bars">
            <a href="#doc-oc-demo1" data-am-offcanvas="{effect: 'push'}"><i class="am-menu-toggle-icon am-icon-bars"></i></a>
            <!-- 侧边栏内容 -->
            <nav data-am-widget="menu" class="am-menu  am-menu-offcanvas1" data-am-menu-offcanvas >
            <a href="javascript: void(0)" class="am-menu-toggle"></a>

            <div class="am-offcanvas" >
              <div class="am-offcanvas-bar">
              <ul class="am-menu-nav am-avg-sm-1">
                  <li><a href="./index.html" class="" >首页</a></li>
                  <li class="am-parent">
                    <a href="#" class="" >搬家服务</a>
                      <ul class="am-menu-sub am-collapse ">
                          <li class="">
                            <a href="html/product1.html" class="" >产品展示1</a>
                          </li>
                          <li class="">
                            <a href="html/product2.html" class="" >产品展示2</a>
                          </li>
                          <li class="">
                            <a href="html/product3.html" class="" >产品展示3</a>
                          </li>
                      </ul>
                  </li>
                  <li class=""><a href="html/example.html" class="" >客户案例</a></li>
                  <li class=""><a href="html/solution.html" class="" >解决方案</a></li>
                  <li class="am-parent">
                    <a href="html/news.html" class="" >新闻中心</a>
                      <ul class="am-menu-sub am-collapse  ">
                          <li class="">
                            <a href="html/news-content.html" class="" >公司动态</a>
                          </li>
                          <li class="">
                            <a href="html/404-dark.html" class="" >行业动态</a>
                          </li>
                          <li class="">
                            <a href="html/404-light.html" class="" >精彩专题</a>
                          </li>
                      </ul>
                  </li>
                  <li class=""><a href="html/about.html" class="" >关于我们</a></li>
                  <li class=""><a href="html/join.html" class="" >搬家答疑</a></li>
                  <li class=""><a href="showtype" class="" >在线下单</a></li>
                  <li class="am-parent">
                    <a href="" class="nav-icon nav-icon-globe" >Language</a>
                      <ul class="am-menu-sub am-collapse  ">
                          <li>
                            <a href="#" >English</a>
                          </li>
                          <li class="">
                            <a href="#" >Chinese</a>
                          </li>
                      </ul>
                  </li>
                  <li class="nav-share-contain">
                    <div class="nav-share-links">
                      <i class="am-icon-facebook"></i>
                      <i class="am-icon-twitter"></i>
                      <i class="am-icon-google-plus"></i>
                      <i class="am-icon-pinterest"></i>
                      <i class="am-icon-instagram"></i>
                      <i class="am-icon-linkedin"></i>
                      <i class="am-icon-youtube-play"></i>
                      <i class="am-icon-rss"></i>
                    </div>
                  </li>
                  <li class=""><a href="html/login.html" class="" >登录</a></li>
                  <li class=""><a href="html/register.html" class="" >注册</a></li>
              </ul>

              </div>
            </div>
          </nav>

          </div>
        </div>
        <div class="am-u-sm-5 am-u-end">
          <div class="m-logo">
            <a href=""><img src="assets/images/logo.png" alt=""></a>
          </div>
        </div>
      </div>
    <!--mobile header end-->
    </div>

    <!--===========layout-container================-->
    <div class="register-box">
      <form  class="am-form" data-am-validator action="" method="post">
        <fieldset>
          <legend>密码找回<p class="register-info">账号可以通过身份证，手机号，邮箱进行认证找回。</p></legend>
          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-name-2" class="register-name">账号</label>
              </div>  
              <div class="am-u-md-10">
                <input type="text" id="doc-vld-name-2" minlength="3" name="userAccount"
                       placeholder="账号" required/>
                       <span id="message"></span>
              </div>
            </div> 
          </div>
          
          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd" >姓名</label>
              </div>
              <div class="am-u-md-10">
                <input type="text" id="doc-vld-pwd-1" name="userPassword" placeholder="姓名" minlength="3" required/>
              </div>
            </div>
          </div>

          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-2">身份证</label>
              </div>
              <div class="am-u-md-10">
                <input type="text" id="doc-vld-pwd-2" placeholder="身份证"  minlength="3" required/>
              </div>
            </div>
          </div>
          <div class="am-g">
            <div class="am-u-md-10">
              <input class="am-btn am-btn-secondary" type="button" id="btn" value="账号找回">
            </div>
          </div>
        </fieldset>
      </form>
    </div>
  </div>
  <script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
  <script src="assets/js/amazeui.js" charset="utf-8"></script>
</body>

</html>
