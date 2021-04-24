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
	<button class="layui-btn layui-icon layui-icon-add-1" lay-event="insert">新增跟单客户</button>
	<button class="layui-btn layui-icon layui-icon-refresh" lay-event="refresh">刷新</button>
</script>
<script type="text/html" id="rowtoolbar">
	<a class="layui-btn layui-btn-xs layui-icon layui-icon-edit" lay-event="public">放弃跟单</a>
    <a class="layui-btn layui-btn-xs layui-icon layui-icon-edit layui-bg-blue" lay-event="visit">评价</a>
    <a class="layui-btn layui-btn-xs layui-icon layui-icon-edit layui-bg-blue" lay-event="visitlog">评价记录</a>
</script>
<table class="layui-table" lay-data="{url:'customer_private_list', page:true, id:'customertable_id',toolbar:'#toolbar'}" lay-filter="customertable">
  <thead>
    <tr>
     <th lay-data="{type:'checkbox'}"></th>
     <th lay-data="{type:'numbers'}">行号</th>
     <!--  <th lay-data="{field:'Customer_id', sort: true}">ID</th> -->
      <th lay-data="{field:'Customer_name',sort: true }">业绩公司</th>
      <th lay-data="{field:'Customer_liaison',sort: true}">员工姓名</th>
      <th lay-data="{field:'Customer_department',sort: true}">部门</th>
      <th lay-data="{field:'Customer_tel',sort: true }">手机号码</th>
           <th lay-data="{field:'Customer_state', sort: true,
      templet:function(data){
      if(data.Customer_state==0){
          return '公海员工'
      }else{
          return '私有员工';
      }
      }}">状态</th>
      <th lay-data="{field:'Customer_addr', sort: true}">住址</th>
      <th lay-data="{toolbar:'#rowtoolbar',width:300}">操作</th>
    </tr>
  </thead>
</table>

<form  hidden id="h_div" class="layui-form "  lay-filter="customersave">
<input type="hidden" name="private" value="private">
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
				<label class="layui-form-label">联系人</label>
				<div class="layui-input-inline">
					<input name="customer_liaison" type="text"  class="layui-input kong" lay-verify="required">
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
					<input name="customer_addr"type="text"  class="city_input layui-input kong" lay-verify="required"/>
				</div>
			</div>
		</div>
	</form>
	
	<form  hidden id="visit_div" class="layui-form "  lay-filter="visitsave">
		<div class="layui-form-item" id="phone">
		<div class="layui-inline">
			
	      <label class="layui-form-label">是否合格</label>
	      <div class="layui-input-block">
	          <input type="checkbox" lay-text="是|否" name="visit_payment" lay-skin="switch" lay-filter="payment">
	      </div>
	    </div>
	      <div class="layui-inline">
				<label class="layui-form-label">业绩</label>
				<div class="layui-input-inline">
					<input name="visit_money" type="text" autocomplete="off" 
					      class="layui-input kong" readonly lay-verify="required">
				</div>
			</div>
	   
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">留言</label>
				<div class="layui-input-inline">
					<textarea name="visit_customer_info" placeholder="请输入内容" class="layui-textarea" 
					     style="width:190%;"></textarea>
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
	
	case 'refresh':
		table.reload('customertable_id',{
			url : 'customer_private_list',
			where : {
				"check" : ''
			}
		});
		break;
	case 'select':
		//console.log($("#check").val());
		//查询管理员信息
		table.reload('customertable_id', {
			url : 'customer_private_list',
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
			'customer_tel' :''
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
							layer.msg('员工信息保存成功',{
								icon : 6,
								time : 2000
								});
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
	case 'visitlog':
		location.href="visitlog_page?Customer_id="+data.Customer_id;
		break;
	case 'public':
		layer.confirm("确定要放弃对"+data.Customer_liaison+"跟单吗？",{
			btn:['确定','取消']
		},function(){
			//点击第一个按钮执行方法
			$.post("customer_public",data,function(d){
				//执行成功表格重新刷新
				layer.msg(data.Customer_liaison+"已成为公海员工",{
					icon:6,
					time:2000
			        });
				table.reload('customertable_id');
			});
		});
		break;
	case 'visit':
		//$("update_h_div [name=user_sex]").val(data.user_sex);
		form.val("visitsave",{
			'visit_customer_info':"",
			'visit_money':"0",
			'visit_payment':false
		});
		$("[name=visit_money]").attr("readonly","readonly");
		//弹出对话框
		layer.open({
					type : 1,
					area: ['500px', '300px'],
					title : '回访记录',
					content : $("#visit_div"),
					btn : [ '确定', '取消' ],
					btn1 : function() {
						var formdata=form.val("visitsave");
						formdata.customer_id=data.Customer_id;
						$.post("visit_save",formdata, 
						function() {
							layer.closeAll();//关闭所有对话框
							layer.msg('回访信息保存成功！',
								  {
								      icon:1,//图标序号
								      time:2000
								  });
						});
					},
					btn2 : function() {
						//点击取消
						//关闭弹出框
						layer.closeAll();
					}
				});
		break;
	}
});
form.on('switch(payment)',function(data){
if(this.checked){
	//付款金额可填
	$("[name=visit_money]").removeAttr("readonly");
}else{
	//付款金额不可填
	$("[name=visit_money]").attr("readonly","readonly").val("0");
}
    });
</script>
</body>
</html>