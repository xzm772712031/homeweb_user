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
<div class="layout">
  
    <div class="register-box">
      <form  class="am-form" data-am-validator action="feedback" method="post" enctype="multipart/form-data">
        <fieldset>
          <legend>服务反馈<p class="register-info">提交您的服务反馈。</p></legend>
           <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd" >类别</label>
              </div>
              <div class="am-u-md-10">
                <select id="doc-select-1" name="feedBackType_Id">
                 <c:forEach items="${typelist }" var="t">
                 <option value=${t.feedbackTypeId }>${t.feedbackTypeName }</option>
                  </c:forEach>
                 </select>
              </div>
            </div>
          </div>          
         <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-name-2" class="register-name">标题</label>
              </div>
              <div class="am-u-md-10">
                <input type="text" id="doc-vld-name-2" minlength="1" name="feedbackTitle"
                       placeholder="输入标题" required/>
                   
                       <span id="message"></span>
              </div>
            </div> 
                 <input type="hidden" name="user_Id" value="${userId}" >
          <input type="hidden" name="order_Id" value="${orderID }" >
          </div>
          <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd" >内容</label>
              </div>
              <div class="am-u-md-10">
              <textarea class="" rows="5" id="doc-ta-1" name="feedbackContent"></textarea>
              </div>
            </div>
          </div>
          
             <div class="am-form-group">
            <div class="am-g">
              <div class="am-u-md-2 am-padding-0 am-text-right">
                <label for="doc-vld-pwd-1" class="register-pwd" >图片附件</label>
              </div>
         
             <div class=" am-form-file">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <button type="button" class="am-btn am-btn-default am-btn-sm">
                 <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
             <input type="file" multiple name="items_pic">
           </div>
            </div>
             <div class="am-g">
            <div class="am-u-md-10">
              <input class="am-btn am-btn-secondary" type="submit" id="btn" value="提交">
            </div>
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
