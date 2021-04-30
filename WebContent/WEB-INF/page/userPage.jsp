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
<table class="layui-table" lay-data="{url:'user_list', page:true, id:'usertable_id',toolbar:'#toolbar'}" lay-filter="usertable">
  <thead>
    <tr>
     <th lay-data="{type:'checkbox'}"></th>
     <th lay-data="{type:'numbers'}">行号</th>
      <th lay-data="{field:'User_id', sort: true}">用户ID</th>
      <th lay-data="{field:'User_loginname',sort: true }">登录名</th>
      <th lay-data="{field:'User_loginpass',sort: true}">登录密码</th>
      <th lay-data="{field:'User_realname', sort: true}">真实姓名</th>
     <!--  <th lay-data="{field:'User_department', sort: true}">部门</th> -->
      <th lay-data="{field:'User_tel',sort: true }">手机号码</th>
      <th lay-data="{field:'User_addr', sort: true}">住址</th>
      <th lay-data="{field:'User_sex', sort: true}">性别</th>
      <th lay-data="{toolbar:'#rowtoolbar'}">操作</th>
    </tr>
  </thead>
</table>

<form  hidden id="h_div" class="layui-form "  lay-filter="usersave">
		<div class="layui-form-item" id="phone">
			<div class="layui-inline">
			<label class="layui-form-label">登录名</label>
			<div class="layui-input-inline">
				<input  id="user_loginname" name="user_loginname" type="text" class="layui-input kong"  lay-verify="required">
			</div>
		</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">真实姓名</label>
				<div class="layui-input-inline">
					<input  id="user_realname" name="user_realname" type="text" autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline"">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input id="sys_sex0" type="radio" value="男"  name="user_sex" title="男" lay-filter="test">
					<input id="sys_sex1" type="radio" value="女" name="user_sex" title="女" lay-filter="test">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input name="user_tel"  type="text" autocomplete="off" class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">所在地</label>
				<div class="layui-input-inline">
					<input name="user_addr"type="text"  class="city_input layui-input kong" lay-verify="required"/>
				</div>
			</div>
		</div>
	</form>
	
	<form  hidden id="update_h_div" class="layui-form "  lay-filter="userupdate">
	    <input type='hidden' name="user_id"/>
		<div class="layui-form-item" id="phone">
			<div class="layui-inline">
			<label class="layui-form-label">登录用户</label>
			<div class="layui-input-inline">
				<input id="user_loginname" name="user_loginname" type="text" class="layui-input kong"  lay-verify="required">
			</div>
		</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">真实姓名</label>
				<div class="layui-input-inline">
					<input  id="user_realname" name="user_realname" type="text" autocomplete="off" class="layui-input kong" lay-verify="required">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline"">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input id="sys_sex0" type="radio" value="男"  name="user_sex" title="男" lay-filter="test">
					<input id="sys_sex1" type="radio" value="女" name="user_sex" title="女" lay-filter="test">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input name="user_tel"  type="text" autocomplete="off" class="layui-input kong" lay-verify="required|phone">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">所在地</label>
				<div class="layui-input-inline">
					<input name="user_addr"type="text"  class="city_input layui-input kong"  lay-verify="required"/>
				</div>
			</div>
		</div>
			<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input name="user_loginpass"type="text"  class="city_input layui-input kong"  lay-verify="required"/>
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
table.on('toolbar(usertable)', function(obj) {
	//获取选中数据
	var checkStatus = table.checkStatus('usertable_id');
	var data = checkStatus.data;
	//在浏览器控制台打印
	switch (obj.event) {
	case 'del':
		//如果只有一条信息
		var msg="";
		if(data.length==0){
			//无数据被选中
			layer.alert("请先选中数据，然后操作。");
			return false;
		}else if(data.length==1){
			msg="确定要删除"+data[0].User_realname+"志愿者的信息吗？";
		}else{
			msg="确定要删除"+data[0].User_realname+"等，"+data.length+"条志愿者的信息吗？";
		}
		
	
		layer.confirm(msg,{
			btn:['确定','取消']
		},function(){
			//点击确定之后执行
			//将要删除的数据发送到后台
			var userids="";
			for(var i=0;i<data.length;i++){
				userids+=data[i].User_id+",";
			}
			$.post("user_del_more",{"userids":userids}, function(d){
				//删除后关闭对话框
				layer.closeAll();
				layer.msg('账户信息删除成功',{icon:6,time:2000});
				//表格重新加载
				table.reload('usertable_id');
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
		table.reload('usertable_id',{
			url : 'user_list',
			where : {
				"check" : ''
			}
		});
		break;
	case 'select':
		console.log($("#check").val());
		//查询管理员信息
		table.reload('usertable_id', {
			url : 'user_list',
			where : {
				"check" : $("#check").val()
			}
		});
		break;
	case 'insert':
		//把表单中的内容清空掉
		form.val("usersave",{
			'user_realname':'',
			'user_loginname':'',
			'user_sex':'',
			'user_addr':'',
			'user_tel':'',
			'user_id':'',
			'user_department':''
		});
		//弹出对话框，供客户填写数据
		layer.open({
					type : 1,
					title : '新增志愿者信息',
					content : $("#h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("user_save",form.val("usersave"), function() {
							layer.closeAll();
							layer.alert('默认密码:123456',{title:'新增志愿者信息'});
							table.reload('usertable_id');
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

table.on('tool(usertable)', function(obj) {
	var data = obj.data;
	//console.log(data);
	switch (obj.event) {
	case 'update':
		//$("update_h_div [name=user_sex]").val(data.user_sex);
		form.val("userupdate",{
			'user_realname':data.User_realname,
			'user_loginname':data.User_loginname,
			'user_sex':data.User_sex,
			'user_addr':data.User_addr,
			'user_tel':data.User_tel,
			'user_id':data.User_id,
			'user_loginpass':data.User_loginpass,
			'user_department':data.User_department
		});
		//弹出对话框
		layer.open({
					type : 1,
					title : '编辑志愿者信息',
					content : $("#update_h_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						$.post("user_update",form.val("userupdate"), function() {
							layer.closeAll();
							layer.msg(data.User_realname+'志愿者信息修改成功！',{icon:6,time:2000});
							table.reload('usertable_id');
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
		layer.confirm("确定要删除"+data.User_realname+"志愿者的信息吗？",{
			btn:['确定','取消']
		
		},function(){
			//alert(123);
			//点击确定之后执行
			//将要删除的数据发送到后台
			$.post("user_del",data, function(d){
				//删除后关闭对话框
				layer.closeAll();
				//表格重新加载
				table.reload('usertable_id');
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