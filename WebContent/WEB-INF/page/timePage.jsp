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
<base href="<%=basePath%>"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="static/layui/css/layui.css">
<body>

<!-- 天骄表头工具 -->
<script type="text/html" id="toolbar">
	<input type="text" style="height:38px;" id="check"/>
	<button class="layui-btn layui-icon layui-icon-search " lay-event="select">查询</button>
	<button class="layui-btn layui-icon layui-icon-add-1" lay-event="insert">新增</button>
	<button class="layui-btn layui-icon layui-icon-close" lay-event="del">删除</button>
	<button class="layui-btn layui-icon layui-icon-refresh" lay-event="refresh">刷新</button>
</script>
<script type="text/html" id="rowtoolbar">
	<a class="layui-btn layui-btn-xs layui-icon layui-icon-edit" lay-event="update">编辑</a>
	<a class="layui-btn layui-btn-xs  layui-icon layui-icon-close layui-bg-red" lay-event="del">删除</a>
</script>
<table class="layui-table" lay-data="{url:'time_list', page:true, id:'timetable_id',toolbar:'#toolbar'}" lay-filter="timetable">
  <thead>
    <tr>
     <th lay-data="{type:'checkbox'}"></th>
     <th lay-data="{type:'numbers'}">行号</th>
      <th lay-data="{field:'Visit_id', sort: true}">填报ID</th>
      <th lay-data="{field:'Visit_user_id',sort: true }">志愿者ID</th>
      <th lay-data="{field:'Visit_customer_id',sort: true}">活动ID</th>
      <th lay-data="{field:'Visit_payment', sort: true,
      templet:function(data){
      if(data.Visit_payment==0){
          return '未参加'
      }else{
          return '已参加';
      }
      }}">是否参与</th>
      <th lay-data="{field:'Visit_money', sort: true}">参加时长</th>
      <th lay-data="{field:'Visit_time',sort: true }">填报时间</th>
      <th lay-data="{field:'Visit_customer_info', sort: true}">志愿者反馈</th>
      <th lay-data="{toolbar:'#rowtoolbar'}">操作</th>
    </tr>
  </thead>
</table>

<form  hidden id="h_div" class="layui-form "  lay-filter="timesave">
		<div class="layui-form-item" id="phone">
			<div class="layui-inline">
			<label class="layui-form-label">志愿者ID</label>
			<div class="layui-input-inline">
				<input  id="visit_user_id" name="visit_user_id" type="text" class="layui-input kong"  lay-verify="required">
			</div>
		</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">活动ID</label>
				<div class="layui-input-inline">
					<input  id="visit_customer_id" name="visit_customer_id" type="text" autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline"">
				<label class="layui-form-label">是否参与</label>
				<div class="layui-input-block">
					<input id="sys_sex0" type="radio" value="1"  name="visit_payment" title="已参加" lay-filter="test">
					<input id="sys_sex1" type="radio" value="0" name="visit_payment" title="未参加" lay-filter="test">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">参加时长</label>
				<div class="layui-input-inline">
					<input  name="visit_money" type="text" autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">志愿者反馈</label>
				<div class="layui-input-inline">
					<input name="visit_customer_info"  type="text" autocomplete="off" class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
	</form>
	
	<form  hidden id="update_h_div" class="layui-form "  lay-filter="timeupdate">
		<div class="layui-form-item">
			<div class="layui-inline"">
				<label class="layui-form-label">是否参与</label>
				<div class="layui-input-block">
					<input id="sys_sex0" type="radio" value="1"  name="visit_payment" title="已参加" lay-filter="test">
					<input id="sys_sex1" type="radio" value="0" name="visit_payment" title="未参加" lay-filter="test">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">参加时长</label>
				<div class="layui-input-inline">
					<input name="visit_money"  type="text" autocomplete="off" class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
	</form>
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript">
var table = layui.table;
var $ = layui.$;
var layer = layui.layer;
var form = layui.form;
table.on('toolbar(timetable)', function(obj) {
	//获取选中数据
	var checkStatus = table.checkStatus('timetable_id');
	var data = checkStatus.data;
	//在浏览器控制台打印
	switch (obj.event) {
	case 'del':
		console.log("data=====", data);
		//如果只有一条信息
		var msg="";
		if(data.length==0){
			//无数据被选中
			layer.alert("请先选中数据，然后操作。");
			return false;
		}else if(data.length==1){
			msg="确定要删除此条填报信息吗？";
		}else{
			msg="确定要删除这些填报信息吗？";
		}
		layer.confirm(msg,{
			btn:['确定','取消']
		},function(){
			//点击确定之后执行
			//将要删除的数据发送到后台
			var timeids="";
			for(var i=0;i<data.length;i++){
				timeids+=data[i].Visit_id+",";
			}
			$.post("time_del_more",{"timeids":timeids}, function(d){
				//删除后关闭对话框
				layer.closeAll();
				layer.msg('账户信息删除成功',{icon:6,time:2000});
				//表格重新加载
				table.reload('timetable_id');
			});
			//后台执行删除SQL语句
		},
		function(){
			//点击取消后执行
			//点击关闭后执行
			layer.closeAll();
	    });
		break;
	case 'refresh':
		table.reload('timetable_id',{
			url : 'time_list',
			where : {
				"check" : ''
			}
		});
		break;
	case 'select':
		console.log($("#check").val());
		//查询管理员信息
		table.reload('guanlitable_id', {
			url : 'guanli_list',
			where : {
				"check" : $("#check").val()
			}
		});
		break;
	case 'insert':
		//把表单中的内容清空掉
		form.val("guanlisave",{
			'visit_user_id':'',
			'visit_customer_id':'',
			'visit_payment':'',
			'visit_money':'',
			'visit_customer_info': ''
		});
		//弹出对话框，供客户填写数据
		layer.open({
					type : 1,
					title : '新增填报记录信息',
					content : $("#h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("time_save",form.val("timesave"), function() {
							layer.closeAll();
							table.reload('timetable_id');
						});
					},
					btn2 : function() {
						//点击取消
						//关闭弹出框
						layer.closeAll();
					}
				});
		//保存和取消按钮
		break;
	}
});

table.on('tool(timetable)', function(obj) {
	var data = obj.data;
	switch (obj.event) {
	case 'update':
		form.val("timeupdate",{
			'visit_payment':data.Visit_payment,
			'visit_money':data.Visit_money
		});
		//弹出对话框
		layer.open({
					type : 1,
					title : '编辑填报信息',
					content : $("#update_h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("time_update",form.val("timeupdate"), function() {
							layer.closeAll();
							layer.msg('填报信息修改成功！',{icon:6,time:2000});
							table.reload('timetable_id');
						});
					},
					btn2 : function() {
						//点击取消
						//关闭弹出框
						layer.closeAll();
					}
				});
		break;
	case 'del':
		//编写业务代码
		//alert(data.user_realname);
		layer.confirm("确定要删除此条填报信息吗？",{
			btn:['确定','取消']
		
		},function(){
			//alert(123);
			//点击确定之后执行
			//将要删除的数据发送到后台
			$.post("time_del",data, function(d){
				//删除后关闭对话框
				layer.closeAll();
				//表格重新加载
				table.reload('timetable_id');
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