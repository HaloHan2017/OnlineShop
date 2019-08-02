<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String PATH=request.getContextPath(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="${PATH }/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${PATH }/admin/css/style.css"/>       
        <link href="${PATH }/admin/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${PATH }/admin/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${PATH }/admin/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${PATH }/admin/js/jquery-1.9.1.min.js"></script>
		<script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="${PATH }/admin/assets/laydate/laydate.js" type="text/javascript"></script>  
        <script src="${PATH }/admin/assets/js/bootstrap.min.js"></script>
		<script src="${PATH }/admin/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${PATH }/admin/assets/js/jquery.dataTables.min.js"></script>
		<script src="${PATH }/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
		<!-- 获取用户登录ip地址 -->
        <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<title>个人信息管理</title>
</head>

<script type="text/javascript">
	$(function(){
		getCurrentAdminInfo();
		showData();
		//alert(returnCitySN['cip'] + returnCitySN['cname']);
	});
	
	//获得当前登录的管理员信息
	function getCurrentAdminInfo(){
		$.get("getCurrentAdminInfo",function(data){
			$("#aphone").val(data.aphone);
			$("#aname").val(data.aname);
			$("#aid").html(data.aid);
			if(data.atype == 0){
				$("#atype").html('超级管理员');
			}else if(data.atype == 1){
				$("#atype").html('普通管理员');
			}else if(data.atype == 2){
				$("#atype").html('编辑管理员');
			}
		});
	}
	
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
	
	//展示管理员登录数据
	function showData(){
		 $('#adminLoginRecordList').DataTable( {
			 	destroy:true,
		        ajax: "searchadminLoginRecord",
		        columns: [
		        	{"data":"aid"},
		        	{"data":"atype",
		        		render: function ( data, type, row ) {
		        			if(data == 0){
		        				return '超级管理员';
		        			}else if(data == 1){
		        				return '普通管理员';
		        			}else if(data == 2){
		        				return '编辑管理员';
		        			}
			        	}
		        	},
		        	{"data":"loginLocation"},
		        	{"data":"aname"},
		        	{"data":"loginIp"},
		        	{"data":"action",
		        		render: function ( data, type, row ) {
		        			if(data == 0){
		        				return '登录';
		        			}else if(data == 1){
		        				return '下线';
		        			}else if(data == 2){
		        				return '修改密码';
		        			}
			        	}
		        	},
		        	{"data":"loginDate",
		        		render: function ( data, type, row ) {
		        			var fmt = SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		        	        return fmt.format(data);
		        		}
		        	}
		        ]
		    } );
	}
</script>

<body>
<div class="clearfix">
 <div class="admin_info_style">
   <div class="admin_modify_style" id="Personal">
     <div class="type_title">管理员信息 </div>
      <div class="xinxi">
      <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">管理员ID： </label>
          <div class="col-sm-9"><span id="aid"></span>
          </div>
       </div>
        <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户名： </label>
          <div class="col-sm-9"><input id="aname" type="text" name="用户名" class="col-xs-7 text_info" disabled="disabled">
          &nbsp;&nbsp;&nbsp;<a href="javascript:ovid()" onclick="change_Password()" class="btn btn-warning btn-xs">修改密码</a></div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">移动电话： </label>
          <div class="col-sm-9"><input id="aphone" type="text" name="移动电话" id="website-title" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
           <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">权限： </label>
          <div class="col-sm-9" > <span id="atype"></span></div>
          </div>
           <div class="Button_operation clearfix"> 
				<button onclick="modify();" class="btn btn-danger radius" type="submit">修改信息</button>				
				<button onclick="save_info();" class="btn btn-success radius" type="button">保存修改</button>              
			</div>
            </div>
    </div>
    <div class="recording_style">
    <div class="type_title">管理员登陆记录 </div>
    <div class="recording_list">
     <table class="table table-border table-bordered table-bg table-hover table-sort" id="adminLoginRecordList">
    <thead>
      <tr class="text-c">
        <th width="80">管理员ID</th>
        <th width="100">类型</th>
        <th width="17%">登陆地点</th>
        <th width="10%">用户名</th>
        <th width="120">客户端IP</th>
        <th>操作</th>
        <th width="150">时间</th>
      </tr>
    </thead>
    <tbody>
     
    </tbody>
  </table>
    </div>
    </div>
 </div>
</div>
 <!--修改密码样式-->
         <div class="change_Pass_style" id="change_Pass">
            <ul class="xg_style">
             <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class="" id="password"></li>
             <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class="" id="Nes_pas"></li>
             <li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>
              
            </ul>
     <!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
         </div>
</body>
</html>
<script>

 //按钮点击事件
function modify(){
	 $('.text_info').attr("disabled", false);
	 $('.text_info').addClass("add");
	  $('#Personal').find('.xinxi').addClass("hover");
	  $('#Personal').find('.btn-success').css({'display':'block'});
	};
	function save_info(){
	    var num=0;
		 var str="";
     $(".xinxi input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  
        	  var aid = $("#aid").html();
        	  var aphone = $("#aphone").val();
        	  var aname = $("#aname").val();
        	  
        	  $.post("modifyAdminInfo",{
        		  "aid":aid,
        		  "aphone":aphone,
        		  "aname":aname
        	  },function(data){
        		  layer.alert(data.msg,{
                      title: '提示框',				
       			   icon:1,			   		
       			  });
       			  $('#Personal').find('.xinxi').removeClass("hover");
       			  $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
       			  $('#Personal').find('.btn-success').css({'display':'none'});
       			   layer.close(index);
        	  });
		  }		  		
	};	
 //初始化宽度、高度    
    $(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
  });
  //修改密码
  function change_Password(){
	   layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	yes:function(index, layero){		
		   if ($("#password").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  if ($("#Nes_pas").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		   
		  if ($("#c_mew_pas").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }
		    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{
			//获取地址和ip
			var cip = returnCitySN['cip'];
			var cname = returnCitySN['cname'];
			var originPwd = $("#password").val();
			var aid = $("#aid").html();
			var pwd = $("#Nes_pas").val();
			$.post("modifyAdminPassword",{
				"originPwd":originPwd,
				"aid":aid,
				"apwd":pwd,
				"cip":cip,
				"address":cname
			},function(data){
				if(data.code == 3){
					layer.alert(data.msg,{
			               title: '提示框',				
							icon:2,		
					}); 
					return;
				}else{
					layer.alert(data.msg,{
			               title: '提示框',				
							icon:1,		
					}); 
					layer.close(index);
					showData();
				}
			});
			
			        
		  }	 
	}
    });
	  }
</script>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
});</script>
