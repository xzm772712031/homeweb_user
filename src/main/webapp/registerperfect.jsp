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
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>因为专注，所以专业</title>
   <link rel="stylesheet" href="assets/css/amazeui.css" />
  <link rel="stylesheet" href="assets/css/common.min.css" />
  <link rel="stylesheet" href="assets/css/other.min.css" />
  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
$(function(){
    $("#btn").click(function(){
      　var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
       var mobile=/^((13[0-9]{1})|159|153|182)+\d{8}$/;
       var person = /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i;
        var UserName = $("#UserName").val();
        var UserEmail = $("#UserEmail").val(); 
        var UserTel = $("#UserTel").val();
        var USerSex = $("#USerSex").val(); 
        var UserAddress = $("#UserAddress").val();
        var UserPersonId = $("#UserPersonId").val(); 
        var UserBirthday = $("#UserBirthday").val();
        if(UserName.length==0){
        alert("用户姓名不能为空！");
       return false;    
        }else if(!reg.test(UserEmail)){ 
         alert("邮箱格式不正确！");
           return false;    
        }
        if(!mobile.test(UserTel)){
        alert("手机号码格式不正确！"); 
         return false; 
        }else if(UserAddress.length==0||UserBirthday.length==0){       
         alert("关键系你先不能为空！");     
          return false; 
        }
        else if(!person.test(UserPersonId)){
         alert("请输入合法的身份证！");     
          return false; 
        }
        else{
            $.ajax({
                type:'post',
                url:'registerAdd',
                dataType:"json",
                data:{UserName:UserName,
                UserEmail:UserEmail,
                UserTel:UserTel,
                USerSex:USerSex,
                UserAddress:UserAddress,
                UserPersonId,UserPersonId,
                UserBirthday,UserBirthday},
                success:function (data){
                   if(data==true){
                   alert("资料补充成功,将跳转到登录页进行登录。");
                    window.location.href="login.jsp";             
                  }
                }
            })
            }
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
    <div class="register-box">
      <form action="registerAdd" class="am-form" data-am-validator method="post">
        <fieldset>
          <legend>注册用户-完善信息<p class="register-info">您需要完善您的个人信息才能使用。</p></legend>
          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-name-2" class="register-name">您的姓名</label>
              </div>
              <div class="am-u-md-10">
                <input type="text" id="UserName" minlength="2" name="UserName"
                       placeholder="输入您的姓名" required/>
              </div>
            </div>
          </div>

          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd">您的邮箱</label>
              </div>
              <div class="am-u-md-10">
                <input type="text" id="UserEmail" placeholder="请输入您的邮箱"  name="UserEmail" minlength="3" required/>
              </div>
            </div>
          </div>

          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd">您的电话</label>
              </div>
              <div class="am-u-md-10">
                <input type="text" id="UserTel" placeholder="请输入您的电话"  required minlength="3" name="UserTel" />
              </div>
            </div>
          </div>
          
          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd">您的性别</label>
              </div>
              <div class="am-u-md-10">
                <select   name="USerSex" id="USerSex">
        <option value="男" >男</option>
        <option value="女">女</option>
        </select>
              </div>
            </div>
          </div>
          
          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd">您的地址</label>
              </div>
              <div class="am-u-md-10">
                <input type="text" id="UserAddress" placeholder="请输入您的地址" required minlength="2" name="UserAddress"/>
              </div>
            </div>
          </div>
          
           <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd">身份证</label>
              </div>
              <div class="am-u-md-10">
                <input type="text" id="UserPersonId" placeholder="请输入您的身份证"  required minlength="3" name="UserPersonId"/>
              </div>
            </div>
          </div>
          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd">您的生日</label>
              </div>
              <div class="am-u-md-10">
              <div class="am-input-group am-datepicker-date" data-am-datepicker="{format: 'yyyy-mm-dd', viewMode: 'years'}">
              <input type="text" class="am-form-field" placeholder="日历组件" readonly name="UserBirthday" id="UserBirthday">
               <span class="am-input-group-btn am-datepicker-add-on">
               <button class="am-btn am-btn-default" type="button"><span class="am-icon-calendar"></span> </button>
               </span>
               </div>
              </div>
            </div>
          </div>
          
          <div class="am-g">
            <div class="am-u-md-10">
              <input type="button" class="am-btn am-btn-secondary" type="submit" value="信息完善" id="btn">
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
