<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link href="${PATH }/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${PATH }/admin/css/style.css"/>       
        <link href="${PATH }/admin/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${PATH }/admin/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${PATH }/admin/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${PATH }/admin/assets/js/jquery.min.js"></script>
		<script src="${PATH }/admin/assets/js/typeahead-bs2.min.js"></script>   
        <script src="${PATH }/admin/js/lrtk.js" type="text/javascript" ></script>		
		<script src="${PATH }/admin/assets/js/jquery.dataTables.min.js"></script>
		<script src="${PATH }/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${PATH }/admin/assets/dist/echarts.js"></script>
	 	<script src="${PATH }/admin/assets/dist/chart/pie.js"></script>
	 	<script src="${PATH }/admin/assets/dist/chart/funnel.js"></script>
	 	
	 	
	 	
<title>会员等级</title>
</head>

<script type="text/javascript">
	$(function(){
		showData('全部')
	});

	//时间日期格式转换
	function SimpleDateFormat(pattern){
		var fmt = new Object();
		fmt.pattern = pattern;
		
		fmt.parse = function(source){
			try{
				return new Date(source);
			}catch(e){
				console.log("字符串 "+source+" 转时间格式失败！");
				return null;
			}
		};
		
		fmt.format = function(date){
			if(typeof(date) == "undefined" || date == null || date==""){
				return "";
			}
			
			try{
				date = new Date(date);
			}catch(e){
				console.log("时间 "+date+" 格式化失败！");
				return "";
			}
			
			var strTime = this.pattern;//时间表达式的正则
			
		    var o = {
		            "M+": date.getMonth() + 1, //月份 
		            "d+": date.getDate(), //日 
		            "H+": date.getHours(), //小时 
		            "m+": date.getMinutes(), //分 
		            "s+": date.getSeconds(), //秒 
		            "q+": Math.floor((date.getMonth()+3) / 3), //季度 
		            "S": date.getMilliseconds() //毫秒 
		        };
		    
		        if (/(y+)/.test(strTime)){
		        	strTime = strTime
		        		.replace(RegExp.$1, (date.getFullYear() + "")
		        		.substr(4 - RegExp.$1.length));
		        } 
		        for (var k in o){
		        	if (new RegExp("(" + k + ")").test(strTime)){
		        		strTime = strTime.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));	
		        	}
		        }
		        
		        return strTime;
		};
		return fmt;
}

	function isHeadNull(head){
		return head == null ? "/head/uploading.jpg" : head;
	}
	
	//判断参数是否为空，为空则显示空字符串
	function isNull(data){
		return data == null ? "" : data;
	}
	/*
	从数据库里查询并加入表格
	*/
	function showData(data){
		 var level;
		//全部则查询所有
		if(data == '全部'){
			level = 'all';
		}else{
			level = data;
		}
		$("#levelTitle").html(data+"等级列表");
		 $('#userList').DataTable( {
			 	destroy:true,
		        ajax: "showByGroup.do?level="+level,
		        columns: [
		        	{ "data": "uid" },
		        	//render自定义的东西
		            { "data": "head" ,
		        	  render: function ( data, type, row ) {
		        	       return "<img width='60px' hieght='60px' src="+data+">";
		        	  }
		            },
		            { "data": "username" ,
		            	render: function ( data, type, row ) {
			        	    return isNull(data);
			        	}
		            },
		            { "data": "sex",
		            	render: function ( data, type, row ) {
			        	    return isNull(data);
			        	}	
		            },
		            { "data": "phone",
		            	render: function ( data, type, row ) {
			        	    return isNull(data);
			        	}	
		            },
		            { "data": "email" ,
		            	render: function ( data, type, row ) {
			        	    return isNull(data);
			        	}	
		            },
		            { "data": "regtime" ,
		            	render: function ( data, type, row ) {
		            		if(data == null){
		            			return "";
		            		}
		        	        var fmt = SimpleDateFormat("yyyy/MM/dd");
		        	        return fmt.format(data);
		        	  	}
		            },
		            { "data": "level" ,
		            	render: function ( data, type, row ) {
			        	    return isNull(data);
			        	}
		            },
		            { "data": "state" ,
		            	render: function ( data, type, row ) {
		            		if(data == 1){
		            			return "<td class='td-status'><input type='hidden' class='td-status'><span class='label label-success radius'>已启用</span></td>";
		            		}else{
		            			return "<td class='td-status'><input type='hidden' class='td-status'><span class='label label-defaunt radius'>已停用</span></td>";
		            		}
		        	        
		        	  	}	
		            },
		            { "data": "state",
		            	render: function ( data, type, row ) {
		            		if(data == 1){
		            			return "<td class='td-manage'>"+
		        			 	"<input type='hidden' class='td-manage' >"+
		        			 	"<input type='hidden' id='state' value="+data+" >"+
		        	          	"<a onClick='member_stop(this,10001)' href='javascript:;' title='停用'  class='btn btn-xs btn-success'><i class='fa fa-check bigger-120'></i></a>  "+        
		        	          	"<a title='删除' href='javascript:;'  onclick='member_del(this)' class='btn btn-xs btn-warning' ><i class='fa fa-trash  bigger-120'></i></a>"+ 
		        	          	"</td>";
		            		}else{
		            			return "<td class='td-manage'>"+
		        			 	"<input type='hidden' class='td-manage' >"+
		        			 	"<input type='hidden' id='state' value="+data+" >"+
		        	          	"<a style='text-decoration:none' class='btn btn-xs' onClick='member_start(this,id)' href='javascript:;' title='启用'><i class='fa fa-close bigger-120'></i></a>"+        
		        	          	"<a title='删除' href='javascript:;'  onclick='member_del(this)' class='btn btn-xs btn-warning' ><i class='fa fa-trash  bigger-120'></i></a>"+ 
		        	          	"</td>";
		            		}
		        	  	}		
		            }
		        ]
		    } );
		}

	//点击侧栏事件
	function showInfoByGroup(data){
		showData(data);
	}
</script>

<body>
<div class="grading_style"> 
<div id="category">
    <div id="scrollsidebar" class="left_Treeview">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="widget-box side_content" >
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
     <div class="side_list">
      <div class="widget-header header-color-green2">
          <h4 class="lighter smaller">会员等级</h4>
      </div>
      <div class="widget-body">
         <ul class="b_P_Sort_list">
             <li><i class="orange  fa fa-user-secret"></i><a href="#" onclick="showInfoByGroup('全部')">全部(${userCount.userCount })</a></li>
             <c:forEach items="${AllLevel }" var="a">
             	<li><i class="fa fa-diamond pink "></i> <a href="#" onclick="showInfoByGroup('${a.level }')" id="allLevel">${a.level }(${a.levelCount })</a></li>
           	</c:forEach>
           
           
            <!--  <li> <i class="fa fa-diamond pink "></i> <a href="#">铁牌会员()</a> </li>
             <li> <i class="fa fa-diamond pink "></i> <a href="#">铜牌会员()</a></li>
             <li><i class="fa fa-diamond pink "></i> <a href="#">银牌会员()</a></li>
             <li><i class="fa fa-diamond pink "></i> <a href="#">金牌会员()</a></li>
             <li> <i class="fa fa-diamond grey"></i> <a href="#">钻石会员()</a></li>
             <li> <i class="fa fa-diamond red"></i> <a href="#">红钻会员()</a></li>
             <li> <i class="fa fa-diamond blue"></i> <a href="#">蓝钻会员()</a></li>
             <li> <i class="fa fa-diamond grey"></i> <a href="#">黑钻()</a></li> -->
          </ul>
  </div>
  </div>
  </div>  
  </div>
  <!--右侧样式-->
   <div class="page_right_style right_grading">
   <div class="Statistics_style" id="Statistic_pie">
     <div class="type_title">等级统计 
     <span class="top_show_btn Statistic_btn">显示</span> 
     <span class="Statistic_title Statistic_btn"><a title="隐藏" class="top_close_btn">隐藏</a></span>
     </div> 
      <div id="Statistics" class="Statistics"></div> 
      </div>
      <!--列表样式-->
      <div class="grading_list">
       <div class="type_title" id="levelTitle">全部会员等级列表</div>
         <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="userList">
		<thead>
		 <tr>
				<th width="140">uid</th>
				<th width="10">头像</th>
				<th width="180">用户名</th>
				<th width="140">性别</th>
				<th width="140">手机</th>
				<th width="150">邮箱</th>
				<th width="210">加入时间</th>
                <th width="120">等级</th>
				<th width="70">状态</th>                
				<th width="250">操作</th>
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
</body>
</html>
<script type="text/javascript"> 
$(function() { 
	$("#category").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:20,
		spacingh:240,
		set_scrollsidebar:'.right_grading',
	});
});
$(function() { 
	$("#Statistic_pie").fix({
		float : 'top',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:0,
		spacingh:0,
		close_btn:'.top_close_btn',
		show_btn:'.top_show_btn',
		side_list:'.Statistics',
		close_btn_width:80,
		side_title:'.Statistic_title',
	});
});
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+'#?='+id,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//获取当前列的uid
		var uid = $(obj).parents("tr").children().html();
		//获取状态值
		var state = $(obj).parents("tr").find("#state").val()
		$.ajax({
			url:"changeState.do",
			method:"post",
			data: {
				"uid":uid,
				"state":state
			},
			dataType:"text",
			success:function(data){
				var index = data.lastIndexOf("}");
				$(obj).parents("tr").find(".td-manage").parent().prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="fa fa-close bigger-120"></i></a>');
				$(obj).parents("tr").find(".td-status").parent().html('<input type="hidden" class="td-status"><input type="hidden" id="state" value='+data[index-1]+' ><span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			}
		});
	});
}
/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//获取当前列的uid
		var uid = $(obj).parents("tr").children().html();
		//获取状态值
		var state = $(obj).parents("tr").find("#state").val()
		$.ajax({
			url:"changeState.do",
			method:"post",
			data: {
				"uid":uid,
				"state":state
			},
			dataType:"text",
			success:function(data){
				var index = data.lastIndexOf("}");
				$(obj).parents("tr").find(".td-manage").parent().prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check  bigger-120"></i></a>');
				$(obj).parents("tr").find(".td-status").parent().html('<input type="hidden" class="td-status"><input type="hidden" id="state" value='+data[index-1]+' ><span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			}
		});
	});
}

function showAllLevel(){
	$.ajax({
		url:"showAllLevel.do",
		method:"post",
		dataType:"json",
		success:function(data){
			$(".b_P_Sort_list").empty();
			//总数量
			var allCount = 0;	
			//全部
			var htmlhead = "";
			//分类
			var htmlstr = "";
			for(var i=0; i < data.data.length;i++){
				var level = "'"+data.data[i].level+"'";
				var levelCount = data.data[i].levelCount;
				htmlstr += '<li><i class="fa fa-diamond pink "></i> <a href="#" onclick="showInfoByGroup('+level+')" id="allLevel">'+data.data[i].level+'('+levelCount+')</a></li>';
				allCount += data.data[i].levelCount ;
			}
			htmlhead = '<li><i class="orange  fa fa-user-secret"></i><a href="#" onclick="showInfoByGroup('+"'全部'"+')">全部('+allCount+')</a></li>';
			$(".b_P_Sort_list").append(htmlhead + htmlstr);
		}
	});
}

/*用户-删除*/
function member_del(obj){
	layer.confirm('确认要删除吗？',function(index){
		
		var uid = $(obj).parents("tr").children().html();
		
		$.ajax({
			url:"delByUid.do",
			method:"post",
			data: {
				"uid":uid
			},
			success:function(data){
				layer.msg('已删除!',{icon:1,time:1000});
				var group = $("#levelTitle").html().split("等级列表")[0];
				showAllLevel();
				showData(group);
			}
		});
	});
}
</script>
<script type="text/javascript">

	$(function(){
		/* var level = [];
    	var levelCount = [];
    	$('a[id="allLevel"]').each(function(){
			console.log($(this).html());
			//字符串拆分
			var string = $(this).html().split("(");
			level.push(string[0]);
			levelCount.push(string[1].split(")")[0]);
		}); */
    	
    	var map = new Map();
    	$('a[id="allLevel"]').each(function(){
			//字符串拆分
			var string = $(this).html().split("(");
			map.set(string[0],string[1].split(")")[0]);
		});
	});
	
	//返回map集合，设置参数和值
	function AllUserLevelCount(){
		var list = [];
    	$('a[id="allLevel"]').each(function(){
			//字符串拆分
			var string = $(this).html().split("(");
			var mode = {
					value:string[1].split(")")[0],
    				name:string[0]
			}
			list.push(mode);
		});
    	return list;
	}
	
	//返回普通的string数组，设置值
	function AllUserLevel(){
		var level = [];
    	$('a[id="allLevel"]').each(function(){
			//字符串拆分
			var string = $(this).html().split("(");
			level.push(string[0]);
		});
		return level;
	}

//初始化宽度、高度  
 $(".widget-box").height($(window).height()); 
 $(".page_right_style").width($(window).width()-220);
 //$(".table_menu_list").width($(window).width()-240);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height());
	 $(".page_right_style").width($(window).width()-220);
	 //$(".table_menu_list").width($(window).width()-240);
	}) 
/**************/
     require.config({
            paths: {
                echarts: './assets/dist'
            }
        });
        require(
            [
                'echarts',
				'echarts/theme/macarons',
                'echarts/chart/pie',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/funnel'
            ],
            function (ec,theme) {
                var myChart = ec.init(document.getElementById('Statistics'),theme);
			
			option = {
    title : {
        text: '用户等级统计',
        subtext: '实时更新最新等级',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        
        x : 'center',
        y : 'bottom',
        data:AllUserLevel()
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: false},
            dataView : {show: false, readOnly: true},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 6200
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'品牌数量',
            type:'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:AllUserLevelCount()
        }
    ]
};
   myChart.setOption(option);
			}
);
        
       
</script>
<script type="text/javascript">
$(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,7,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});
</script>