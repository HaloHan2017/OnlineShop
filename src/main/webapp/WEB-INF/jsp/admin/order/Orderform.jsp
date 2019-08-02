<%@page import="com.yc.olshop.utils.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <% String PATH=request.getContextPath(); %>
<!DOCTYPE html >
<html >
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
        <script type="text/javascript" src="${PATH }/admin/js/H-ui.js"></script>
        <script src="${PATH }/admin/assets/js/typeahead-bs2.min.js"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript"></script>
        <script src="${PATH }/admin/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${PATH }/admin/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="${PATH }/admin/js/lrtk.js" type="text/javascript"></script>
        <script src="${PATH }/admin/js/myutil.js" type="text/javascript"></script>
        <title>订单管理</title>
    </head>
    
    <body>
        <div class="margin clearfix">
            <div class="cover_style" id="cover_style">
                <!-- 购物产品比例 -->
                <div class="top_style Order_form" id="Order_form_style">
                    <div class="type_title">购物产品比例
                        <div class="btn_style">
                            <a href="javascript:void()" class="xianshi_btn Statistic_btn">显示</a>
                            <a href="javascript:void()" class="yingchan_btn Statistic_btn b_n_btn">隐藏</a>
                        </div>
                    </div>
                    <div class="hide_style clearfix" id="proportionDiv" style="display:none;">
                      <c:forEach items="${percentList }" varStatus="i" var="per">
                        <div class="proportion"> 
                        	<div class="easy-pie-chart percentage" data-percent="${per.prodSales}" 
                        		data-color="randomColor(i)">
                        		<span class="percent">${per.prodSales}</span>%
                        	</div>
                        	<span class="name">${per.cname}</span>
                        </div>
                       </c:forEach>
                    </div>
                </div>
                <!--内容-->
                <div class="centent_style" id="centent_style" >
                    <div id="covar_list" class="order_list" width="100%;">
                        <div id="scrollsidebar" class="left_Treeview">
                            <div class="show_btn" id="rightArrow">
                                <span></span>
                            </div>
                            <div class="widget-box side_content">
                                <div class="side_title">
                                    <a title="隐藏" class="close_btn">
                                        <span></span>
                                    </a>
                                </div>
                                <div class="side_list">
                                    <div class="widget-header header-color-green2">
                                        <h4 class="lighter smaller">订单类型分类</h4></div>
                                    <div class="widget-body">
                                        <ul class="b_P_Sort_list">
                                            <li>
                                                <i class="orange  fa fa-reorder"></i>
                                                <a href="javascript:void(0);"
                                                	onClick="reQueryOrdersByStatus('全部')">
                                                	全部订单(${allOrdersNum })
                                                </a>
                                            </li>
                                           <c:forEach items="${odrNumMapList }" var="omap">
                                           	<li>
                                                <i class="fa fa-sticky-note pink "></i>
                                                <a href="javascript:void(0);" 
                                                	onClick="reQueryOrdersByStatus('${omap['odrStatus'] }')">
                                                	${omap['odrStatus'] }(${omap['odrCnt'] })
                                                </a>
                                            </li>
                                           </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--左侧样式-->
                        <div class="list_right_style">
                            <div class="search_style">
                                <ul class="search_content clearfix">
                                	<form name="form" action="" method="">
	                                    <li>
	                                        <label class="l_f">订单编号</label>
	                                        <input name="oid" type="text" class="text_add"  value="" placeholder="订单编号" style=" width:200px"></li>
	                                    <li style="width:90px;">
	                                        <button type="button" class="btn_search" onclick="searchByOidOrTime()">
	                                            <i class="fa fa-search"></i>查询
	                                        </button>
	                                    </li>
                                    </form>
                                </ul>
                            </div>
                            <!--订单列表展示-->
                            <table class="table table-striped table-bordered table-hover" id="sample-table">
                                <thead>
                                    <tr>
                                        <!-- <th width="25px">
                                            <label>
                                                <input type="checkbox" class="ace">
                                                <span class="lbl"></span>
                                            </label>
                                        </th> -->
                                        <th width="100px">订单编号</th>
                                        <th width="150px">产品名称</th>
                                        <th width="60px">总价</th>
                                        <!-- <th width="100px">优惠</th> -->
                                        <th width="100px">订单时间</th>
                                        <!-- <th width="180px">所属类型</th> -->
                                        <th width="50px">数量</th>
                                        <th width="70px">状态</th>
                                        <th width="150px">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--发货-->
 		<div id="Delivery_stop" style=" display:none">
	        <div class="content_style">
	            <div class="form-group">
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">订单号</label>
	                
	            </div>
	        </div>
	    </div>
    </body>

</html>
<script>
	
	$(function() {
        $("#cover_style").fix({
            float: 'top',
            minStatue: false,
            skin: 'green',
            durationTime: false,
            window_height: 30,
            //设置浏览器与div的高度值差
            spacingw: 0,
            spacingh: 0,
            close_btn: '.yingchan_btn',
            show_btn: '.xianshi_btn',
            side_list: '.hide_style',
            widgetbox: '.top_style',
            close_btn_width: 60,
            da_height: '#centent_style,.left_Treeview,.list_right_style',
            side_title: '.b_n_btn',
            content: null,
            left_css: '.left_Treeview,.list_right_style'

        });
    });
	
	//查询 对应状态的订单
	function reQueryOrdersByStatus(status){
		var scode=0;
		if(status=='已支付'){
			scode=1;
		}else if(status=='已发货'){
			scode=2;
		}else if(status=='已收货'){
			scode=3;
		}else if(status=='已评价'){
			scode=4;
		}else if(status=='全部'){
			table.ajax.url('${PATH}/order/queryOrderList').load();//查询宣布订单
			return;
		}
		table.ajax.url('${PATH}/order/queryOrderList?scode='+scode).load();
	}
	var table;
	function getSaleConditionByCategory(){
		table=$('#sample-table').DataTable( {
	        "ajax": '${PATH}/order/queryOrderList',
	        "columns": [
                 { "data": "oid" },
                 { "data": "oitemList",
                	 "render": function ( data, type, full, meta ) {
                	   var len = data.length;
                	   var td='';
                	   $.each(data,function(index,item){
                		   var pimage=data[index].product.pimage;
                		   var pname=data[index].product.pname;
                		   var a = '<a href="#"><img width="80px"height="80px" src="${PATH}/'+pimage+'" '+
                		   		'title="'+pname+'"/></a>';
                		   if(index!=len-1){
                			   //不是最后一个商品图片，加上+
                			   a+='<i class="fa fa-plus"></i>';
                		   }
                		   td+=a;
                	   });
               	       return td;
               	     }	 
                 },
                 { "data": "totalMoney" },
                 { "data": "ordertime",
                	 "render": function ( data, type, full, meta ) {
               	       return GetDate(data);
               	     }
                 },
                 { "data": "prodCount" },
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
                 },{"render": function (data,type,full) {
	            	 	var oid = '\''+full.oid+'\'';
	            	 	var status = full.status;
	            	 	var td='';
	            	 	if(status==1){
	            	 		//若是待发货，则显示该”发货按钮“按钮
	            	 		var a='<a onClick="deliveryAndReturnMoneyOrder(this,'+oid+',1)" href="javascript:void(0);"'
			         		 +'title="发货" class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>'
	            	 		td+=a;
	            	 	}else{}
		 	        	td +='<a title="订单详细" href="${PATH }/order/orderDetails?oid='+full.oid+'"'
		                  +'	class="btn btn-xs btn-info Refund_detailed"><i class="fa fa-list bigger-120"></i></a>'
		                  +'<a title="删除" href="javascript:void(0);" onclick="Order_form_del(this,'+oid+')"'
		                  +'	class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>';
		         		return td;
	        	  	}
	             }
             ],
             "aLengthMenu": [5, 10, 20],
             "bAutoWidth":true
	    });
	} 
	//条件 查询
	function searchByOidOrTime(){
		var oid=$("input[name='oid']").val();
		//var pname=$("input[name='pname']").val(); +'&pname='+pname
		table.ajax.url('${PATH}/order/queryOrderList?oid='+oid).load();
	}
	
    //左侧显示隐藏
    $(function() {
    	//查询 所有 商品类别 的 销售 所占比例（数量/总销量）
    	getSaleConditionByCategory();
        $("#covar_list").fix({
            float: 'left',
            minStatue: false,
            skin: false,
            //durationTime :false,
            spacingw: 50,
            //设置隐藏时的距离
            spacingh: 270,
            //设置显示时间距
            stylewidth: '220',
            close_btn: '.close_btn',
            show_btn: '.show_btn',
            side_list: '.side_list',
            content: '.side_content',
            widgetbox: '.widget-box',
            da_height: null,
            table_menu: '.list_right_style'
        });
        
        
    });
    //时间选择
    /*订单-删除*/
    function Order_form_del(obj, oid) {
        layer.confirm('确认要删除吗？',
        function(index){
        	$.post(
       			'${PATH}/order/del',
       			{oid:oid},
       			function(data){
       				if(data.code!=1){
        				//删除失败
        				layer.alert(data.msg, {
        	                icon: 2,
        	                time: 1000
        	            });
        			}else{
        				//success
        	            layer.msg('已删除!', {
        	                icon: 1,
        	                time: 1000
        	            });
        	        	//刷新页面
               	        $('#sample-table').DataTable().ajax.reload();
        	            //$(obj).parents("tr").remove();
        				//query();
        			}
       			},"JSON"
        	);
        });
    }
    /**发货**/
    function deliveryAndReturnMoneyOrder(obj, oid,num) {
    	$.post(
   			'${PATH}/order/deliverAndReturnMoney',
      			{oid:oid,flag:num},
      			function(data){
      				if(data.code!=1){
	       				//删除失败
	       				layer.alert(data.msg,{
	       	                icon: 2,
	       	                time: 1000
	       	            });
	       			}else{
	       				//success
	       	            layer.msg('发货成功!', {
	       	                icon: 6,
	       	                time: 1000
	       	            });
	       				//刷新页面
               	        $('#sample-table').DataTable().ajax.reload();
	       				//location.href='${PATH}/order/querySaleByCategory';
	       			}
      		 },"JSON"		
    	);	
    };
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Order_form,.order_detailed').on('click',
    function() {
        var cname = $(this).attr("title");
        var chref = $(this).attr("href");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe').html(cname);
        parent.$('#iframe').attr("src", chref).ready();;
        parent.$('#parentIframe').css("display", "inline-block");
        parent.$('.Current_page').attr({
            "name": herf,
            "href": "javascript:void(0)"
        }).css({
            "color": "#4c8fbd",
            "cursor": "pointer"
        });
        //parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
        parent.layer.close(index);

    });

    //初始化宽度、高度  
    var heights = $(".top_style").outerHeight()+47;
    $(".centent_style").height($(window).height() - heights);
    $(".page_right_style").width($(window).width() - 220);
    $(".left_Treeview,.list_right_style").height($(window).height() - heights - 2);
    $(".list_right_style").width($(window).width() - 250);
    //当文档窗口发生改变时 触发  
    $(window).resize(function() {
        $(".centent_style").height($(window).height() - heights);
        $(".page_right_style").width($(window).width() - 220);
        $(".left_Treeview,.list_right_style").height($(window).height() - heights - 2);
        $(".list_right_style").width($(window).width() - 250);
    })
    //比例
    var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
    $('.easy-pie-chart.percentage').each(function(index) {
        $(this).easyPieChart({
            barColor: randomColor(index),
            trackColor: '#EEEEEE',
            scaleColor: false,
            lineCap: 'butt',
            lineWidth: 10,
            animate: oldie ? false: 1000,
            size: 100
        }).css('color', $(this).data('color'));
    });

    $('[data-rel=tooltip]').tooltip();
    $('[data-rel=popover]').popover({
        html: true
    });
</script>
<script>
	//订单列表
   /*  jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],
            //默认第几个排序
            "bStateSave": true,
            //状态保存
            "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {
                "orderable": false,
                "aTargets": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
            } // 制定列不参与排序
            ]
        });

        $('table th input:checkbox').on('click',
        function() {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox').each(function() {
                this.checked = that.checked;
                $(this).closest('tr').toggleClass('selected');
            });
        });
    }); */
</script>