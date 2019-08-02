<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% String PATH=request.getContextPath(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${PATH }/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${PATH }/admin/css/style.css" />
        <link rel="stylesheet" href="${PATH }/admin/assets/css/font-awesome.min.css" />
        <link href="${PATH }/admin/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${PATH }/admin/font/css/font-awesome.min.css" />
        
        <script src="${PATH }/admin/assets/js/ace-extra.min.js"></script>
       
        <script src="${PATH }/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
      
        <script src="${PATH }/admin/assets/dist/echarts.js"></script>
        <script src="${PATH }/admin/assets/js/bootstrap.min.js"></script>
        <title>交易</title>
    </head>
    
    <body>
        <div class=" page-content clearfix">
            <div class="transaction_style">
                <ul class="state-overview clearfix">
                    <li class="Info">
                        <span class="symbol red">
                            <i class="fa fa-jpy"></i>
                        </span>
                        <span class="value">
                            <h4>交易金额</h4>
                            <p class="Quantity color_red" id="transMoney">0.0</p></span>
                    </li>
                    <li class="Info">
                        <span class="symbol  blue">
                            <i class="fa fa-shopping-cart"></i>
                        </span>
                        <span class="value">
                            <h4>订单数量</h4>
                            <p class="Quantity color_red"id="totalOrderCount">0</p></span>
                    </li>
                    <li class="Info">
                        <span class="symbol terques">
                            <i class="fa fa-shopping-cart"></i>
                        </span>
                        <span class="value">
                            <h4>交易成功</h4>
                            <p class="Quantity color_red"id="successOrderCount">0</p></span>
                    </li>
                    <li class="Info">
                        <span class="symbol yellow">
                            <i class="fa fa-shopping-cart"></i>
                        </span>
                        <span class="value">
                            <h4>交易失败</h4>
                            <p class="Quantity color_red"id="failedOrderCount">0</p></span>
                    </li>
                    <li class="Info">
                        <span class="symbol darkblue">
                            <i class="fa fa-jpy"></i>
                        </span>
                        <span class="value">
                            <h4>退款金额</h4>
                            <p class="Quantity color_red"id="returnMoney">0.0</p></span>
                    </li>
                </ul>
            </div>
            <div class="t_Record">
                <div id="main" style="height:400px; overflow:hidden; width:100%; overflow:auto"></div>
            </div>
        </div>
    </body>
</html>
<script type="text/javascript">
	function queryTransc(){
		$.post(
			'order/queryTransc',
			function(data){
				$("#transMoney").html(data.transMoney);
				$("#totalOrderCount").html(data.totalOrdersCount);
				$("#successOrderCount").html(eval(data.totalOrdersCount-data.failedOrdersCount));	
				$("#failedOrderCount").html(data.failedOrdersCount);
				$("#returnMoney").html(data.returnMoney);
			}
		);
	}
	$(document).ready(function() {
		//查询当月  交易金额  订单数量  交易成功  交易失败  退款金额
		queryTransc();
		
        $(".t_Record").width($(window).width() - 60);
        //当文档窗口发生改变时 触发  
        $(window).resize(function() {
            $(".t_Record").width($(window).width() - 60);
        });
    });

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
            title: {
                text: '全年购买订单交易记录',
                subtext: '实时获取用户订单购买记录'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['所有订单', '待付款', '已付款','已发货', '已收货','已评价']
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {
                        show: true
                    },
                    dataView: {
                        show: true,
                        readOnly: false
                    },
                    magicType: {
                        show: true,
                        type: ['line', 'bar']
                    },
                    restore: {
                        show: true
                    },
                    saveAsImage: {
                        show: true
                    }
                }
            },
            calculable: true,
            xAxis: [{
                type: 'category',
                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
            }],
            yAxis: [{
                type: 'value'
            }],
            /* series: [{
                name: '所有订单',
                type: 'bar',
                data: [120, 49, 70, 232, 256, 767, 1356, 1622, 326, 200, 164, 133],
                markPoint: {
                    data: [{
                        type: 'max',
                        name: '最大值'
                    },{
                        type: 'min',
                        name: '最小值'
                    }]
                }
            },{
                name: '待付款',
                type: 'bar',
                data: [26, 59, 30, 84, 27, 77, 176, 1182, 487, 188, 60, 23],
                markPoint: {
                    data: [{
                        name: '年最高',
                        value: 1182,
                        xAxis: 7,
                        yAxis: 1182,
                        symbolSize: 18
                    },{
                        name: '年最低',
                        value: 23,
                        xAxis: 11,
                        yAxis: 3
                    }]
                },

            },{
                name: '已付款',
                type: 'bar',
                data: [26, 59, 60, 264, 287, 77, 176, 122, 247, 148, 60, 23],
                markPoint: {
                    data: [{
                        name: '年最高',
                        value: 172,
                        xAxis: 7,
                        yAxis: 172,
                        symbolSize: 18
                    },{
                        name: '年最低',
                        value: 23,
                        xAxis: 11,
                        yAxis: 3
                    }]
                },

            },{
                name: '待发货',
                type: 'bar',
                data: [26, 59, 80, 24, 87, 70, 175, 1072, 48, 18, 69, 63],
                markPoint: {
                    data: [{
                        name: '年最高',
                        value: 1072,
                        xAxis: 7,
                        yAxis: 1072,
                        symbolSize: 18
                    },{
                        name: '年最低',
                        value: 22,
                        xAxis: 11,
                        yAxis: 3
                    }]
                },
            }] */
        };

        myChart.setOption(option);
        //获取一年12个月份，每种类型订单的数量
        $.get('order/queryOrderTransAllYearByMonth').done(function (data) {
          /*  	console.info(data);
           	var allOdrCntArr = sortData(data.allOdrCntList);
           	var noPaidOdrCntArr = sortData(data.noPaidOdrCntList);
           	var paidOdrCntArr = sortData(data.paidOdrCntList);
           	var delieverOdrCntArr = sortData(data.delieverOdrCntList);
           	var recieveOdrCntArr = sortData(data.recieveOdrCntList);
        	var commentOdrCntArr = sortData(data.commentOdrCntList); */
           	
               // 填入数据
           	myChart.setOption({
           		series: [{
                    name: '所有订单',
                    type: 'bar',
                    data: data.allOdrCntList/* ,
                    markPoint: {
                        data: [{
                            type: 'max',
                            name: '最大值'
                        },{
                            type: 'min',
                            name: '最小值'
                        }]
                      } */
                	},{
	                    name: '待付款',
	                    type: 'bar',
	                    data: data.noPaidOdrCntList/* ,
	                    markPoint: {
	                        data: [{
	                            name: '年最高',
	                            value: noPaidOdrCntArr[noPaidOdrCntArr.length-1],
	                            xAxis: 7,
	                            yAxis: 172,
	                            symbolSize: 18
	                        },{
	                            name: '年最低',
	                            value: noPaidOdrCntArr[0],
	                            xAxis: 11,
	                            yAxis: 3
	                        }]
	                    } */
                	},{
                       name: '已付款',
                       type: 'bar',
                       data: data.paidOdrCntList/* ,
                       markPoint: {
                           data: [{
                               name: '年最高',
                               value: paidOdrCntArr[paidOdrCntArr.length-1],
                               xAxis: 7,
                               yAxis: 1182,
                               symbolSize: 18
                           },{
                               name: '年最低',
                               value: paidOdrCntArr[0],
                               xAxis: 11,
                               yAxis: 3
                           }]
                       } */
                	},{
                       name: '已发货',
                       type: 'bar',
                       data: data.delieverOdrCntList/* ,
                       markPoint: {
                           data: [{
                               name: '年最高',
                               value: delieverOdrCntArr[delieverOdrCntArr.length-1],
                               xAxis: 7,
                               yAxis: 1072,
                               symbolSize: 18
                           },{
                               name: '年最低',
                               value: delieverOdrCntArr[0],
                               xAxis: 11,
                               yAxis: 3
                           }]
                       } */
                	},{
                        name: '已收货',
                        type: 'bar',
                        data: data.recieveOdrCntList/* ,
                        markPoint: {
                            data: [{
                                name: '年最高',
                                value: recieveOdrCntArr[recieveOdrCntArr.length-1],
                                xAxis: 7,
                                yAxis: 1072,
                                symbolSize: 18
                            },{
                                name: '年最低',
                                value: recieveOdrCntArr[0],
                                xAxis: 11,
                                yAxis: 3
                            }]
                        } */
                 	},{
                       name: '已评价',
                       type: 'bar',
                       data: data.commentOdrCntList/* ,
                       markPoint: {
                           data: [{
                               name: '年最高',
                               value: commentOdrCntArr[commentOdrCntArr.length-1],
                               xAxis: 7,
                               yAxis: 1072,
                               symbolSize: 18
                           },{
                               name: '年最低',
                               value: commentOdrCntArr[0],
                               xAxis: 11,
                               yAxis: 3
                           }]
                       } */
                	}
                ]
             });
        });
    });
    function sortData(data){
    	var arr =data;
    	arr.sort(function (a, b) {
    	  return a-b;
    	}); 

    	return arr;
    }
   
</script>