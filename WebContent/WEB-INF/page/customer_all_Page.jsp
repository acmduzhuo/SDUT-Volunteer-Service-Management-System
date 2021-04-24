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
<table class="layui-table" lay-data="{url:'customer_all_list', page:true, id:'customertable_id',toolbar:'#toolbar'}" lay-filter="customertable">
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
      <th lay-data="{toolbar:'#rowtoolbar'}">操作</th>
    </tr>
  </thead>
</table>

<form  hidden id="h_div" class="layui-form "  lay-filter="customersave">
		<div class="layui-form-item" id="phone">
			<div class="layui-inline">
			<label class="layui-form-label">业绩公司</label>
			<div class="layui-input-inline">
				<input name="customer_name" type="text" class="layui-input kong"  lay-verify="required">
			</div>
		</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">员工姓名</label>
				<div class="layui-input-inline">
					<input name="customer_liaison" type="text"  class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input name="customer_tel"  type="text" class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">所在地</label>
				<div class="layui-input-inline">
					<input name="customer_addr"type="text"  class="city_input layui-input kong" lay-verify="required"/>
				</div>
			</div>
		</div>
	</form>
	
	<form  hidden id="update_h_div" class="layui-form "  lay-filter="customerupdate">
	    <input type='hidden' name="customer_id"/>
		<div class="layui-form-item">
			<div class="layui-inline">
			<label class="layui-form-label">业绩公司</label>
			<div class="layui-input-inline">
				<input name="customer_name" type="text" class="layui-input kong"  lay-verify="required">
			</div>
		</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">员工姓名</label>
				<div class="layui-input-inline">
					<input name="customer_liaison" type="text" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">部门</label>
				<div class="layui-input-inline">
					<input name="customer_department"  type="text" class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input name="customer_tel"  type="text" class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">所在地</label>
				<div class="layui-input-inline">
					<input name="customer_addr"type="text"  class="city_input layui-input kong"  lay-verify="required"/>
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
table.on('toolbar(customertable)', function(obj) {
	//获取选中数据
	var checkStatus = table.checkStatus('customertable_id');
	var data = checkStatus.data;
	//在浏览器控制台打印
	
	switch (obj.event) {
	case 'del':
		//如果只有一条信息
		var msg = "";
		if(data.length==0){
			//无数据被选中
			//console.log(data);
			layer.alert("请先选中数据，然后操作。");
			return false;
		}else if(data.length==1){
			msg="确定要删除"+data[0].Customer_liaison+"账户的信息吗？";
		}else{
			msg="确定要删除"+data[0].Customer_liaison+"等，"+data.length+"条账户的信息吗？";
		}
		layer.confirm(msg,{
			btn:['确定','取消']
		},function(){
			//点击确定之后执行
			//将要删除的数据发送到后台
			var customerids = "";
			for(var i=0;i<data.length;i++){
				customerids+=data[i].Customer_id+",";
				//console.log(customerids);
			}
			$.post("customer_del_more",{"customerids":customerids}, function(d){
				//删除后关闭对话框
				layer.closeAll();
				layer.msg('员工删除成功。');
				//表格重新加载
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
	case 'refresh':
		table.reload('customertable_id',{
			url : 'customer_all_list',
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
		form.val("customersave",{
			'customer_name':'',
			'customer_liaison':'',
			'customer_addr':'',
			'customer_tel':'',
			'customer_department':''
		});
		//弹出对话框，供客户填写数据
		layer.open({
					type : 1,
					title : '新增员工信息',
					content : $("#h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("customer_save",form.val("customersave"), function() {
							layer.closeAll();
							layer.msg('员工信息保存成功',{icon:6, time:2000});
							table.reload('customertable_id');
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

table.on('tool(customertable)', function(obj) {
	var data = obj.data;
	//console.log(data);
	switch (obj.event) {
	case 'update':
		//$("update_h_div [name=customer_sex]").val(data.customer_sex);
		form.val("customerupdate",{
			'customer_name':data.Customer_name,
			'customer_liaison':data.Customer_liaison,
			'customer_addr':data.Customer_addr,
			'customer_tel':data.Customer_tel,
			'customer_id':data.Customer_id,
			'customer_department':data.Customer_department
		});
		//弹出对话框
		layer.open({
					type : 1,
					title : '编辑员工信息',
					content : $("#update_h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("customer_update",form.val("customerupdate"), function() {
							layer.closeAll();
							layer.msg(data.Customer_liaison+'员工信息修改成功！',{icon:6,time:2000});
							table.reload('customertable_id');
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
		//alert(data.customer_realname);
		layer.confirm("确定要删除"+data.Customer_liaison+"账户的信息吗？",{
			btn:['确定','取消']
		
		},function(){
			//点击确定之后执行
			//将要删除的数据发送到后台
			$.post("customer_del",data, function(d){
				//删除后关闭对话框
				layer.closeAll();
				//表格重新加载
				layer.msg(data.Customer_liaison+'员工信息删除成功！',{icon:6,time:2000});
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