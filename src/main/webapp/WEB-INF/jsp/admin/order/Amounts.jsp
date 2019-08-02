<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <% String PATH=request.getContextPath(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link href="${PATH }/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${PATH }/admin/css/style.css" />
        <link href="${PATH }/admin/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${PATH }/admin/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${PATH }/admin/font/css/font-awesome.min.css" />
        
        <script src="${PATH }/admin/js/jquery-1.9.1.min.js"></script>
        <script src="${PATH }/admin/assets/js/bootstrap.min.js"></script>
        <script src="${PATH }/admin/assets/js/typeahead-bs2.min.js"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript"></script>
        <script src="${PATH }/admin/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${PATH }/admin/assets/dist/echarts.js"></script>
        <script src="${PATH }/admin/js/myutil.js"></script>
        <title>交易金额</title>
    </head>
    <body>
        <div class="margin clearfix">
            <div class="amounts_style">
                <div class="transaction_Money clearfix">
                    <div class="Money">
                                                                  成交总额：<span id="totalTranscMoney">0.00</span>元
                        <p>最新统计时间:<fmt:formatDate value="<%=new Date() %>" pattern="yyyy-MM-dd"/></p>
                    </div>
                    <div class="Money">
                        <span id="todayTranscMoney">
                            <em>￥</em>0.00元</span>
                        <p>当天成交额</p>
                    </div>
                    <div class="l_f Statistics_btn">
                        <a href="javascript:void()" title="当月统计" onclick="Statistics_btn()" class="btn  btn-info btn-sm no-radius">
                            <i class="bigger fa fa-bar-chart "></i>
                            <h5 class="margin-top">当月统计</h5></a>
                    </div>
                </div>
                <div class="border clearfix">
                    <span class="l_f">
                        <a href="javascript:void();" onclick="getOrdersListByTime(1)" class="btn btn-info">全部订单</a>
                        <a href="javascript:void();" onclick="getOrdersListByTime(2)" class="btn btn-warning">当月订单</a>
                        <a href="javascript:void();" onclick="getOrdersListByTime(3)" class="btn">本周订单</a>
                        <a href="javascript:void();" onclick="getOrdersListByTime(4)" class="btn btn-primary">近三天订单</a>
                        <a href="javascript:void();" onclick="getOrdersListByTime(5)" class="btn btn-danger">当天订单</a>
                    </span>
                    <span class="r_f">共：
                        <b id="orderNum">0</b>笔</span>
                </div>
                <div class="Record_list">
                    <table class="table table-striped table-bordered table-hover" id="sample-table">
                        <thead>
                            <tr>
                                <!-- <th width="100px">序号</th> -->
                                <th width="200px">订单编号</th>
                                <th width="180px">成交时间</th>
                                <th width="120px">成交金额(元)</th>
                                <th width="180px">状态</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="Statistics" style="display:none">
            <div id="main" style="height:400px; overflow:hidden; width:1000px; overflow:auto"></div>
        </div>
    </body>
</html>
<script>
	function getTransMoney(){
		$.post('order/queryTransMoney',function(data){
			$("#totalTranscMoney").html(data.allTransMoney);
			$("#todayTranscMoney").html("<em style='fontSize:20pt;'>￥</em>"+data.todayTransMoney+"元");
			$("#orderNum").html(data.allOrdersNum);
		});
	}
	function getOrdersListByTime(flag){
		table.ajax.
			url('order/queryOrdersListByPageAndTime?flag='+flag).load();
	}
	var table;
	function getOrdersList(flag){
		table=$('#sample-table').DataTable( {
	        "ajax": 'order/queryOrdersListByPageAndTime?flag='+flag,
	        "columns": [
                 { "data": "oid" },
                 { "data": "ordertime",
                	 "render": function ( data, type, full, meta ) {
               	       return GetDate(data);
               	     }
                 },
                 { "data": "totalMoney" },
                 { "data": "status",
                	 "render": function ( data, type, full, meta ) {
	            		//return GetStatus(data);
                		 if(data=='0'){
                			 return "<span class='label label-success radius'>待付款</span>";
                		 }else if(data=='1'){
                			 return "<span class='label label-danger radius'>待发货</span>";
                		 }else if(data=='2'){
                			 return "<span class='label label-primary radius'>已发货</span>";
                		 }else if(data=='3'){
                			 return "<span class='label label-warm radius'>已收货</span>";
                		 }else if(data=='4'){
                			 return "<span class='label label-success radius'>已评价</span>";
                		 }else if(data=='-1'){
                			 return "<span class='label label-failed radius'>失效</span>";
                		 }else if(data=='-2'){
                			 return "<span class='label label-failed radius'>待退款</span>";
                		 }else {
                			 return "<span class='label label-success radius'>已退款</span>";
                		 }
	           	     }	
                 }
             ],
             "aLengthMenu": [5, 10, 20]
	    });
	}
	$(function() {
		getTransMoney();
		getOrdersList();
		
    })
    //当月统计
    function Statistics_btn() {
        var index = layer.open({
            type: 1,
            title: '当月销售统计',
            maxmin: true,
            shadeClose: false,
            area: ['1000px', ''],
            content: $('#Statistics'),
            btn: ['确定', '取消'],
        })
        //layer.full(index);
    }
    //统计
    require.config({
        paths: {
            echarts: '${PATH }/admin/assets/dist'
        }
    });
    require(['echarts', 'echarts/theme/macarons', 'echarts/chart/line', // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
    'echarts/chart/bar'],
    function(ec, theme) {
        var myChart = ec.init(document.getElementById('main'), theme);
        option = {
            tooltip: {
                trigger: 'axis'
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {
                        show: true
                    },dataView: {
                        show: true,
                        readOnly: false
                    },magicType: {
                        show: true,
                        type: ['line', 'bar']
                    },restore: {
                        show: true
                    },saveAsImage: {
                        show: true
                    }
                }
            },
            calculable: true,
            legend: {
                data: ['成交订单', '失败订单', '成交金额','失败金额']
            },
            xAxis: [{
                type: 'category',
                data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '125', '26', '27', '28', '29', '30', '31']
            }],
            yAxis: [{
                type: 'value',
                name: '订单',
                axisLabel: {
                    formatter: '{value} 单'
                }
            },{
                type: 'value',
                name: '金额',
                axisLabel: {
                    formatter: '{value} 元'
                }
            }],
            series: [/*{
                name: '成交订单',
                type: 'bar',
                data: [20, 49, 70, 232, 26, 67, 136, 162, 36, 20, 64, 33, 26, 67, 136, 162, 36, 20, 64, ]
            },{
                name: '失败订单',
                type: 'bar',
                data: [2, 5, 9, 4, 2, 7, 1, 1, 4, 1, 0, 3, 0, 0, 1, 2, 6, 2, 6, ]
            }  ,{
                name: '成交金额',
                type: 'line',
                yAxisIndex: 1,
                data: [2024, 2233, 3344, 4543, 6355, 1042, 2037, 2346, 2305, 1654, 2120, 6542, 2656, 6547, 1346, 2162, 3456, 4520, 6664, ]
            }  */]
        };

        myChart.setOption(option);
        //ajax 从后台拿到数据
        $.get('order/querySalesCondition').done(function (data) {
        	console.info(data);
            // 填入数据
            myChart.setOption({
               series: [{
                    // 成功订单 数量
                    name: '成交订单',
                    type: 'bar',
                    data: data.resultListOfSucc[0].data
                 },{
                	//失败订单 数量
                	 name: '失败订单',
                     type: 'bar',
                     data: data.resultListOfFailed[0].data
                 },{
                	//失败订单 金额
	               	 name: '失败金额',
	                 type: 'line',
	                 yAxisIndex: 1,
	                 data: data.resultListOfFailed[1].data
	             },{
               		//成功订单 金额
	              	 name: '成交金额',
	                 type: 'line',
	                 yAxisIndex: 1,
	                 data: data.resultListOfSucc[1].data
	              }
	           ]
            });
        });
    })
</script>