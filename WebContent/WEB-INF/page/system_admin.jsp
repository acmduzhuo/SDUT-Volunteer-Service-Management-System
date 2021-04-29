  <%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
  <!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>志愿者管理系统</title>
  <link rel="stylesheet" href="static/layui/css/layui.css">
  </head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">志愿者管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
   <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="javascript:;" url="datatable_page">数据报表</a></li>
      <!--  <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>-->
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
         ${loginuser_admin.User_realname}
        </a>
<!--         <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl> -->
      </li>
      <li class="layui-nav-item"><a href="admin">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item"><a layui-icon layui-icon-friends href="javascript:;" url="user_page"><span class=" layui-icon layui-icon-friends">&nbsp;&nbsp;&nbsp;</span>志愿者管理界面</a></li>
        <li class="layui-nav-item"><a layui-icon layui-icon-friends href="javascript:;" url="guanli_page"><span class=" layui-icon layui-icon-username">&nbsp;&nbsp;&nbsp;</span>管理员界面</a></li>
        <li class="layui-nav-item">
          <a href="javascript:;"><span class=" layui-icon layui-icon-user">&nbsp;&nbsp;&nbsp;</span>志愿活动管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;"url="customer_all_guanli_page">全部志愿活动</a></dd>
            <a href="javascript:;"><span class=" layui-icon layui-icon-user">&nbsp;&nbsp;&nbsp;</span>志愿活动分类列表</a>
                 <dl class="layui-nav-child">
                     <dd><a href="javascript:;"url="customer_yanfa_guanli_page">研发部门</a></dd>
                     <dd><a href="javascript:;"url="customer_shichang_guanli_page">市场部门</a></dd>
                     <dd><a href="javascript:;"url="customer_ceshi_guanli_page">测试部门</a></dd>
                     <dd><a href="javascript:;"url="customer_qita_guanli_page">其他部门</a></dd>
                 </dl>
          </dl>
        </li>
        <li class="layui-nav-item"><a layui-icon layui-icon-friends href="javascript:;" url="time_page"><span class=" layui-icon layui-icon-friends">&nbsp;&nbsp;&nbsp;</span>志愿时长管理界面</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
<iframe id="main_iframe" style="width:100%;height:98%;border-style:none;" src="datatable_page"></iframe>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    山东理工大学志愿者服务系统
  </div>
</div>
<script src="static/layui/layui.all.js"></script>
<script>
//JavaScript代码区域
/*选择有URL属性的组件---属性选择器*/
var $=layui.$;
$("[url]").click(function(){
	//当拥有URL属性的组件被点击的时候会执行以下代码
	//将自身的URL属性值传给main_iframe作为src属性
	//$(this)代表发生的事件元素
	//attr("");获取指定属性的属性值
	var url=$(this).attr("url");
	$("#main_iframe").attr("src",url);
});
</script>
</body>
</html>