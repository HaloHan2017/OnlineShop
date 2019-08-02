<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
	<!-- 引入links.jsp -->
	<%@ include file="common/links.jsp" %>

</head>

<body>

	<!-- 引入header.jsp -->
	<%@ include file="common/header.jsp" %>
    
	<!--=============================================
	=            breadcrumb area         =
	=============================================-->
	
	<div class="breadcrumb-area pt-15 pb-15">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!--=======  breadcrumb container  =======-->
					
					<div class="breadcrumb-container">
						<nav>
							<ul>
								<li class="parent-page"><a href="index">Home</a></li>
								<li>Register</li>
							</ul>
						</nav>
					</div>
					
					<!--=======  End of breadcrumb container  =======-->
				</div>
			</div>
		</div>
	</div>
	
    <!--=====  End of breadcrumb area  ======-->
    
    <!--=============================================
    =            Login Register page content         =
    =============================================-->

    <div class="page-section mb-50">
		<div class="container">
			<div class="row">
				
				<div class="col-sm-12 col-md-12 col-lg-9 col-xs-12">
					<form action="" id="regForm" method="post">

						<div class="login-form">
							<h4 class="login-title">Register</h4>

							<div class="row" id="rows">
								<div class="col-md-6 col-12 mb-20">
									<label>用户名</label>
									<input class="mb-0" type="text" name="username" placeholder="请输入用户名">
									<span id="usernameSpan" class="label label-danger"></span>
								</div>
								<div class="col-md-6 col-12 mb-20">
									<label>姓名</label>
									<input class="mb-0" type="text" name="name" placeholder="请输入姓名">
									<span id="nameSpan" class="label label-danger"></span>
								</div>
								<div class="col-md-6 mb-20">
									<label>密码</label>
									<input class="mb-0" type="password" name="password" placeholder="请输入密码">
									<span id="passwordSpan" class="label label-danger"></span>
								</div>
								<div class="col-md-6 mb-20">
									<label>确认密码</label>
									<input class="mb-0" type="password" name="repassword" placeholder="请确认密码">
									<span id="repasswordSpan" class="label label-danger"></span>
								</div>
							
								<div class="col-md-12 mb-20">
									<label>手机号</label>
									<input class="mb-0" id="phone" type="text" name="phone" placeholder="请输入手机号">
									<span id="phoneSpan" class="label label-danger"></span>
								</div><!-- col-md-6 mb-20 mb-0 -->
								<div class="form-inline" >&nbsp;&nbsp;&nbsp;&nbsp;
									<label>手机验证码</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="form-control" id="inputPCode" type="text" name="inputPCode" placeholder="请输入短信验证码">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-default"
										onclick="sendSMS(this)">获取验证码</button>
								</div>
								
								<div class="col-12">
									<button id="regist_btn" onclick="reg()" class="register-button mt-0" >Register</button>
								</div>
							</div>
						</div>
		          </form> 
				</div>
			</div>
		</div>
	</div>

	<!--=====  End of Login Register page content  ======-->
    
	<!-- 引入footer.jsp -->
	<%@ include file="common/footer.jsp" %>

	<!--=============================================
	=            search overlay         =
	=============================================-->
	
	<div class="search-overlay" id="search-overlay">
		<a href="#" class="search-overlay-close" id="search-overlay-close"><i class="fa fa-times"></i></a>
		<div class="search-box">
			<input type="search" placeholder="Search entire store here">
			<button><i class="icon ion-md-search"></i></button>
		</div>
	</div>
		
	<!--=====  End of search overlay  ======-->

	<!-- scroll to top  -->
	<a href="#" class="scroll-top"></a>
	<!-- end of scroll to top -->

	<!-- 引入linkjs.jsp -->
	<%@ include file="common/links_js.jsp" %>

</body>
<script src="assets/js/bootstrapValidator.min.js"></script>
<link href="assets/css/bootstrapValidator.min.css" rel="stylesheet">

<script type="text/javascript">
$(document).ready(function(){
	$('#regForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: '用户名验证失败',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 4,
                        max: 10,
                        message: '用户名长度必须在4到10位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]{3,9}$/,
                        message: '用户名必须包含字母和数字'
                    },
                    threshold :  4 , //有4字符以上才发送ajax请求
                    remote: {//ajax验证。server result:{"valid",true or false} 
                        url: 'user/checkUserName',//验证地址
                        message: '用户已存在',//提示消息
                        delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                        type: 'POST'
                    }
                }
            },name: {
                message: '姓名验证失败',
                validators: {
                    notEmpty: {
                        message: '姓名不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 15,
                        message: '姓名长度必须3-15'
                    },
                    regexp: {
                        regexp: /^[\u4e00-\u9fa5a-zA-Z]{2,14}/,
                        message: '姓名必须是英文或者汉字'
                    }
                }
            },password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 5,
                        max: 15,
                        message: '密码长度必须在5到15位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]\w{4,14}$/,
                        message: '密码必须包含字母和数字'
                    },
                    identical: {
                        field: 'repassword',
                        message: '两次输入密码不一致'
                    }
                }
            },repassword:{
            	validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    stringLength: {
                        min: 5,
                        max: 15,
                        message: '确认密码长度必须在5到15位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]\w{4,14}$/,
                        message: '确认密码必须包含字母和数字'
                    },
                    identical: {
                        field: 'password',
                        message: '两次输入密码不一致'
                    }
                }
            },phone:{
            	validators: {
                    notEmpty: {
                        message: '手机号不能为空'
                    },
                    regexp: {
                        regexp: /0?(13|14|15|18|17)[0-9]{9}/,
                        message: '手机号格式不正确'
                    },
                    threshold :  11 , //有11字符以上才发送ajax请求
                    remote: {//ajax验证。server result:{"valid",true or false} 
                        url: 'user/checkPhone',//验证地址
                        message: '该手机号已被注册',//提示消息
                        delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                        type: 'POST'
                    }
                }
            }
            
        }
    });
})
	//发送手机验证码，进入60秒倒计时
	var countdown=60;
	function sendSMS(obj){
		//手机短信之前，检测手机号码是否正确
		var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
        if (!myreg.test($("#phone").val())) {
        	return;
        }
		//发送请求到后端，由后端发送 手机 验证码
		$.post(
			'user/sendSms',
			{phone:$("#phone").val()},
			function(data){
				var type='success';
				if(data.code!=1){
					type='error';
				}
				swal({  
		            text: data.msg,  
		            icon: type 
		     	});
			}
		);
		settime(obj);//开启倒计时
	}
	function settime(obj){
		if (countdown == 0) { 
	        obj.removeAttribute("disabled"); 
	        obj.innerHTML="获取验证码"; 
	        countdown = 60; 
	        return;
	    } else { 
	        obj.setAttribute("disabled",true); 
	        obj.innerHTML="重新发送(" + countdown + ")"; 
	        countdown--; 
	    } 
		setTimeout(function() { settime(obj) },1000) 
	}
	
	//阻止原有submit事件
	$(function(){
		$('#regForm').on('submit', function (event) {
			event.preventDefault();
		});
	});
	
	//注册方法		
	function reg(){
		var bootstrapValidator = $("#regForm").data('bootstrapValidator');
		bootstrapValidator.validate();
		//验证通过
		if(bootstrapValidator.isValid()){
			//检测是否 获取 和 输入 了短信验证码
			if(countdown==60){
				 swal({  
		            text: "请先获取验证码",  
		            type: "info" 
			     }); 
				return;
			}
			if($("#inputPCode").val().trim()==''){
				 swal({  
		            text: "请输入验证码",  
		            type: "info" 
			     }); 
				return;
			}
			$.post(
				"user/register",
				$("#regForm").serialize(),
				function(data){
					if(data.code!=1){
						//失败
						if(data.code==0){
							$("#usernameSpan").html('');
							$("#nameSpan").html('');
							$("#passwordSpan").html('');
							$("#repasswordSpan").html('');
							$("#phoneSpan").html('');
							//数据校验未通过,将校验信息展示在每个对应框的后面
							for(var i=0;i<data.data.length;i++){
								var msg=data.data[i].defaultMessage;
								var field=data.data[i].field;
				    			var span='<span class="label label-danger"></span>';
				    			
				    			if(field=="username"){
				    				$("#usernameSpan").html(msg);
				    			}
				    			if(field=="name"){
				    				$("#nameSpan").html(msg);
				    			}
				    			if(field=="password"){
				    				$("#passwordSpan").html(msg);
				    			}
				    			if(field=="repassword"){
				    				$("#repasswordSpan").html(msg);
				    			}
				    			if(field=="phone"){
				    				$("#phoneSpan").html(msg);
				    			}
				    		}
						}else{
							//注册失败
							swal({  
					            text: data.msg,  
					            icon: "error" 
					     	});
						}
					}else{
						//注册成功，弹出提示框，跳转到login界面
						swal({  
				            text: data.msg,  
				            icon: "success" 
				     	});
						location.href='login';
					}
				},"JSON"
			);
		}
		else return;//验证通过
	}
	
</script>

</html>
    