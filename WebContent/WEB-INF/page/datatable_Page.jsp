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
<meta charset="ISO-8859-1">
<title>数据报表</title>
<style type="text/css">
html,body{
    width:100%;
    height:100%;
}
#div1{
    float:left;
    width:50%;
    height:100%;
}
#div2{
    float:left;
    width:50%;
    height:100%;
}
</style>
</head>
<body>

<div id="div1" ></div>
<div id="div2" style="background-color:yellow;"></div>
<!-- <div id="div3" style="background-color:green;"></div>
<div id="div4" style="background-color:blue;"></div> -->
<script type="text/javascript" src="static/echarts/echarts.min.js"></script>
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript">
// 基于准备好的dom，初始化echarts实例
var $=layui.$;
$.ajaxSettings.async = false;
var myChart1 = echarts.init(document.getElementById('div1'));
var myChart2 = echarts.init(document.getElementById('div2'));
/* var myChart3 = echarts.init(document.getElementById('div3'));
var myChart4 = echarts.init(document.getElementById('div4')); */

var tabledata1;
//var arr = new Array(5);
$.post("total_sales",function(d){
	tabledata1=d;
	/* console.log(tabledata1.money[0]);
	var money_sum = 0;
	for(var i=0;i<5;i++){
		if(tabledata1.money[i]==null){
			break;
		}
		money_sum += tabledata1.money[i];
	}
	for(var i=0;i<5;i++){
		if(tabledata1.money[i]==null){
			arr[i] = 0;
			break;
		}
		arr[i] = tabledata1.money[i]/money_sum;
	}  */
})
// 指定图表的配置项和数据
var option1 = {
	title : {
		text : '志愿者志愿服务时长柱状图'
	},
	tooltip : {},
	legend : {
		data : [ '服务时长' ]
	},
	xAxis : {
		data : tabledata1.name
	},
	yAxis : {},
	series : [ {
		name : '服务时长',
		type : 'bar',
		data : tabledata1.money
	} ]
};


var option2 = {
		title : {
			text : '志愿者志愿服务时长折线图'
		},
	    xAxis: {
	        type: 'category',
	        data: tabledata1.name
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [{
	        data: tabledata1.money,
	        type: 'line'
	    }]
	};

// 使用刚指定的配置项和数据显示图表。
myChart1.setOption(option1);
myChart2.setOption(option2);
/* myChart3.setOption(option3);
myChart4.setOption(option4); */
</script>
</body>
</html>