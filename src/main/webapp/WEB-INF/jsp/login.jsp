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
								<li>Login</li>
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
				<div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30">
					Login Form 
					<form action="" method="post" id="loginForm">

						<div class="login-form">
							<h4 class="login-title">Login</h4>

							<div class="row">
								<div class="form-group has-feedback col-md-12 col-12 mb-20">
									<label>用户名</label>
									<input id="username" class="form-control mb-0" type="text" name="username" placeholder="请输入用户名">
								</div>
								<div class="form-group has-feedback col-12 mb-20">
									<label>密码</label>
									<input id="password" class="form-control mb-0" type="password" name="password" placeholder="请输入密码">
								</div>
								<div class="form-group has-feedback col-9 mb-20 form-inline">
									<input class="form-control mb-0" type="text" name="code" placeholder="请输入验证码">
									<div>
										<img title="点击图片进行刷新" class="Codes_region" src="validateCode" onclick="changeCode()" id="validateCode"/>
									</div>
								</div>
								<div class="col-md-8">
									<div class="check-box d-inline-block ml-0 ml-md-2 mt-10">
										<input type="checkbox" id="remember_me" name="remember_pwd" value="1">
										<label for="remember_me">Remember me</label>
									</div>
									<div class="col-md-4 mt-10 mb-20">
										<a href="loginByMsg"> 短信登录</a>
									</div>
								</div>
								
								<div class="col-md-4 mt-10 mb-20 text-right text-md-right">
									<a href="javascript:void(0);" onClick="forgetPwg()"> Forgotten pasward?</a>
								</div>

								<div class="col-md-12">
									<button id="login_but" onclick="login()" class="register-button mt-0">Login</button>
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
	
	
	<div class="modal fade" id="MyModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="updateModalLabel" >
                        	忘记密码
                    </h4>
                </div>
                <div class="modal-body">
                    <form action="" id="modalForm" class="form-horizontal">
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label">手机号</label>
                            <div class="col-sm-9">
                            	<input id="modal_phone" name="mphone" class="form-control" type="text" placeholder="请输入手机号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-3 control-label">验证码</label>
                            <div class="form-inline">&nbsp;&nbsp;&nbsp;&nbsp;
                            	<input id="modal_code" name="mcode" class="form-control" type="text" placeholder="请输入短信验证码">
                            	<button type="button" class="btn btn-default"
										onclick="sendSMS(this)">获取验证码</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-sm-3 control-label">新密码</label>
                            <div class="col-sm-9">
                           	 	<input id="modal_pwd" name="mnewpwd" class="form-control"  type="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">确认密码</label>
                            <div class="col-sm-9">
                            	<input id="modal_repwd" name="mrepwd" class="form-control" type="password" placeholder="请输入确认密码">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="input" class="btn btn-primary" onclick="updatePwd();">修改</button>
                    <span id="tip"></span>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath }/assets/js/bootstrapValidator.min.js"></script>
<link href="${pageContext.request.contextPath }/assets/css/bootstrapValidator.min.css" rel="stylesheet">
<script type="text/javascript">
//忘记密码
function forgetPwg(){
	$("#MyModal").modal('show');
}
//发送手机验证码，进入60秒倒计时
var countdown=60;
function sendSMS(obj){
	//手机短信之前，检测手机号码是否正确
	var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
    if (!myreg.test($("#modal_phone").val())) {
    	return;
    }
	//发送请求到后端，由后端发送 手机 验证码
	$.post(
		'user/sendSms',
		{phone:$("#modal_phone").val()},
		function(data){
			//alert(data.msg);
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
//修改
function updatePwd(){
	//对数据进行校验
	$('#modalForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            mphone: {
                message: '手机号码验证失败',
                validators: {
                    notEmpty: {
                        message: '手机号不能为空'
                    },
                    regexp: {
                        regexp: /0?(13|14|15|18|17)[0-9]{9}/,
                        message: '手机号码格式不正确'
                    },
                    threshold :  11 , //有11字符以上才发送ajax请求
                    remote: {//ajax验证。server result:{"valid",true or false} 
                        url: 'user/checkPhone',//验证地址
                        message: '该手机号尚未被注册',//提示消息
                        delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                        type: 'POST',
                        data:{
                        	"phone":$("#modal_phone").val(),
                        	"flag":"forget"
                        	}
                    }
                }
            },
            mcode: {
                message: '验证码校验失败',
                validators: {
                    notEmpty: {
                        message: '验证码不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 4,
                        message: '验证码必须是3-4位数'
                    }
                }
            },
            mnewpwd: {
                validators: {
                    notEmpty: {
                        message: '新密码不能为空'
                    },
                    stringLength: {
                        min: 5,
                        max: 15,
                        message: '新密码长度必须在5到15位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]\w{4,14}$/,
                        message: '密码必须包含字母和数字'
                    },
                    identical: {
                        field: 'mrepwd',
                        message: '两次输入密码不一致'
                    }
                }
            },
            mrepwd: {
                validators: {
                    notEmpty: {
                        message: '重复密码不能为空'
                    },
                    stringLength: {
                        min: 5,
                        max: 15,
                        message: '重复密码长度必须在5到15位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]\w{4,14}$/,
                        message: '重复密码必须包含字母和数字'
                    },
                    identical: {
                        field: 'mnewpwd',
                        message: '两次输入密码不一致'
                    }
                }
            }
        }
    });
	var bootstrapValidator = $("#modalForm").data('bootstrapValidator');
	bootstrapValidator.validate();
	//验证通过
	if(bootstrapValidator.isValid()){
		//ajax 到后台 根据 手机号和验证码 修改密码
		$.post(
			'user/forgetPwd',
			{
				"mphone":$("#modal_phone").val(),
				"mcode":$("#modal_code").val(),
				"mnewpwd":$("#modal_pwd").val(),
				"mrepwd":$("#modal_repwd").val()
			},
			function(data){
				if(data!=1){
					var type='success';
					if(data.code!=1){
						type='error';
					}
					swal({  
			            text: data.msg,  
			            icon: type 
			     	});
					//关闭模态框
					$("#MyModal").modal('hide');
				}
			}
		);
	}
}

//更换验证码
function changeCode(){
	var img = document.getElementById("validateCode");
	img.src="validateCode?"+Math.random();
}
$(document).ready(function(){
	$('#loginForm').bootstrapValidator({
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
                    }
                }
            },
            password: {
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
                    }
                }
            },
            vfcode:{
            	validators: {
                    notEmpty: {
                        message: '验证码不能为空'
                    },
                    stringLength: {
                        min: 4,
                        max: 4,
                        message: '验证码必须为4位数'
                    }
                }
            }
        }
    });
});


$(function(){
	//阻止原有submit事件
	$('#loginForm').on('submit', function (event) {
		event.preventDefault();
	});
	//js实现 记住密码
	/* var oForm = document.getElementById('loginForm');
    var oUser = document.getElementById('username');
    var oPswd = document.getElementById('pasword');
    var oRemember = document.getElementById('remember_me'); */
    //页面初始化时，如果帐号密码cookie存在则填充
    if(getCookie('user') && getCookie('pswd')){
	      var username = getCookie('user');
	      var password = getCookie('pswd');
	      $('#username').val(username);
	      $('#password').val(password);
	      $('#remember_me').attr("checked","checked");
    }
    //复选框勾选状态发生改变时，如果未勾选则清除cookie
    $('#remember_me').change(function(){
	  	 if(!this.checked){
	        delCookie('user');
	        delCookie('pswd');
	     }
    });
    /* //表单提交事件触发时，如果复选框是勾选状态则保存cookie
    oForm.onsubmit = function(){
      if(remember.checked){ 
        setCookie('user',oUser.value,7); //保存帐号到cookie，有效期7天
        setCookie('pswd',oPswd.value,7); //保存密码到cookie，有效期7天
      }
    }; */
});
//设置cookie
function setCookie(name,value,day){
	  var date = new Date();
	  date.setDate(date.getDate() + day);
	  document.cookie = name + '=' + value + ';expires='+ date;
};
//获取cookie
function getCookie(name){
	  var reg = RegExp(name+'=([^;]+)');
	  var arr = document.cookie.match(reg);
	  if(arr){
	    	return arr[1];
	  }else{
	    	return '';
	  }
};
//删除cookie
function delCookie(name){
  	setCookie(name,null,-1);
};

//登录方法
function login(){
	   var bootstrapValidator = $("#loginForm").data('bootstrapValidator');
	   bootstrapValidator.validate();
	   //验证通过
	   if(bootstrapValidator.isValid()){
		  $.post('user/login', $("#loginForm").serialize(), function(data) {
			  if(data.code!=1){
				  swal({  
			            text: data.msg,  
			            icon: "error" 
			        }); 
			  }else{
				  swal({  
			            text: "登录成功",  
			            icon: "success" 
			        });
				  if($("input[type='checkbox']").is(':checked')){ //如果记住密码是勾选的，则保存账号密码到cookie
			        setCookie('user',$("#username").val(),7); //保存帐号到cookie，有效期7天
			        setCookie('pswd',$("#password").val(),7); //保存密码到cookie，有效期7天
			      }
				  location.href='index';
			  }
		  });
	   }
	   else return;//验证通过
}
	
</script>
</html>
    