<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String PATH=request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${PATH }/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${PATH }/admin/css/style.css"/>       
        <link href="${PATH }/admin/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${PATH }/admin/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${PATH }/admin/assets/css/font-awesome.min.css" />
		
		<script src="${PATH }/admin/js/jquery-1.9.1.min.js"></script>

		
		<script src="${PATH }/admin/assets/js/bootstrap.min.js"></script>
		<script src="${PATH }/admin/assets/js/typeahead-bs2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="${PATH }/admin/assets/js/jquery.dataTables.min.js"></script>
		<script src="${PATH }/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="${PATH }/admin/js/H-ui.js"></script> 
        <script type="text/javascript" src="${PATH }/admin/js/H-ui.admin.js"></script> 
        <script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="${PATH }/admin/assets/laydate/laydate.js" type="text/javascript"></script>
<title>用户列表</title>
</head>

<script type="text/javascript">

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
		        	{"data":"uid",
		        		render: function ( data, type, row ) {
		        	       return "<td><label><input type='checkbox' class='ace' name='delLine'><span class='lbl'></span></label></td>";
		        	  	}	
		        	},
		        	{ "data": "uid" },
		        	//render自定义的东西
		            { "data": "head" ,
		        	  render: function ( data, type, row ) {
		        	       return "<img height='60px' width='60px' src="+data+">";
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
			        	          "<a onClick='member_stop(this,"+'10001'+")'  href='javascript:;' title='停用'  class='btn btn-xs btn-success'><i class='icon-ok bigger-120'></i></a> "+ 
			        	          "<a title='删除' href='javascript:void(0);'  onclick='member_del(this,1)' class='btn btn-xs btn-warning' ><i class='icon-trash  bigger-120'></i></a>"+
			        	          "</td>";
		            		}else{
		            			return "<td class='td-manage'>"+
	            			 	"<input type='hidden' class='td-manage' >"+
	            			 	"<input type='hidden' id='state' value="+data+" >"+
		        	          	"<a style='text-decoration:none' class='btn btn-xs' onClick='member_start(this,id)' href='javascript:;' title='启用'><i class='icon-ok bigger-120'></i></a> "+ 
		        	          	"<a title='删除' href='javascript:void(0);'  onclick='member_del(this,1)' class='btn btn-xs btn-warning' ><i class='icon-trash  bigger-120'></i></a>"+
		        	          	"</td>";
		            		}
		        	  	}		
		            }
		        ]
		    } );
	}
	
	//初始化表格
	$(document).ready(function(){
		showData()	
	});

	
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
	
	//清空用户信息
	function clearInfo(){
		$("#add_menber_style").children().remove();
		var htmlstr = '<ul class=" page-content">'+
		     '<li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="" name="username" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
		     '<li><label class="label_name">头像：</label>'+
			    ' <span class="add_name">'+
			     	'<img height="60px" width="60px" alt="点击上传图片" src="head/uploading.jpg" id="ti" onclick="file.click()">'+
					'<input type="hidden" name="titleimgs" id="titleImgs">'+
					'<input type="file" name="file" style="display: none;" id="file" onchange="upload()">'+
			     '</span><div class="prompt r_f"></div>'+
		     '</li>'+
		     '<li><label class="label_name">真实姓名：</label><span class="add_name"><input name="name" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
		     '<li><label class="label_name"></label><span class="add_name"><input name="" type="hidden"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
		     '<li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">'+
		     '<label><input name="sex" type="radio" checked="checked" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;'+
		     '<label><input name="sex" type="radio" class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;'+
		     '</span>'+
		     '<div class="prompt r_f"></div>'+
		     '</li>'+
		    ' <li><label class="label_name">移动电话：</label><span class="add_name"><input name="phone" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
		    ' <li><label class="label_name">电子邮箱：</label><span class="add_name"><input name="email" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
		    ' <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">'+
		    ' <label><input name="state" type="radio" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;'+
		     '<label><input name="state"type="radio" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>'+
		    '</ul>';
		$("#add_menber_style").append(htmlstr);
	}
	
	function isHeadNull(head){
		return head == null ? "/head/uploading.jpg" : head;
	}
	
	//编辑用户，从后台拿数据
	function editUser(data){
		var uid = $(data).parents("tr").children().next().html();
		$.ajax({
			url:"editUser.do",
			method:"post",
			data: {
				"uid":uid
			},
			dataType:"json",
			success:function(data){
				$("#add_menber_style").children().remove();
				
				//调用之前写的isNull方法将数据插入前端代码中
				var htmlstr = '<ul class=" page-content">'+
			     '<li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="'+ isNull(data.username) +'" name="username" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
			     '<li><label class="label_name">头像：</label>'+
				    ' <span class="add_name">'+
				     	'<img height="60px" width="60px" alt="点击上传图片" src="'+ isHeadNull(data.head) +'" id="ti" onclick="file.click()">'+
						'<input type="hidden" name="titleimgs" id="titleImgs">'+
						'<input type="file" name="file" style="display: none;" id="file" onchange="upload()">'+
				     '</span><div class="prompt r_f"></div>'+
			     '</li>'+
			     '<li><label class="label_name">真实姓名：</label><span class="add_name"><input name="name" type="text" value="'+ isNull(data.name) +'"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
			     '<li><label class="label_name"></label><span class="add_name"><input name="" type="hidden"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
			     '<li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name" id="checkSex">';
			     
			     //性别选择
				if(isNull(data.sex) == '女'){
			    	htmlstr +='<label><input name="sex" type="radio" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;'+
				     '<label><input name="sex" type="radio" checked="checked" class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;';
			    }else{
			    	htmlstr += '<label><input name="sex" type="radio" checked="checked" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;'+
				     '<label><input name="sex" type="radio" class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;';
			    }
			     
			    htmlstr += '</span>'+
			     '<div class="prompt r_f"></div>'+
			     '</li>'+
			    ' <li><label class="label_name">移动电话：</label><span class="add_name"><input name="phone" type="text" value="'+ isNull(data.phone) +'"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
			    ' <li><label class="label_name">电子邮箱：</label><span class="add_name"><input name="email" type="text" value="'+ isNull(data.email) +'"  class="text_add"/></span><div class="prompt r_f"></div></li>'+
			    ' <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name" id="checkState">';
			    
			    //状态选择
			    if(isNull(data.state) == '0'){
			    	htmlstr += ' <label><input name="state" type="radio" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;'+
				     '<label><input name="state" type="radio" checked="checked" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>';
			    }else{
			    	htmlstr +=  ' <label><input name="state" type="radio" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;'+
				     '<label><input name="state" type="radio" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>';
			    }
			    
			    htmlstr += '</ul>';
			    
			    
				$("#add_menber_style").append(htmlstr);
			}
		});
	}
</script>


<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
    <div class="search_style">
     
      <!-- <ul class="search_content clearfix">
       <li><label class="l_f">会员名称</label><input name="" type="text"  class="text_add" id="userName" placeholder="输入会员名称、电话、邮箱"  style=" width:400px"/></li>
       <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="button" class="btn_search" onclick="search()"><i class="icon-search"></i>查询</button></li>
      </ul> -->
    </div>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:clearInfo()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>
        <a href="javascript:delByGroup()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
       </span>
       <!-- <span class="r_f">共：<b>2345</b>条</span> -->
     </div>
     <!---->
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="userList" >
		<thead>
		 <tr>
				<th width="25">
					<label>
						<input type="checkbox" class="ace"  name="delLine">
							<span class="lbl"></span>
					</label>
				</th>
				<th width="100">uid</th>
				<th width="40">头像</th>
				<th width="120">用户名</th>
				<th width="100">性别</th>
				<th width="120">手机</th>
				<th width="150">邮箱</th>
				<th width="180">加入时间</th>
                <th width="120">等级</th>
				<th width="70">状态</th>                
				<th width="250">操作</th>
			</tr>
		</thead>
	    <tbody id="content">
		
	          
      	</tbody>
	</table>
   </div>
  </div>
 </div>
</div>
<!--添加用户图层-->
<form method="post" id="ff">
<input type="hidden" name="id" id="id">
	<div class="add_menber" id="add_menber_style" style="display:none">
	    <ul class=" page-content">
	     <li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="" name="username" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
		     <li><label class="label_name">头像：</label>
			     <span class="add_name">
			     	<img height="100px" alt="点击上传图片" src="head/uploading.jpg" id="ti" onclick="file.click()">
					<input type="hidden" name="titleimgs" id="titleImgs">
					<input type="file" name="headFile" style="display: none;" id="headFile" onchange="upload()">
			     </span><div class="prompt r_f"></div>
		     </li>
	     
	     <li><label class="label_name">真实姓名：</label><span class="add_name"><input name="name" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name"></label><span class="add_name"><input name="" type="hidden"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
	     <label><input name="sex" type="radio" checked="checked" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
	     <label><input name="sex" type="radio" class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
	     </span>
	     <div class="prompt r_f"></div>
	     </li>
	     <li><label class="label_name">移动电话：</label><span class="add_name"><input name="phone" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">电子邮箱：</label><span class="add_name"><input name="email" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	     <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
	     <label><input name="state" type="radio" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
	     <label><input name="state"type="radio" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>
	    </ul>
	 </div>
 </form>
</body>
</html>
<script>
jQuery(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
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
			})
			
		
	function upload(){
		$.ajax({
			url: "uploadHeadFile.do",
			type: 'POST',
			cache: false,
			data: new FormData($('#ff')[0]),
			processData: false,
			contentType: false,
			dataType: "json",
			success: function(data){
				if(data.code == 1){
					$("#ti").attr("src",data.data);
					$("#titleImgs").val(data.data);
					layer.msg('上传头像成功!',{icon: 6,time:1000});
				}else{
					layer.msg('上传头像失败!',{icon: 5,time:1000});
				}
			}
		});
	}
	
	//新增用户或者修改
	function addOrEdit(map){
		$.ajax({
			url:"addOrEdit.do",
			method:"post",
			data: {
				"map":map
			},
			dataType:"json",
			success:function(data){
				return data.code;
			}
		});
	}
	
	/**
	 * Map转json
	 * @param m
	 * @returns String
	 */
	function MapTOJson(m) {
	    var str = '{';
	    var i = 1;
	    m.forEach(function (item, key, mapObj) {
	    	if(mapObj.size == i){
	    		str += '"'+ key+'":"'+ item + '"';
	    	}else{
	    		str += '"'+ key+'":"'+ item + '",';
	    	}
	    	i++;
	    });
	    str +='}';
	    //console.log(str);
	    return str;
	}
	
	function save(){
		$('#ff').form('submit',{
			contentType: 'text/json,charset=utf-8',
			url: "addOrEdit.do",
			onSubmit: function(){
				
			},
			success:function(data){
				alert(1);
			}
		});
	}
	
/*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加用户',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
		 //设立集合存数据
		 var map = new Map();
     	$(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
         } 
          
          //将文本数据存入map集合
         map.set($(this).attr("name"),$(this).val());
          
		 });
     	
     	 //获取单选框的值
     	$(".add_menber input[type$='radio']:checked").each(function(n){
     		//如果被选中
     		//性别
     		if($(this).attr("name") == 'sex'){
     			map.set($(this).attr("name"),$(this).parent().text());
     		}
     		//状态
     		if($(this).attr("name") == 'state'){
     			if($(this).parent().text() == "开启"){
     				map.set($(this).attr("name"),1);
     			}else{
     				map.set($(this).attr("name"),0);
     			}
     		}
     	});
     	
     	 console.log(map);
     	 
     	//设置头像
     	if($("#ti").attr("src") == 'head/uploading.jpg'){
     		map.set("head",null);
     	}else{
     		map.set("head",$("#ti").attr("src"));
     	}
     	
     	var mapJson = MapTOJson(map);
     	
     	
     	
     	$.ajax({
			url:"addOrEdit.do",
			method:"post",
			data: {"mapJson":mapJson},
			dataType:"json",
			success:function(data){
				layer.alert('添加成功！',{
		               title: '提示框',				
					icon:1,		
					  });
					   layer.close(index);
					   showData();
			}
		});
	     	
		}
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
		var uid = $(obj).parents("tr").children().next().html();
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
				$(obj).parents("tr").find(".td-manage").parent().prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
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
		var uid = $(obj).parents("tr").children().next().html();
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
				$(obj).parents("tr").find(".td-manage").parent().prepend('<a onClick="member_stop(this,'+"10001"+')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a> ');
				$(obj).parents("tr").find(".td-status").parent().html('<input type="hidden" class="td-status"><input type="hidden" id="state" value='+data[index-1]+' ><span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			}
		});
		
		
	});
}
/*用户-编辑*/
function member_edit(id,data){
		editUser(data);
	
	  layer.open({
        type: 1,
        title: '修改用户信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
			var num=0;
			 var str="";
			 //设立集合存数据
			 var map = new Map();
	     	$(".add_menber input[type$='text']").each(function(n){
	          if($(this).val()=="")
	          {
				   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
	                title: '提示框',				
					icon:0,								
	          }); 
			    num++;
	            return false;            
	         } 
	          
	          //将文本数据存入map集合
	         map.set($(this).attr("name"),$(this).val());
	          
			 });
	     	
	     	 //获取单选框的值
	     	$(".add_menber input[type$='radio']:checked").each(function(n){
	     		//如果被选中
	     		//性别
	     		if($(this).attr("name") == 'sex'){
	     			map.set($(this).attr("name"),$(this).parent().text());
	     		}
	     		//状态
	     		if($(this).attr("name") == 'state'){
	     			if($(this).parent().text() == "开启"){
	     				map.set($(this).attr("name"),1);
	     			}else{
	     				map.set($(this).attr("name"),0);
	     			}
	     		}
	     	});
	     	
	     	//设置头像
	     	if($("#ti").attr("src") == 'head/uploading.jpg'){
	     		map.set("head",null);
	     	}else{
	     		map.set("head",$("#ti").attr("src"));
	     	}
	     	
	     	map.set("uid",$(data).parents("tr").children().next().html());
	     	
	     	var mapJson = MapTOJson(map);
	     	
	     	$.ajax({
				url:"addOrEdit.do",
				method:"post",
				data: {"mapJson":mapJson},
				dataType:"json",
				success:function(data){
					layer.alert('添加成功！',{
			               title: '提示框',				
						icon:1,		
						  });
						   layer.close(index);
						   showData();
				}
			});     				
		}
    });
}
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
laydate({
    elem: '#start',
    event: 'focus' 
});

</script>