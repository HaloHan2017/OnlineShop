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
									<label>手机号</label>
									<input id="phone" class="form-control mb-0" type="text" name="phone" placeholder="请输入手机号">
									<span id="phoneSpan" color="red"></span>
								</div>
								<div class="form-group has-feedback col-9 mb-20 form-inline">
									<input id="code" class="form-control mb-0" type="text" name="code" placeholder="请输入验证码">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-default"
										onclick="sendSMS(this)">获取验证码</button>
								</div>

								<div class="col-md-12">
									<button id="login_but" onclick="loginByMsg()" class="register-button mt-0">Login</button>
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
//发送手机验证码，进入60秒倒计时
var countdown=60;
function sendSMS(obj){
	$("#phoneSpan").html("");
	//手机短信之前，检测手机号码是否正确
	var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
    if (!myreg.test($("#phone").val())) {
    	$("#phoneSpan").html("手机格式不正确");
    	return;
    }
    //在判断该手机号是否在网站注册
    $.post(
    	'user/checkPhone',
    	{'phone':$("#phone").val()},
    	function(data){
    		if(!data.valid){
    			//已注册，可以短信登录
    			swal({  
    	            text: '发送成功',  
    	            icon: 'success' 
    	     	});
    			//发送请求到后端，由后端发送 手机 验证码
    			$.post(
    				'user/sendSms',
    				{phone:$("#phone").val()},
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
    			settime(obj);//开启倒计时 */
    		}else{
    			$("#phoneSpan").html("此手机号还没注册过，请先注册");
    		}
    	}
    );
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

$(function(){
	//阻止原有submit事件
	$('#loginForm').on('submit', function (event) {
		event.preventDefault();
	});
});
function loginByMsg(){
	$.post('user/loginByMsg',{'phone':$("#phone").val(),'code':$("#code").val()}, function(data) {
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
			  location.href='index';
		  }
	  });
}
</script>


</html>