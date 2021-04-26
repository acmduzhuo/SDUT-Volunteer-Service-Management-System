<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="static/layui/css/layui.css">
<body>

<!-- 天骄表头工具 -->
<script type="text/html" id="toolbar">
	<input type="text" style="height:38px;" id="check"/>
	<button class="layui-btn layui-icon layui-icon-search " lay-event="select">查询</button>
	<button class="layui-btn layui-icon layui-icon-refresh" lay-event="refresh">刷新</button>
</script>
<table class="layui-table" lay-data="{url:'customer_ceshi_list', page:true, id:'customertable_id',toolbar:'#toolbar'}" lay-filter="customertable">
  <thead>
    <tr>
<th lay-data="{type:'checkbox'}"></th>
     <th lay-data="{type:'numbers'}">行号</th>
      <th lay-data="{field:'Customer_id', sort: true}">ID</th>
      <th lay-data="{field:'Customer_name',sort: true }">业绩公司</th>
      <th lay-data="{field:'Customer_liaison',sort: true}">员工姓名</th>
      <th lay-data="{field:'Customer_department',sort: true}">部门</th>
      <th lay-data="{field:'Customer_tel',sort: true}">手机号码</th>
      <th lay-data="{field:'Customer_state', sort: true,
      templet:function(data){
      if(data.Customer_state==0){
          return '公海员工';
      }else{
          return '私有员工';
      }
      }}">状态</th>
      <th lay-data="{field:'Customer_addr', sort: true}">住址</th>
    </tr>
  </thead>
</table>
	
	
	
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript">
var table = layui.table;
var $ = layui.$;
var layer = layui.layer;
var form = layui.form;
table.on('toolbar(customertable)', function(obj) {
	//获取选中数据
	var checkStatus = table.checkStatus('customertable_id');
	var data = checkStatus.data;
	//在浏览器控制台打印
	
	switch (obj.event) {
	case 'refresh':
		table.reload('customertable_id',{
			url : 'customer_ceshi_list',
			where : {
				"check" : ''
			}
		});
		break;
	case 'select':
		table.reload('customertable_id', {
			url : 'customer_all_list',
			where : {
				"check" : $("#check").val()
			}
		});
		break;
	case 'insert':
		//把表单中的内容清空掉
		
		//弹出对话框，供客户填写数据
		alert("请移步 全部员工 界面操作。")
		//保存和取消按钮
		break;
	}
});

table.on('tool(customertable)', function(obj) {
	var data = obj.data;
	//console.log(data);
	switch (obj.event) {
	case 'update':
		//$("update_h_div [name=customer_sex]").val(data.customer_sex);
		alert("请移步 全部员工 界面操作。")
		break;
	case 'del':
		//编写业务代码
		//alert(data.customer_realname);
		layer.confirm("确定要删除"+data.Customer_name+"账户的信息吗？",{
			btn:['确定','取消']
		
		},function(){
			//点击确定之后执行
			//将要删除的数据发送到后台
			$.post("customer_del",data, function(d){
				//删除后关闭对话框
				layer.closeAll();
				//表格重新加载
				layer.msg(data.Customer_name+'员工信息删除成功！',{icon:6,time:2000});
				table.reload('customertable_id');
			});
			//后台执行删除SQL语句
		},
		function(){
			//点击取消后执行
			//点击关闭后执行
			layer.closeAll();
	    });
		break;
	}
});
</script>
</body>
</html>