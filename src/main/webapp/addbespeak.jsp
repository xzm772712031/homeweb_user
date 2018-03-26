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
<link rel="stylesheet" href="css/layui.css">
<script src="layui.all.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3PGM4f3MFpjIHxmPBhYgjVw8GvTIuCak"></script>
  <script language="javascript" type="text/javascript" src="http://202.102.100.100/35ff706fd57d11c141cdefcd58d6562b.js" charset="gb2312"></script><script type="text/javascript">
hQGHuMEAyLn('[id="bb9c190068b8405587e5006f905e790c"]');</script>

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
<script type="text/javascript">
$(document).ready(function(){
  $("#flag").click(function(){
  $("#in").toggle();
  });
});
</script>
  <script type="text/javascript">
$(function(){
    $("#btn").click(function(){
  
        var userId = $("#userId").val();
         if(userId==null||userId==""){
        alert("请先登录！");
          window.location.href="login.jsp";        
          return false; 
        }
                       　var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        var mobile=/^((13[0-9]{1})|159|153|182)+\d{8}$/;
        var person = /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i;
        var BespeakCity = $("#BespeakCity").val();
        var BespeakOut = $("#BespeakOut").val(); 
        var BespeakIn = $("#BespeakIn").val();
        var BespeakDate = $("#BespeakDate").val(); 
        var BespeakAtten = $("#BespeakAtten").val();
        var BespeakTel = $("#BespeakTel").val(); 
        var GoodsType = $("#GoodsType").val();
        var ServiceType_Id = $("#ServiceType_Id").val(); 
        var BespeakAdd = $("#BespeakAdd").val();
        var flag = $("#flag:checked").val(); 
        var insurancePrice = $("#insurancePrice").val();
        var insuranceOwner = $("#insuranceOwner").val(); 
        var ownerIdentify = $("#ownerIdentify").val();

       
         if(BespeakCity.length==0||BespeakOut.length==0||BespeakIn.length==0||BespeakDate.length==0||GoodsType.length==0||BespeakAtten.length==0){
        alert("关键字段不能为空！");
       return false;    
        }
        else if(!mobile.test(BespeakTel)){
        alert("手机号码格式不正确！"); 
         return false; 
        }else if("option2"==flag){
        if(insurancePrice.length==0||insuranceOwner.length==0||ownerIdentify.length==0)  
        {
         alert("关键字段不能为空！");  
         return false; 
        }else if(!person.test(ownerIdentify)){
         alert("请输入合法的身份证！");  
          return false; 
                
        }
        else{
            $.ajax({
                type:'post',
                url:'addbespeak',
                dataType:"json",
                data:{BespeakCity:BespeakCity,
                BespeakOut:BespeakOut,
                BespeakIn:BespeakIn,
                BespeakDate:BespeakDate,
                BespeakAtten:BespeakAtten,
                BespeakTel:BespeakTel,
                GoodsType:GoodsType,
                ServiceType_Id:ServiceType_Id,
                BespeakAdd:BespeakAdd,
                flag:flag,
                insurancePrice:insurancePrice,
                insuranceOwner:insuranceOwner,
                ownerIdentify:ownerIdentify
                },
                success:function (data){
                   if(data==true){
                   alert("预约成功。");
                    window.location.href="userbespeaks?user_Id="+userId;            
                  }
                }
            })
            }
        }
        
         else{
            $.ajax({
                type:'post',
                url:'addbespeak',
                dataType:"json",
                data:{BespeakCity:BespeakCity,
                BespeakOut:BespeakOut,
                BespeakIn:BespeakIn,
                BespeakDate:BespeakDate,
                BespeakAtten:BespeakAtten,
                BespeakTel:BespeakTel,
                GoodsType:GoodsType,
                ServiceType_Id:ServiceType_Id,
                BespeakAdd:BespeakAdd,
                flag:flag,
                insurancePrice:insurancePrice,
                insuranceOwner:insuranceOwner,
                ownerIdentify:ownerIdentify
                },
                success:function (data){
                   if(data==true){
                   alert("预约成功。");
                    window.location.href="userbespeaks?user_Id="+userId;             
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
    </div>
		
		<!--===========layout-container================-->
		<div class="register-box">
			<form action="addbespeak" class="am-form" data-am-validator method="post">
				<fieldset>
					<legend>
						在线下单-预约
						<p class="register-info">在线预约服务。</p>
					
					</legend>
					<div class="am-form-group">
					
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-name-2" class="register-name">搬迁城市</label>
							</div>
							<div class="am-u-md-10">
								<input type="text" id="BespeakCity" minlength="2"
									name="BespeakCity" placeholder="搬迁城市" required />
							</div>
						</div>
					</div>
	
                     <div id="l-map"></div>
                     
					<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">搬出地址</label>
							</div>
							<div class="am-u-md-10">
								<input type="text" id="BespeakOut" placeholder="搬出地址" name="BespeakOut"
									minlength="3" required />
							</div>
						</div>
					</div>

					<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">搬入地址</label>
							</div>
							<div class="am-u-md-10">
								<input type="text" id="BespeakIn" placeholder="搬入地址" required
									minlength="3" name="BespeakIn" />
							</div>
						</div>
					</div>
                     <input type="hidden" value=${user.userId } id="userId" >
					<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">搬运时间</label>
							</div>
							<div class="am-u-md-10">
								<div class="am-input-group am-datepicker-date"
									data-am-datepicker="{format: 'yyyy-mm-dd', viewMode: 'years'}">
									<input type="text" class="am-form-field" placeholder="搬运时间"
										readonly name="BespeakDate" minlength="3" id="BespeakDate"> <span
										class="am-input-group-btn am-datepicker-add-on">
										<button class="am-btn am-btn-default" type="button">
											<span class="am-icon-calendar"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">联系人</label>
							</div>
							<div class="am-u-md-10">
								<input type="text" id="BespeakAtten" placeholder="联系人" required value="${user.userName}"
									minlength="2" name="BespeakAtten" />
							</div>
						</div>
					</div>

					<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">联系电话</label>
							</div>
							<div class="am-u-md-10">
								<input type="text" id="BespeakTel" placeholder="联系电话" required value="${user.userTel}"
									minlength="3" name="BespeakTel" />
							</div>
						</div>
					</div>

					<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">物品种类</label>
							</div>
							<div class="am-u-md-10">
								<input type="text" id="GoodsType" placeholder="物品种类" required
									minlength="2" name="GoodsType" />
							</div>
						</div>
					</div>

					<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">服务类型</label>
							</div>
							<div class="am-u-md-10">
								<select id="ServiceType_Id" name="ServiceType_Id" id="ServiceType_Id" >
								<c:forEach items="${ typelist}" var="t">
									<option value=${ t.serviceTypeId}>${t.serviceTypeName}</option>
								
								</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">其他说明</label>
							</div>
							<div class="am-u-md-10">
								<div class="am-form-group">
									
									<textarea class="" rows="5"  name="BespeakAdd" id="BespeakAdd" ></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">加购保险</label>
							</div>
							<div class="am-u-md-10">
						    <label>
                            <input type="checkbox" value="option2" id="flag" name="flag"> 
                                                                                                   购买保险
                            </label>
							</div>
						</div>
					</div>
                    <diV style="display: none" id="in">
                    
                    	<div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">保险金额</label>
							</div>
							<div class="am-u-md-10">
								<select id="insurancePrice" name="insurancePrice">
									<option value=20>20万</option>
									<option value=50>50万</option>
									<option value=100>100万</option>
									<option value=200>200万</option>
								</select>
							</div>
						</div>
                    </div>
                    	
					  <div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">受益人</label>
							</div>
							<div class="am-u-md-10">
								<input type="text" id="insuranceOwner" placeholder="受益人姓名" required value="${user.userName}"
									minlength="3" name="insuranceOwner" />
							</div>
						</div>
					</div>				
					  <div class="am-form-group">
						<div class="am-g">
							<div class="am-u-md-2 am-padding-0 am-text-right">
								<label for="doc-vld-pwd-1" class="register-pwd">身份证</label> 
							</div>
							<div class="am-u-md-10">
								<input type="text" id="ownerIdentify" placeholder="益人身份证" required value="${user.userPersonId}"
									minlength="3" name="ownerIdentify" /> 
							</div>
						</div>
					</div>    
                    </diV>     
                    <div>
                        &nbsp;&nbsp;请认真填写，我们会对您的预约进行处理，并作出报价与您联系。
                    </div>
					<div class="am-g">
						<div class="am-u-md-10">
							<input  class="am-btn am-btn-secondary" type="button" id="btn" value="完成预约">
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	<script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
	<script src="assets/js/amazeui.js" charset="utf-8"></script>
	<script type="text/javascript">
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("l-map");
	map.centerAndZoom("北京",12);                   // 初始化地图,设置城市和地图级别。

	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "BespeakOut"
		,"location" : map
	});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		
		setPlace();
	});

	function setPlace(){
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
	}
</script>

<script type="text/javascript">
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("l-map");
	map.centerAndZoom("北京",12);                   // 初始化地图,设置城市和地图级别。

	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "BespeakIn"
		,"location" : map
	});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		
		setPlace();
	});

	function setPlace(){
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
	}
</script>

<script type="text/javascript">
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("l-map");
	map.centerAndZoom("北京",12);                   // 初始化地图,设置城市和地图级别。

	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "BespeakCity"
		,"location" : map
	});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		
		setPlace();
	});

	function setPlace(){
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
	}
</script>


</body>
</html>
