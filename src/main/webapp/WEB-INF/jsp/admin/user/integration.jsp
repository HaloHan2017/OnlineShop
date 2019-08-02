<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<% String PATH=request.getContextPath(); %>
 <link href="${PATH }/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${PATH }/admin/css/style.css"/>       
        <link href="${PATH }/admin/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${PATH }/admin/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${PATH }/admin/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${PATH }/admin/js/jquery-1.9.1.min.js"></script>
        <script src="${PATH }/admin/assets/js/bootstrap.min.js"></script>
		<script src="${PATH }/admin/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${PATH }/admin/assets/js/jquery.dataTables.min.js"></script>
		<script src="${PATH }/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${PATH }/admin/assets/laydate/laydate.js" type="text/javascript"></script>
        
<title>积分管理</title>
</head>

<script type="text/javascript">
	$(function(){
		showData()
	});

	//判断参数是否为空，为空则显示空字符串
	function isNull(data){
		return data == null ? "" : data;
	}
	
	/*
	从数据库里查询并加入表格
	*/
	function showData(){
		
		 $('#userList').DataTable( {
			 	destroy:true,
			 	ajax: "searchUser.do",
		        columns: [
		        	{
		        		render: function ( data, type, row ) {
			        	    return '<td><label><input type="checkbox" name="delLine" class="ace"><span class="lbl"></span></label></td>';
			        	}
		        	},
		        	{ "data": "uid" },
		            { "data": "username" ,
		            	render: function ( data, type, row ) {
			        	    return isNull(data);
			        	}
		            },
		            { "data": "scores",
		            	render: function ( data, type, row ) {
		            		return '<td><a href="javascript:ovid()" onclick="integration_history('+data+')">'+data+'</a></td>';
			        	}	
		            },
		            { "data": "jjj",
		            	render:function (){
		            		return '<td> <a title="删除" href="javascript:;"  onclick="member_del(this,2)" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a></td>';
		            	}
		            }
		        ]
		    } );
		}
	
	//批量删除
	function delByGroup(){
		var uidGroup = [];
		$('input[name="delLine"]:checked').each(function(){
			//jquery选择器选择到uid那一串代码
			if($(this).parent().parent().next().html() != 'uid'){	//把'uid'字符去掉,只留uid数字
				uidGroup.push($(this).parent().parent().next().html());
			}
		});
		
		$.ajax({
			url:"delGroup.do",
			method:"post",
			data: {
				"uidGroup":uidGroup
			},
			dataType:"text",
			success:function(data){
				layer.msg('已删除!',{icon:1,time:1000});
				showData()
			}
		});
	}
	
</script>

<body>
<div class="margin clearfix">
 <div class="" id="Other_Management">
 
    <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" onclick="delByGroup()" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;批量删除</a>
       </span>
     </div>
     <div class="list_style">
     <table class="table table-striped table-bordered table-hover" id="userList">
     <thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80">用户ID</th>
				<th width="100">用户名</th>
				<th width="80">积分</th>
				<th width="250">操作</th>
			</tr>
		</thead>
	<tbody>
		
        </tbody>    
     </table>     
     </div>
     
 </div>
</div>
<!--积分-->
<div id="integration_history" style="display:none; padding:10px;">
 <table class="table table-striped table-bordered table-hover" id="integration_history_list" width="100%">
     <thead>
		 <tr>
				<th width="80">用户</th>
				<th width="100">产品名称</th>
				<th width="80">价格(元)</th>
				<th width="120">积分</th>   
                <th width="120">获得时间</th>              
			</tr>
		</thead>
	<tbody>
		<tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">华为 畅享5S 金色 移动联通电信4G手机 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>345</td>
        <td>232</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">乐视（Le）乐2Pro 32GB 金色 移动联通</a></td>
        <td>4566</td>
        <td>3455</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">华为 P9 plus 64GB 琥珀金 移动联通电信卡双待 </a></td>
        <td>231</td>
        <td>11</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">华为 P9 plus 64GB 琥珀金 移动联通电信 </a></td>
        <td>23</td>
        <td>12</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        </tbody>    
     </table>     

</div>
<!--浏览记录-->
<div id="Browse_history" style="display:none; padding:10px">
<table class="table table-striped table-bordered table-hover" id="Browse_history_list" width="100%">
     <thead>
		 <tr>
				<th width="80">用户</th>
				<th width="100">产品名称</th>
				<th width="80">价格(元)</th>
				<th width="120">浏览次数</th>   
                <th width="120">最新时间</th>              
			</tr>
		</thead>
	<tbody>
		<tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">华为 畅享5S 金色 移动联通电信4G手机 </a></td>
        <td>2565</td>
        <td>1234</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">荣耀7i 海岛蓝 移动4G手机 双卡双待 </a></td>
        <td>345</td>
        <td>232</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">乐视（Le）乐2Pro 32GB 金色 移动联通</a></td>
        <td>4566</td>
        <td>3455</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">华为 P9 plus 64GB 琥珀金 移动联通电信卡双待 </a></td>
        <td>231</td>
        <td>11</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">华为 P9 plus 64GB 琥珀金 移动联通电信 </a></td>
        <td>23</td>
        <td>12</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        </tbody>    
     </table>     


</div>

<!--购物记录-->
<div id="Order_history" style="display:none; padding:10px;">

<table class="table table-striped table-bordered table-hover" id="Order_history_list" width="100%">
     <thead>
		 <tr>
				<th width="80">用户</th>
				<th width="100">订单号</th>
				<th width="80">数量</th>
				<th width="120">交易状态</th>   
                <th width="120">交易时间</th>              
			</tr>
		</thead>
	<tbody>
		<tr>
        <td>花海天天</td>
        <td><a href="#">hd23342354534534 </a></td>
        <td>2</td>
        <td>已完成</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">hd23342354534534</a></td>
        <td>2</td>
        <td>待收货</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">hd23342354534534 </a></td>
        <td>3</td>
        <td>已完成</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        <tr>
        <td>花海天天</td>
        <td><a href="#">hd2335464544534534</a></td>
        <td>3</td>
        <td>交易失败</td>
        <td>2016-7-12 12:23:34</td>
        </tr>
        </tbody>    
     </table>     
</div>
</body>
</html>
<script>
jQuery(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,6]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			});
			


/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		var uid = $(obj).parents("tr").children().next().html();
		
		$.ajax({
			url:"delByUid.do",
			method:"post",
			data: {
				"uid":uid
			},
			success:function(data){
				layer.msg('已删除!',{icon:1,time:1000});
				showData();
			}
		});
	});
}
//积分浏览
function integration_history(id){
	layer.open({
    type: 1,
	title:'积分获取记录',
	area: ['800px','400px'],
	shadeClose: true,
	content: $('#integration_history'),
	})	
		$('#integration_history_list').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [{
	  "bSortable": false, 
	  "orderable":false, 
	  "aTargets": [0,1]
	 }]
});
	
	};
//浏览记录

function Browse_history(id){
	layer.open({
    type: 1,
	title:'浏览记录',
	area: ['800px','400px'],
	shadeClose: true,
	content: $('#Browse_history'),
	})	
$('#Browse_history_list').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [{
	  "bSortable": false, 
	  "orderable":false, 
	  "aTargets": [0,1]
	}]
});	
}


//购物记录
function Order_history(id){
	layer.open({
    type: 1,
	title:'购物记录',
	area: ['800px','400px'],
	shadeClose: true,
	content: $('#Order_history'),
	});	
		$('#Order_history_list').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [{
	  "bSortable": false, 
	  "orderable":false, 
	  "aTargets": [0,1]
	 }]
});		
}


</script>
