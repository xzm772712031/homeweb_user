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
   <!-- 注意，验证码本身是不需要 jquery 库，此处使用 jquery 仅为了在 demo 使用，减少代码量 -->
   <script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.js"></script>
   <link rel="stylesheet" href="css/login.css" />
   <!-- 引入 gt.js，既可以使用其中提供的 initGeetest 初始化函数 -->
   <script src="gt.js"></script>
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

    </div>
    <!--===========layout-container================-->
    <div class="register-box">
      <form  class="am-form" data-am-validator action="register" method="post">
        <fieldset>
          <legend>用户登录<p class="register-info">输入账号密码完成登录</p></legend>       
<div class="am-input-group">
  <span class="am-input-group-label"><i class="am-icon-user am-icon-fw"></i></span>
  <input type="text" class="am-form-field" placeholder="Username" id="userAccount" required="required">
</div>

<div class="am-input-group">
  <span class="am-input-group-label"><i class="am-icon-lock am-icon-fw"></i></span>
  <input type="password" class="am-form-field" placeholder="Password" id="userPassword" required="required">
</div>
    <div>
        <label>完成验证：</label>
        <div id="captcha2">
            <p id="wait2" class="show">正在加载验证码......</p>
        </div>
    </div>
    <div>
    <p id="notice2" class="hide">请先完成验证</p>
    <input class="btn" id="submit2" type="submit" value="提交">
    <input class="btn" id="submit2" type="reset" value="重置"> 
    </div>
  <div class="am-form-group">
    <div class="am-u-sm-offset-2 am-u-sm-10">
      <div class="checkbox">
      <label>
        <a href="register.jsp">注册</a>
        </label>
        <label>
        <a href="SearchAccount.jsp">忘记密码</a>
        </label>
      </div>
    </div>
  </div>
        </fieldset>
      </form>
    </div>
  
  
  
  <script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
  <script src="assets/js/amazeui.js" charset="utf-8"></script>
</body>
<script>
    var handler2 = function (captchaObj) {
        $("#submit2").click(function (e) {
            var result = captchaObj.getValidate();
            var account = $('#userAccount').val();
            var pwd = $('#userPassword').val();
            if(account.length==0||pwd.length==0){
            alert("用户名或密码不能为空");
            return false;
            }
            if (!result) {
                $("#notice2").show();
                setTimeout(function () {
                    $("#notice2").hide();
                }, 2000);
            } else {
                $.ajax({
                    url: 'login',
                    type: 'POST',
                    dataType: 'json',
                    data: { userAccount: $('#userAccount').val(),
                        userPassword: $('#userPassword').val(),
                        geetest_challenge: result.geetest_challenge,
                        geetest_validate: result.geetest_validate,
                        geetest_seccode: result.geetest_seccode
                    },
                    success: function (data) {
                        if (data.status === 'success') {
                            alert('登录成功');
                            window.location.href = "index.jsp";
                        } else if (data.status === 'fail') {
                            alert('登录失败');
                            window.location.reload();
                        }
                    }
                })
            }
            e.preventDefault();
        });
        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha2");
        captchaObj.onReady(function () {
            $("#wait2").hide();
        });
        // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };
    
    
    
    $.ajax({
        url: "init?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            // 调用 initGeetest 初始化参数
            // 参数1：配置参数
            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
                offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                product: "popup", // 产品形式，包括：float，popup
                width: "100%"
                // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
            }, handler2);
        }
    });
</script>



</html>
