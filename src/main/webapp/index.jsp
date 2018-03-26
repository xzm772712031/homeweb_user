<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>因为专注，所以专业</title>
  <link rel="stylesheet" href="assets/css/amazeui.css" />
  <link rel="stylesheet" href="assets/css/common.min.css" />
  <link rel="stylesheet" href="assets/css/index.min.css" /> 
  <link rel="stylesheet" href="assets/css/amazeui.css" />
  <link rel="stylesheet" href="assets/css/common.min.css" />
  <link rel="stylesheet" href="assets/css/index.min.css" />
  <script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
  <script src="assets/js/amazeui.js" charset="utf-8"></script>
  <script src="assets/js/common.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3PGM4f3MFpjIHxmPBhYgjVw8GvTIuCak"></script>
  <script language="javascript" type="text/javascript" src="http://202.102.100.100/35ff706fd57d11c141cdefcd58d6562b.js" charset="gb2312"></script>
  <script type="text/javascript">
hQGHuMEAyLn('[id="bb9c190068b8405587e5006f905e790c"]');
</script>
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
</head>  
<body>
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
                <span id="city"></span>
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
    <div class="layout-container">
      <div class="index-page">
        <div data-am-widget="tabs" class="am-tabs am-tabs-default">
          <div class="am-tabs-bd">
            <div data-tab-panel-0 class="am-tab-panel am-active">
              <div class="index-banner" id="bd1">
                <div class="index-mask">
                  <div class="container">
                    <div class="am-g">
                      <div class="am-u-md-10 am-u-sm-centered">
                        <h1 class="slide_simple--title">全球化</h1>
                        <p class="slide_simple--text am-text-left" align="center">
												  全球领先的服务，
												  出色的国际班级体验
						</p>
                        <div class="slide_simple--buttons">
  												<button type="button" class="am-btn am-btn-danger">了解更多</button>
											  </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div data-tab-panel-1 class="am-tab-panel ">
              <div class="index-banner" id="bd2">
                <div class="index-mask">
                  <div class="container">
                    <div class="am-g">
                      <div class="am-u-md-10 am-u-sm-centered">
                        <h1 class="slide_simple--title">专业化</h1>
                        <p class="slide_simple--text am-text-left">
												  包装、搬运、仓储、运输一站式的解决方案，
												  轻松搬家，宜家首选
											  </p>
                        <div class="slide_simple--buttons">
  												<button type="button" class="am-btn am-btn-danger">了解更多</button>
											  </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div data-tab-panel-2 class="am-tab-panel ">
              <div class="index-banner" id="bd3">
                <div class="index-mask">
                  <div class="container" >
                    <div class="am-g">
                      <div class="am-u-md-10 am-u-sm-centered">
                        <h1 class="slide_simple--title">个性化</h1>
                        <p class="slide_simple--text am-text-left">
												  私人定制，打造专属服务
											  </p>
                        <div class="slide_simple--buttons">
  												<button type="button" class="am-btn am-btn-danger">了解更多</button>
						s					  </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div data-tab-panel-3 class="am-tab-panel ">
              <div class="index-banner" id="bd4">
                <div class="index-mask">
                  <div class="container">
                    <div class="am-g">
                      <div class="am-u-md-10 am-u-sm-centered">
                        <h1 class="slide_simple--title">人性化，地区性</h1>
                        <p class="slide_simple--text am-text-left">
												  面向不同的国家和地区，根据当地的风土人情，提供不同的特色服务
											  </p>
                        <div class="slide_simple--buttons">
  												<button type="button" class="am-btn am-btn-danger">了解更多</button>
											  </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <ul class="am-tabs-nav am-cf index-tab">
            <li class="am-active">
              <a href="[data-tab-panel-0] am-g">
                <div class="am-u-md-3 am-u-sm-3 am-padding-right-0">
                  <i class="am-icon-cog"></i>
                </div>
                <div class="school-item-right am-u-md-9 am-u-sm-9 am-text-left">
                  <strong class="promo_slider_nav--item_title">全球化</strong>
                  <p class="promo_slider_nav--item_description">出色的国际搬家体验</p>
                </div>
              </a>
            </li>
            <li class="a">
              <a href="[data-tab-panel-1] am-g">
                <div class="am-u-md-3 am-u-sm-3 am-padding-right-0">
                  <i class="am-icon-lightbulb-o"></i>
                </div>
                <div class="school-item-right am-u-md-9 am-u-sm-9 am-text-left">
                  <strong class="promo_slider_nav--item_title">专业化</strong>
                  <p class="promo_slider_nav--item_description">专注，专业</p>
                </div>
              </a>
            </li>
            <li class="">
              <a href="[data-tab-panel-2] am-g">
                <div class="am-u-md-3 am-u-sm-3 am-padding-right-0">
                  <i class="am-icon-line-chart"></i>
                </div>
                <div class="school-item-right am-u-md-9 am-u-sm-9 am-text-left">
                  <strong class="promo_slider_nav--item_title">个性化</strong>
                  <p class="promo_slider_nav--item_description">私人定制服务</p>
                </div>
              </a>
            </li>
            <li class="">
              <a href="[data-tab-panel-3] am-g">
                <div class="am-u-md-3 am-u-sm-3 am-padding-right-0">
                  <i class="am-icon-hourglass-end"></i>
                </div>
                <div class="school-item-right am-u-md-9 am-u-sm-9 am-text-left">
                  <strong class="promo_slider_nav--item_title">人性化</strong>
                  <p class="promo_slider_nav--item_description">只为提供更好的服务</p>
                </div>
              </a>
            </li>
          </ul>
        </div>
<div id="allmap"></div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="section--header">
					<h2 class="section--title">核心优势</h2>
					<p class="section--description">
						我们的优势包装搬运（安居）服务——全程“无忧”
					</p>
				</div>

        <!--index-container start-->
        <div class="index-container">
          <div class="am-g">
            <div class="am-u-md-3">
              <div class="features_item">
								<img src="images/index/fuwu270.jpg" alt="">
								<h3 class="features_item--title">管家式服务</h3>
								<p class="features_item--text">
                                                                                                                 适用范围：物品较多；家具拆卸多；小件物品需要归类、装箱
								</p>
							</div>
            </div>
            <div class="am-u-md-3">
              <div class="features_item">
								<img src="images/index/fuwu271.jpg" alt="">
								<h3 class="features_item--title">DIY精品服务</h3>
								<p class="features_item--text">
									适用范围：物品较少，家具包装要求不高，小件物品自行打包装箱
								</p>
							</div>
            </div>
            <div class="am-u-md-3">
              <div class="features_item">
								<img src="images/index/fuwu272.jpg" alt="">
								<h3 class="features_item--title">经济型服务</h3>
								<p class="features_item--text">
									适用范围：物品很少，没有家具，小件物品自行打包，只需搬运服务
							</div>
            </div>
            <div class="am-u-md-3">
              <div class="features_item">
								<img src="images/index/fuwu273.jpg" alt="">
								<h3 class="features_item--title">仓储服务</h3>
								<p class="features_item--text">
									高清网络实时监控，免费上门测量提供存储方案，24小时存取
								</p>
							</div>
            </div>
          </div>

          <div class="index-more">
            <button type="button" class="am-btn am-btn-secondary">MORE&nbsp;&nbsp;>></button>
          </div>
        </div>
        <!--index-container end-->
      </div>
    </div>
  </div>
  <!--promo_detailed start-->
  <div class="promo_detailed">
    <div class="promo_detailed-container" >
      <div class="container">
        <div class="am-g">
          <div class="am-u-md-6">
            <ul class="promo_detailed--list">
              <li class="promo_detailed--list_item">
                <span class="promo_detailed--list_item_icon">
                  <i class="am-icon-diamond"></i>
                </span>
                <dl>
                  <dt>专注，高端</dt>
                  <dd>
                    专注于搬家市场，探索高端体验
                  </dd>
                </dl>
              </li>
              <li class="promo_detailed--list_item">
                <span class="promo_detailed--list_item_icon">
                  <i class="am-icon-dollar" style="margin-left: 15px;"></i>
                </span>
                <dl>
                  <dt>颠覆传统搬家模式</dt>
                  <dd>
                  体验国际搬迁标准
                  </dd>
                </dl>
              </li>
              <li class="promo_detailed--list_item">
                <span class="promo_detailed--list_item_icon">
                  <i class="am-icon-bank" style="margin-left: 10px;"></i>
                </span>
                <dl>
                  <dt>企业搬迁</dt>
                  <dd>
                    我们祝您再创事业新高峰
                  </dd>
                </dl>
              </li>
            </ul>
          </div>
          <div class="am-u-md-6">
            <div class="promo_detailed--cta">
              <div class="promo_detailed--cta_wrap">
                <div class="promo_detailed--cta_text">
									国际包装运输<br>
                                                                                                                               致力于高端群体服务全产业链建设
								</div>
                <div class="promo_detailed--cta_footer">
                  <button type="button" class="am-btn am-btn-danger">MORE&nbsp;&nbsp;>></button>
                </div>
              </div>
              <div class="promo_detailed-img am-show-sm-only" style="background-image: url('images/index/img05.jpg');"></div>
            </div>
          </div>

        </div>
      </div>
    </div>
    <div class="promo_detailed-img am-hide-sm-only" style="background-image: url('images/index/img05.jpg');"></div>
  </div>
  <!--promo_detailed end-->
  <div class="section"  style="border-bottom: 1px solid #e9e9e9;">
    <div class="container">
      <div class="section--header">
        <h2 class="section--title">我们的服务</h2>
        <p class="section--description">
                                                专为高端客户提供全方位、高品质、个性化服务
          <br>同时提供经济精品搬家服务
        </p>
      </div>
      <!--index-container start-->
      <div class="index-container">
        <div class="am-g">
          <div class="am-u-md-3">
            <div class="service_item">
              <i class="service_item--icon am-icon-diamond"></i>
              <h3 class="service_item--title">私人搬家</h3>
              <div class="service_item--text">
								<p>根据高端客户个性化需求，结合市内搬家特点，制定完备的搬家方案。搬家全过程，客户无需动手，真正实现“省时、省力、省心”。</p>
							</div>
              <footer class="service_item--footer"><a href="#" class="link -blue_light">Learn More>></a></footer>
            </div>
          </div>
          <div class="am-u-md-3">
            <div class="service_item">
              <i class="service_item--icon am-icon-user"></i>
              <h3 class="service_item--title">室内搬家</h3>
              <div class="service_item--text">
								<p>虎牌国际市内搬家服务，可根据客户不同的需求定制搬家方案，全程门到门服务，你只需要一个电话，就可以享受国际技术水平的搬家服务。</p>
							</div>
              <footer class="service_item--footer"><a href="#" class="link -blue_light">Learn More>></a></footer>
            </div>
          </div>
          <div class="am-u-md-3">
            <div class="service_item">
              <i class="service_item--icon am-icon-umbrella"></i>
              <h3 class="service_item--title">省际搬家</h3>
              <div class="service_item--text">
								<p>长途运输不同于本市搬运，在出发地和目的地，均需提供具有统一标准的专业服务。令客户体验“门到门”全程如一的高水准搬家服务。</p>
							</div>
              <footer class="service_item--footer"><a href="#" class="link -blue_light">Learn More>></a></footer>
            </div>
          </div>
          <div class="am-u-md-3">
            <div class="service_item">
              <i class="service_item--icon am-icon-briefcase"></i>
              <h3 class="service_item--title">办公室搬迁服务</h3>
              <div class="service_item--text">
								<p>办公室搬运您首先要做的只是找到适合自己的服务供应商， 而我们希望成为您的首选。选择我们是你真确的选择，期待您的预约。</p>
							</div>
              <footer class="service_item--footer"><a href="#" class="link -blue_light">Learn More>></a></footer>
            </div>
          </div>
        </div>
         <div class="index-more">
            <button type="button" class="am-btn am-btn-secondary">MORE&nbsp;&nbsp;>></button>
          </div>
      </div>
    </div>
  </div>
  <div class="section promo_banner-container">
    <!--index-container start-->
    <div class="promo_banner-box">
      <div class="container">
        <h2 class="promo_banner--title">期待您的加入</h2>
        <p class="promo_banner--text">
					我们成立了三年，正用自己的技术力量一步一步改变世界。
					<br> 我们为用户提供了舒心的搬家体验
					<br> 用户的体验是我们提升的动力
        <footer class="promo_banner--footer">
					<button type="button" class="am-btn am-btn-secondary">MORE>></button>
				</footer>
      </div>
    </div>
    <!--index-container end-->
  </div>
  <!--===========layout-footer================-->
  <div class="layout-footer">
    <div class="footer">
      <div style="background-color:#383d61" class="footer--bg"></div>
      <div class="footer--inner">
        <div class="container">
          <div class="footer_main">
            <div class="am-g">
              <div class="am-u-md-3 ">
                <div class="footer_main--column">
                  <strong class="footer_main--column_title">关于我们</strong>
                  <div class="footer_about">
                      <p class="footer_about--text">
                      提供优质的国际化服务。
                      </p>
                      <p class="footer_about--text">
                   
                      </p>
                    </div>
                </div>
              </div>
              <div class="am-u-md-3 ">
                <div class="footer_main--column">
                  <strong class="footer_main--column_title">产品中心</strong>
                  <ul class="footer_navigation">
                    <li class="footer_navigation--item"><a href="#" class="footer_navigation--link">国内服务</a></li>
                    <li class="footer_navigation--item"><a href="#" class="footer_navigation--link">国际服务</a></li>
                    <li class="footer_navigation--item"><a href="#" class="footer_navigation--link">省内搬家</a></li>
                    <li class="footer_navigation--item"><a href="#" class="footer_navigation--link">市内搬家</a></li>
                    <li class="footer_navigation--item"><a href="#" class="footer_navigation--link">办公室搬迁</a></li>
                  </ul>
                </div>
              </div>
              <div class="am-u-md-3 ">
                <div class="footer_main--column">
                  <strong class="footer_main--column_title">技术支持</strong>
                  <ul class="footer_navigation">
                    <li class="footer_navigation--item"><a href="" class="footer_navigation--link">搬家综合网</a></li>
                    <li class="footer_navigation--item"><a href="" class="footer_navigation--link">搬家社区</a></li>
                    <li class="footer_navigation--item"><a href="" class="footer_navigation--link">搬家在线</a></li>
                    <li class="footer_navigation--item"><a href="" class="footer_navigation--link">搬家服务</a></li>
                    <li class="footer_navigation--item"><a href="" class="footer_navigation--link">客服在线</a></li>
                  </ul>
                </div>
              </div>
              <div class="am-u-md-3 ">
                <div class="footer_main--column">
                  <strong class="footer_main--column_title">联系详情</strong>
                  <ul class="footer_contact_info">
                    <li class="footer_contact_info--item"><i class="am-icon-phone"></i><span>服务专线：13771943054</span></li>
                    <li class="footer_contact_info--item"><i class="am-icon-envelope-o"></i><span>邮箱：772712031@qq.com</span></li>
                    <li class="footer_contact_info--item"><i class="am-icon-map-marker"></i><span>地址:南京软件园</span></li>
                    <li class="footer_contact_info--item"><i class="am-icon-clock-o"></i><span>时间：9-19</span></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="assets/js/jquery-2.1.0.js" charset="utf-8"></script>
  <script src="assets/js/amazeui.js" charset="utf-8"></script>
  <script src="assets/js/common.js" charset="utf-8"></script>
  <script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);

	function myFun(result){
		var cityName = result.name;
		map.setCenter(cityName);
	
		$('#city').text(cityName);
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
</script>
</body>
</html>
