<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
		<!-- 引入links.jsp -->
		<%@ include file="common/links.jsp" %>
		<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/myutil.js"></script>
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
								<li>My Account</li>
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
    =            My Account page content         =
    =============================================-->

    <div class="page-section mb-50">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="row">
						<!-- My Account Tab Menu Start -->
						<div class="col-lg-3 col-12">
							<div class="myaccount-tab-menu nav" role="tablist">
								<a href="#dashboad" class="active" data-toggle="tab"><i class="fa fa-dashboard"></i>
									Dashboard</a>

								<a href="#orders" data-toggle="tab"><i class="fa fa-cart-arrow-down"></i> Orders</a>

								<!-- <a href="#download" data-toggle="tab"><i class="fa fa-cloud-download"></i> Download</a> -->

								<a href="#payment-method" data-toggle="tab"><i class="fa fa-credit-card"></i> Payment
									Method</a>

								<a href="#address-edit" data-toggle="tab"><i class="fa fa-map-marker"></i> address</a>

								<a href="#account-info" data-toggle="tab"><i class="fa fa-user"></i> Account Details</a>

								<a href="#change-pwd"  data-toggle="tab"><i class="fa fa-sign-out"></i> CHANGE PASSWORD</a>
								<a href="#change-phone"  data-toggle="tab"><i class="fa fa-cloud-download"></i> CHANGE PHONE</a>
							</div>
						</div>
						<!-- My Account Tab Menu End -->

						<!-- My Account Tab Content Start -->
						<div class="col-lg-9 col-12">
							<div class="tab-content" id="myaccountContent">
								<!-- Single Tab Content Start -->
								<div class="tab-pane fade show active" id="dashboad" role="tabpanel">
									<div class="myaccount-content">
										<h3>Dashboard</h3>

										<div class="welcome mb-20">
											<p>Hello, <strong>${user.name }</strong> </p>
										</div>

										<p class="mb-0">From your account dashboard. you can easily check &amp; view your
											recent orders, manage your shipping and billing addresses and edit your
											password and account details.</p>
									</div>
								</div>
								<!-- Single Tab Content End -->

								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="orders" role="tabpanel">
									<div class="myaccount-content">
										<h3>Orders</h3>

										<div class="myaccount-table table-responsive text-center">
											<table class="table table-bordered" id="ordersTable">
												<thead class="thead-light">
												<tr>
													<th>订单编号</th>
													<th>下单时间</th>
													<th>总金额</th>
													<th>收货地址</th>
													<th>订单状态</th>
												</tr>
												</thead>

												<tbody>
													<tr>
														<td>暂无订单记录</td>
													</tr>
												</tbody>
											</table>
											<div class="pagination-area mb-md-50 mb-sm-50">
									            <!--翻页-->
												<div class="zxf_pagediv"></div>
									        </div>
										</div>
									</div>
								</div>
								<!-- Single Tab Content End -->

								
								<!-- Single Tab Content End -->

								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="payment-method" role="tabpanel">
									<div class="myaccount-content">
										<h3>Payment Method</h3>

										<p class="saved-message">本商城目前只支持支付宝支付，为你带来的不便，敬请谅解</p>
									</div>
								</div>
								<!-- Single Tab Content End -->

								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="address-edit" role="tabpanel">
									<a href="javascript:void(0);" onClick="openModal()" 
											class="btn d-inline-block edit-address-btn">
											<i class="fa fa-insert"></i>添加地址
										</a>
									<div class="myaccount-content">
										<h3>Billing Address</h3>
										<div class="container">
											<div class="row" id="addrDiv">
												
											</div>
										</div>
										
									</div>
								</div>
								<!-- Single Tab Content End -->

								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="account-info" role="tabpanel">
									<div class="myaccount-content">
										<h3>Account Details</h3>

										<div class="account-details-form">
											<form action="#" id="userInfoForm">
												<div class="row">
													<div class="col-lg-6 col-12 mb-30">
														用户名<input id="Details_username" readonly="readonly" name="username" type="text">
													</div>
													<div class="col-lg-3 col-3 mb-30">
														个人头像
														<img title="点击修改个人头像" style="cursor:pointer;" onclick="file.click()" width="100px" height="100px" id="Details_headImg" src="">
														<input name="file" type="file" id="headFile" style="display:none" onchange="upload()" />
														<input id="Details_head" name="head" type="hidden">
													</div>
													<div class="col-lg-6 col-12 mb-30">
														真实姓名<input id="Details_name" readonly="readonly" name="name" type="text">
													</div>
													<div class="col-lg-6 col-12 mb-30">
														性别：
														<label class="radio-inline">
													        	男<input type="radio" id="Details_men" name="sex" value="男" checked>
													    </label>&nbsp;&nbsp;&nbsp;&nbsp;
													    <label class="radio-inline">
													       		 女<input type="radio" id="Details_women" name="sex" value="女">
													    </label>
													</div>
													
													<div class="col-lg-9 col-12 mb-30">
														邮箱<input id="Details_email" placeholder="请输入邮箱" name="email" type="text">
														<span color="red"></span>
													</div>
													<div class="col-lg-4 col-lg-4 col-12 mb-30">
														等级<input id="Details_level" readonly="readonly" name="level" type="text">
													</div>
													<div class="col-lg-4 col-lg-4 col-12 mb-30">
														积分<input id="Details_scores" readonly="readonly" name="scores" type="text">
													</div>
													<div class="col-lg-4 col-lg-4 col-12 mb-30">
														注册时间<input id="Details_regtime" readonly="readonly" name="regtime" type="text">
													</div>

													
													<div class="col-12">
														<button class="save-change-btn" onclick="updateUserInfo()">Save Changes</button>
													</div>

												</div>
											</form>
										</div>
									</div>
								</div>
								
								<!-- Single Tab Content Start -->
								<div class="tab-pane fade" id="change-pwd" role="tabpanel">
									<div class="myaccount-content">
										<h3>Password change</h3>

										<div class="account-details-form">
											<form action="#" id="changePwdForm">
												<div class="row">

													<div class="col-lg-9 col-12 mb-30">
														<input id="change-pwd-oldpwd" name="changePwd_oldpwd" placeholder="旧密码" type="password">
													</div>

													<div class="col-lg-9 col-lg-6 col-12 mb-30">
														<input id="change-pwd-newpwd" name="changePwd_newpwd" placeholder="新密码" type="password">
													</div>

													<div class="col-lg-9 col-lg-6 col-12 mb-30">
														<input id="change-pwd-repwd" name="changePwd_repwd" placeholder="确认密码" type="password">
													</div>
													
													<div class="col-12">
														<button class="save-change-btn" onclick="changePwd()">Save Changes</button>
													</div>

												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- Single Tab Content End -->
							
								<!-- 修改手机号 -->
								<div class="tab-pane fade" id="change-phone" role="tabpanel">
									<div class="myaccount-content">
										<h3>PhoneNumber change</h3>

										<div class="account-details-form">
											<form action="#" id="changePhoneForm">
												<div class="row">

													<div class="col-lg-6 col-12 mb-30">
														当前手机号<input id="Details_phone" readonly="readonly" placeholder="请输入手机号"name="phone"  type="text">
														<button type="button" class="btn btn-default"
															onclick="sendSMS(this)">获取验证码</button>
													</div> 
													<div class="col-lg-4 col-12 mb-30">
														验证码<input id="msgCode" placeholder="请输入短信验证码"  type="text">
														<span id="msgCodeSpan"></span>
													</div>
													<div class="col-lg-6 col-12 mb-30">
														新的手机号<input id="newphone" placeholder="请输入新手机号" name="newphone" type="text">
														<span id="newPhoneSpan"></span>
													</div>
													
													<div class="col-12">
														<button class="save-change-btn" onclick="changePhone()">Save Changes</button>
													</div>

												</div>
											</form>
										</div>
									</div>
								</div>
								
							</div>
						</div>
						<!-- My Account Tab Content End -->
					</div>

				</div>
			</div>
		</div>
	</div>

	<!--=====  End of My Account page content  ======-->
    
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
	
	<!-- 添加 收货地址 模态框 -->
	<div class="modal fade" id="MyModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="updateModalLabel" >
                        	添加收货地址
                    </h4>
                </div>
                <div class="modal-body">
                    <form action="" id="modalForm" class="form-horizontal">
                        <div class="form-group">
                            <label for="province" class="col-sm-6 control-label">省份</label>
                            <div class="col-sm-6">
                            	<div class="dropdown">
									<select class="form-control" id="province" name="province" onchange="doProvAndCityRelation();">　　　　　　　
										<option id="choosePro" value="-1">请选择您所在省份</option>　　　　　　
									</select>
								</div>
                            </div>
                             <label for="city" class="col-sm-6 control-label">城市</label>
                            <div class="col-sm-6">
                            	<div class="dropdown">
									<select class="form-control" id="citys" name="city" onchange="doCityAndCountyRelation();">　　　　　　　　
										<option id='chooseCity' value='-1'>请选择您所在城市</option>　　　　
									</select>
								</div>
                            </div>
                             <label for="region" class="col-sm-6 control-label">区域</label>
                            <div class="col-sm-6">
                            	<div class="dropdown">
									<select class="form-control" id="county" name="county">　　　　　　　　
										<option id='chooseCounty' value='-1'>请选择您所在区/县</option>　　　　　
									</select>
								</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">详细地址</label>
                            <div class="col-sm-9">
                           	 	<input id="detail" name="detail" class="form-control" type="text" placeholder="详细地址">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">收货人姓名</label>
                            <div class="col-sm-9">
                           	 	<input id="name" name="name" class="form-control" type="text" placeholder="请收货人姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-sm-3 control-label">收货人手机号</label>
                            <div class="col-sm-9">
                            	<input id="phone" name="phone" class="form-control" type="text" placeholder="请输入收货人手机号">
                            </div>
                        </div>
                        <!-- addrId隐藏域 -->
                        <input id="addrId" name="addrId" class="form-control" type="hidden" value="">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeModal()">取消</button>
                    <button type="input" class="btn btn-primary" onclick="addAddress()">添加</button>
                    <span id="tip"></span>
                </div>
            </div>
        </div>
    </div>
	
	<!-- 引入linkjs.jsp -->
		<%@ include file="common/links_js.jsp" %>
	<!-- bootstrap模态框  确认退货及退货理由-->	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">订单号:</label>
            <input type="text" class="form-control" id="recipient-name" readonly="readonly">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">退货理由:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="defineReturn(this)">确定</button>
      </div>
    </div>
  </div>
</div>



<!-- bootstrap模态框  评价相关-->	
	<div class="modal fade" id="commentModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">订单号:</label>
            <input type="text" class="form-control" id="recipient-name" readonly="readonly">
          </div>
          
          <!-- 星星 -->
          <div id="starstar">
          <div id="starttwo" class="block clearfix">
        		<div  class="star_score"></div>
        		<p style="float:left;">您的评分：<span class="fenshu" id="fenshu"></span> 分</p>
    		</div> 
    	</div>
    		<script type="text/javascript">
				 scoreFun($("#starttwo"),{
			         fen_d:22,//每一个a的宽度
			         ScoreGrade:5//a的个数 10或者
			       })
			</script>
          
          <div class="form-group">
            <label for="message-text" class="control-label">评论:<p></p></label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="defineComment(this)">确定</button>
      </div>
    </div>
  </div>
</div>

<!-- bootstrap模态框  展示订单详情-->	
	<div class="modal fade" id="showOrderItemModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body" id="orderItemBody">
          <div class="form-group">
            <label for="recipient-name" class="control-label">订单号:</label>
            <input type="text" class="form-control" id="recipient-name" readonly="readonly">
          </div>
          <div>
          	<p>商品1</p>
          	<img src="/upload/computers1.jpg" width="100px" height="100px" class="img-circle">
          	<p>
	          	<span>商品名称：</span>&nbsp;&nbsp;&nbsp;<span>jjjj</span><br>
	          	<span>购买数量：</span>&nbsp;&nbsp;&nbsp;<span>5</span><br>
	          	<span>价格：</span>&nbsp;&nbsp;&nbsp;<span>123 × 5</span><br>
          	</p>
          </div>
          <hr/>
      </div>
    </div>
  </div>
</div>
</body>
<script src="${pageContext.request.contextPath }/assets/js/bootstrapValidator.min.js"></script>
<link href="${pageContext.request.contextPath }/assets/css/bootstrapValidator.min.css" rel="stylesheet">
<!-- 分页插件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/pageHelper.js"></script>
<!-- 省市县三级联动 -->
<script src="${pageContext.request.contextPath }/assets/js/cities.js"></script>

<script type="text/javascript">
	//修改手机号
	function changePhone(){
		//发送ajax请求前，
		//1.确认输入的 新手机号是否正确
		var newphone = $("#newphone").val();
		var reg=/0?(13|14|15|18|17)[0-9]{9}/;
		if(newphone.trim()==''){
			$("#newPhoneSpan").html("新手机号不能为空");
			return;
		}else if(!reg.test(newphone)){
			$("#newPhoneSpan").html("新手机号格式错误");
			return;
		}else if(newphone==$("#Details_phone").val()){
			$("#newPhoneSpan").html("新手机号不能与旧手机号相同");
			return;
		}else{
			$("#newPhoneSpan").html("");
		}
		//2.判断是否输入短信验证码
		var msgCode=$("#msgCode").val().trim();
		if(msgCode==''){
			$("#msgCodeSpan").html('验证码不能为空');
			return;
		}else{
			$("#msgCodeSpan").html('');
		}
		
		//3.验证通过，发送短信验证码  向 后台 发送 修改请求
		$.post('user/updatePhone',
				{"newPhone":$("#newphone").val().trim(),
				"msgCode":$("#msgCode").val().trim(),
				"phone":$("#Details_phone").val().trim()},
				function(data){
					var type='success';
					var text='修改手机号成功';
					if(data.code!=1){
						type='error';
						text=data.msg;
					}
					swal({  
			            text: text,  
			            icon: type 
			     	});
				}
		);
		
	}
	//发送手机验证码，进入60秒倒计时
	var countdown=60;
	function sendSMS(obj){
	    $.post(
 			'user/sendSms',
 			{phone:$("#Details_phone").val()},
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
			});
 		settime(obj);//开启倒计时 */
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
	//修改密码
	function changePwd(){
		//修改密码之前，对数据进行校验
		$('#changePwdForm').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	changePwd_oldpwd: {
	            	message: '旧密码校验失败',
	                validators: {
	                	notEmpty: {
	                        message: '旧密码不能为空'
	                    },
	                    stringLength: {
	                        min: 5,
	                        max: 15,
	                        message: '旧密码长度必须在5到15位之间'
	                    },
	                    regexp: {
	                        regexp: /^[a-zA-Z]\w{4,14}$/,
	                        message: '旧密码必须包含字母和数字'
	                    }
	                }
	            },
	            changePwd_newpwd: {
	            	message: '新密码校验失败',
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
	                        message: '新密码必须包含字母和数字'
	                    },
	                    identical: {
	                        field: 'changePwd_oldpwd',
	                        message: '两次输入密码不一致'
	                    }
	                }
	            },
	            changePwd_repwd: {
	            	message: '确认密码校验失败',
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
	                        field: 'changePwd_newpwd',
	                        message: '两次输入密码不一致'
	                    }
	                }
	            }
	        }
	    });
		var bootstrapValidator = $("#changePwdForm").data('bootstrapValidator');
		bootstrapValidator.validate();
		//验证通过
		if(bootstrapValidator.isValid()){
			$.post(
					'user/updatePwd',
					{
						'oldpwd':$("#change-pwd-oldpwd").val(),
						'newpwd':$("#change-pwd-newpwd").val(),
						'repwd':$("#change-pwd-repwd").val()
					},
					function(data){
						if(data.code!=1){
							swal({
								text:data.msg,
								icon:'error'
							});
						}else{
							swal({
								text:'修改成功',
								icon:'success'
							});
						}
					}
				);
		}else return;
	}
	$(function(){
		//展示所有收获地址列表
		showAllAddress();
		
		//展示 个人信息
		showUserInfo();
		
		//展示用户订单
		showOrders(1);
		
		//屏蔽 表单的默认提交
		$('#userInfoForm').on('submit', function (event) {
			event.preventDefault();
		});
		$('#changePhoneForm').on('submit', function (event) {
			event.preventDefault();
		});
		
	});
	//上传头像
	function upload(){
		$.ajax({
			url: "uploadHeadFile.do",
			type: 'POST',
			cache: false,
			data: new FormData($('#userInfoForm')[0]),
			processData: false,
			contentType: false,
			dataType: "json",
			success: function(data){
				if(data.code == 1){
					$("#Details_headImg").attr("src",data.data);//显示选择修改的图片
					$("#Details_head").val(data.data);//将图片路径写到 name的input
					swal({
						text:'头像上传成功',
						icon:'success'
					});
				}else{
					swal({
						text:'头像上传成功',
						icon:'error'
					});
				}
			}
		});
	}
	//修改用户信息 
	function updateUserInfo(){
		//修改之前，判断 是否更改了邮箱，若更改了，则判断格式是否正确
		
		var email = $("#Details_email").val();
		var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
		if(email.trim()!=''){//邮箱input进行了输入
			if(!reg.test(email)){
				//验证不通过
				$("#Details_email").next().html('邮箱格式错误');
				return;
			}else{
				$("#Details_email").next().html('');
			}
		}
		$.post('user/updateUserInfo',$("#userInfoForm").serialize(),function(data){
			if(data.code!=1){
				swal({
					text:data.msg,
					inco:'error'
				});
			}else{
				swal({
					text:'修改成功',
					inco:'success'
				});
				//刷新界面
				showUserInfo();
			}
		});
	}
	function showUserInfo(){
		$.getJSON('user/getUserInfo',function(data){
			if(data.code!=1){
				swal({
					text:data.msg,
					inco:'error'
				});
			}else{
				var user=data.data;
				$("#Details_username").val(user.username);
				$("#Details_name").val(user.name);
				if(user.sex=='女'){
					$("#Details_men").removeAttr("checked");
					$("#Details_women").attr("checked","checked");
				}else{
					$("#Details_women").removeAttr("checked");
					$("#Details_men").attr("checked","checked");
				}
				$("#Details_phone").val(user.phone);
				$("#Details_email").val(user.email);
				$("#Details_scores").val(user.scores);
				$("#Details_level").val(user.level);
				$("#Details_regtime").val(GetDate(user.regtime));
				$("#Details_headImg").attr("src",user.head);
				//把头像路径写到表单中（以防用户未修改头像，而input为null）
				$("#Details_head").val(user.head);
			}
		});
	}
	function showAllAddress(){
		$("#addrDiv").html('');
		$.getJSON('address/getAllAddressByUid',function(data){
			if(data.code!=1){
				var div='<div class="col-md-3">'
							+'<address>'
								+'<p>'+data.msg+'</p>'
							+'</address>'
							+'<a href="javascript:void(0);" onClick="openModal()" class="btn d-inline-block edit-address-btn"><i class="fa fa-insert"></i>添加地址</a>'
						+'</div>';
				$("#addrDiv").append(div);
			}else{//有 收货地址列表
				$.each(data.data,function(index,item){
					var div='<div class="col-md-3">'
						+'<address>'
							+'<p><strong>'+item.name+'</strong></p>'
							+'<p>'+item.address+'</p>'
							+'Mobile: <p>'+item.phone+'</p>'
						+'</address>'
						+'<a href="javascript:void(0);"  class="btn d-inline-block edit-address-btn" onClick="openUpdateModal(this,'+item.addrId+')"><i class="fa fa-add"></i>修改地址</a></br></br>'
						+'<a href="javascript:void(0);"  class="btn d-inline-block edit-address-btn" onClick="deleteAddress('+item.addrId+')"><i class="fa fa-add"></i>删除地址</a>'
						+'</div>';
					$("#addrDiv").append(div);
				}); 
			}
		});
	}
	//打开 修改 模态框，填充数据
	function openUpdateModal(obj,addrId){
		
		var name =$(obj).prev("address").find("p").eq(0).find("strong").html();//姓名
		var address =$(obj).prev().find("p").eq(1).html();//地址
		var phone =$(obj).prev().find("p").eq(2).html();//手机
		$("#name").val(name);
		$("#phone").val(phone);
		$("#addrId").val(addrId);
		//将address 拆分 成 省市县 详细地址
		var arr =address.split("-");
		var pro=arr[0];
		var city=arr[1];
		var county=arr[2];
		var detail=arr[3];
		$("#detail").val(detail);
		//根据 省市县名称  选中 对应的select下拉框
		getSelectByText("province",pro);
		getSelectByText("citys",city);
		getSelectByText("county",county);
		openModal();
	}
	//根据 text 选中select
	function getSelectByText(id,text){
		var se=document.getElementById(id);
		var os=se.getElementsByTagName("option");
		for(var i=0;i<os.length;i++){
			if(os[i].text=text){
				os[i].selected=true;
				break;
			}
		}
	}
	function openModal(){
		$("#MyModal").modal('show');
	}
	function closeModal(){
		//关闭模态框，并清除内容
		$("#MyModal").modal('show');
		$("#name").val('');
		$("#phone").val('');
		$("#addrId").val('');
		$("#detail").val('');
		getSelectByText("county","请选择您所在区/县");
		getSelectByText("citys","请选择您所在城市");
		getSelectByText("province","请选择您所在省份");
		/* $("#chooseCounty").val('');
		$("#chooseCity").val('');
		$("#choosePro").val(''); */
		$("#MyModal").modal('hide');
	}
	function addAddress(){
		//添加 收货地址之前，对数据进行校验
		$('#modalForm').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            name: {
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
	            },
	            phone: {
	            	message: '手机号码验证失败',
	                validators: {
	                    notEmpty: {
	                        message: '手机号不能为空'
	                    },
	                    regexp: {
	                        regexp: /0?(13|14|15|18|17)[0-9]{9}/,
	                        message: '手机号码格式不正确'
	                    }
	                }
	            },
	            detail: {
	            	message: '详细地址验证失败',
	                validators: {
	                    notEmpty: {
	                        message: '详细地址不能为空'
	                    },
	                    stringLength: {
	                        min: 3,
	                        max: 15,
	                        message: '详细地址长度必须5-15'
	                    }
	                }
	            }
	        }
	    });
		var bootstrapValidator = $("#modalForm").data('bootstrapValidator');
		bootstrapValidator.validate();
		//验证通过
		if(bootstrapValidator.isValid()){
			//判断  是否  选择了省市县
			var pro =$("#province option:selected").text();
			var city =$("#citys option:selected").text();
			var county =$("#county option:selected").text();
			var detail =$("#detail").val();
			//console.info(pro+"-"+city+"-"+county);
			if(pro.search("请选择您所在")!=-1 || city.search("请选择您所在")!=-1 || county.search("请选择您所在")!=-1){
				swal({
					text:"请先选择省市县",
					icon:"info"
				});
				return;
			}
			//alert(pro+"-"+city+"-"+county);
			//添加 收货地址
			$.post(
				'address/add',
				{
					"province":pro,
					"city":city,
					"county":county,
					"detail":detail,
					"name":$("#name").val(),
					"phone":$("#phone").val(),
					"addrId":$("#addrId").val()
				},
				function(data){
					if(data.code!=1){
						swal({  
				            text: data.msg,  
				            icon: 'error' 
				     	});
						//关闭模态框
						//$("#MyModal").modal('hide');
					}else{
						swal({  
				            text: '成功',  
				            icon: 'success' 
				     	});
						//操作成功，刷新列表
						showAllAddress();
					}
					closeModal();
				}
			);
		}
	}
	
	function deleteAddress(addrId){
		swal({
			  title: "操作确认",
			  text: "确认删除该地址吗？",
			  icon: "warning",
			  buttons: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  $.getJSON("address/del?addrId="+addrId,function(data){
						if(data.code!=1){
							swal({
								text:data.msg,
								icon:"error"
							});
						}else{
							swal({
								text:"删除成功",
								icon:"success"
							});
							//刷新
							showAllAddress();
						}
					})
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
	
	//展示用户的订单
	function showOrders(current){
		//清空
		$("#ordersTable").children().next().empty();
		var htmlstr = "";
		$.get("order/queryAllOrder?currPage="+current,function(data){
			//定义中间量
			var temp = data.data;
			//时间转换
			var fmt = SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			for(var i=0;i<temp.length;i++){
				//用"-"分离收货地址让地址显示更好看
				if(temp[i].addr== null || temp[i].addr == ""){
					htmlstr += '<tr>'+
					'<td id="orderId">'+'<a href="#" onclick="showItemForOrder(this)" data-toggle="modal" data-target="#showOrderItemModal" data-whatever="@mdo">'+temp[i].oid+'</a>'+'</td>'+
					'<td>'+fmt.format(temp[i].ordertime)+'</td>'+
					'<td id="totalMoney">'+temp[i].totalMoney+'</td>'+
					'<td>'+'暂无收货地址'+'</td>';
				}else{
					var address = temp[i].addr.address.split("-");
					htmlstr += '<tr>'+
					'<td id="orderId">'+'<a href="#" onclick="showItemForOrder(this)" data-toggle="modal" data-target="#showOrderItemModal" data-whatever="@mdo">'+temp[i].oid+'</a>'+'</td>'+
					'<td>'+fmt.format(temp[i].ordertime)+'</td>'+
					'<td id="totalMoney">'+temp[i].totalMoney+'</td>'+
					'<td>'+address[0]+'-'+address[1]+'-'+address[2]+'<br>'+address[3]+'</td>';
				}
				//设置状态
				if(temp[i].status == 0){	//待支付
					htmlstr += '<td><button type="button" value="'+temp[i].status+'" class="btn btn-primary" onclick="payForAli(this)">待支付</button></td>';
				}else if(temp[i].status == 1){	//已支付
					htmlstr += '<td><button type="button" value="'+temp[i].status+'" disable="disable" class="btn btn-success">已支付</button></td>';
				}else if(temp[i].status == 2){	//已发货
					htmlstr += '<td><button type="button" value="'+temp[i].status+'"  disable="disable" class="btn btn-info" onclick="changeStatusWithReceive(this)">确认收货</button></td>';
				}else if(temp[i].status == 3){	//已收货（待评价）
					htmlstr += '<td><button type="button" value="'+temp[i].status+'"  class="btn btn-default" data-toggle="modal" data-target="#commentModel" data-whatever="@mdo">评价</button> '+
					'<button type="button" value="'+temp[i].status+'"  class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">退货</button></td>';
				}else if(temp[i].status == 4){	// 已评价
					htmlstr += '<td><button type="button" value="'+temp[i].status+'"  class="btn btn-info">已评价</button> '
					+'<button type="button" value="'+temp[i].status+'"  class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">退货</button></td>';
				}else if(temp[i].status == -1){	// 已失效（失败订单）
					htmlstr += '<td><button type="button" value="'+temp[i].status+'"  class="btn btn-danger">已失效</button></td>';
				}else if(temp[i].status == -2){	// 退款中（失败订单）
					htmlstr += '<td><button type="button" value="'+temp[i].status+'"  class="btn btn-warning">退款中</button></td>';
				}else if(temp[i].status == -3){	// 已退款（失败订单）
					htmlstr += '<td><button type="button" value="'+temp[i].status+'"  class="btn btn-warning">已退款</button></td>';
				}
				htmlstr += '</tr>';
			}
			
			$("#ordersTable").find("tbody").html(htmlstr);
			//分页展示
			initpage(data);
		});
	}
	
	function payForAli(obj){
		var orderId = $(obj).parents("tr").find("#orderId").children().html();
		var totalMoney = $(obj).parents("tr").find("#totalMoney").html();
		//鸡付宝支付
		window.location.href="/payment/payForAliWithStatusEqualsZero?orderId="+orderId+"&WIDtotal_amount="+totalMoney;
	}
	
	//确认收货
	function changeStatusWithReceive(obj){
		swal({
			  title: "操作提示",
			  text: "确定收货？",
			  icon: "info",
			  buttons: true,
			}).then((willDelete) => {
			  if (willDelete) {
				  var orderId = $(obj).parents("tr").find("#orderId").find("a").html();
					$.post("payment/changeStatusWithReceive",
					{
						"orderId":orderId
					},
					function(data){
						if(data.code!=1){
							swal({
								text:data.msg,
								inco:"error"
							});
						}else{
							swal({
								text:'收货成功',
								inco:"success"
							});
							var temp = $(obj).parents("td");
							temp.empty();
							var htmlstr = '<button type="button" value="'+data+'"  class="btn btn-default" data-toggle="modal" data-target="#commentModel" data-whatever="@mdo">评价</button> ';
							htmlstr += '<button type="button" value="'+data+'"  class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">退货</button>';
							temp.html(htmlstr);
						}
					});
			  }
		});
	}
	
	//bootstrap模态窗口JavaScript代码,这是打开退货的模态窗口代码
	$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var orderId = button.parents("tr").find("#orderId").children().html();
		  var modal = $(this)
		  modal.find('.modal-title').text('退货管理')
		  modal.find('.modal-body input').val(orderId)
		  //设置文本域为空
		  modal.find('.modal-body textarea').val('')
	});
	
	//bootstrap模态窗口JavaScript代码,这是评论的模态窗口代码
	$('#commentModel').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var orderId = button.parents("tr").find("#orderId").children().html();
		  var modal = $(this)
		  modal.find('.modal-title').text('评论管理')
		  modal.find('.modal-body input').val(orderId)
		  //设置文本域为空
		  modal.find('.modal-body textarea').val('')
	});
	
	//bootstrap模态窗口JavaScript代码,这是订单详情的模态窗口代码
	$('#showOrderItemModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  
		  //初始化数据
		  var htmlstr = '';
          htmlstr += '<div class="form-group">';
          htmlstr += '<label for="recipient-name" class="control-label">订单号:</label>';
          htmlstr += '<input type="text" class="form-control" id="recipient-name" readonly="readonly"></div>';
          modal.find('.modal-body').html(htmlstr)
          
          
		  modal.find('.modal-title').text('订单详情')
		  modal.find('.modal-body input').val(button.html())
		  
		  showItemForOrder(button.html());
		  //设置文本域为空
		  modal.find('.modal-body textarea').val('')
	});
	
	
	//确定退货
	function defineReturn(obj){
		var orderId = $(obj).parents("#exampleModal").find("#recipient-name").val();
		var desc = $(obj).parents("#exampleModal").find("#message-text").val();
		$.post("order/moneyReturn",
		{
			"orderId":orderId,
			"desc":desc
		},
		function(data){
			if(data.code == 1){
				showOrders(1);
			}else{
				swal({
					text:'退货不成功！',
					icon:'warning'
				});
			}
		});
	}
	
	//评论
	function defineComment(obj){
		var orderId = $(obj).parents("#commentModel").find("#recipient-name").val();
		var commentContent = $(obj).parents("#commentModel").find("#message-text").val();
		var stars = $("#fenshu").html();
		if(stars == "" || stars == null){
			swal({
				text:'请评分！',
				icon:'warning'
			});
			return;
		}
		$.post("comment/userSubmitComment",{
			"orderId":orderId,
			"commContent":commentContent,
			"stars":stars
		},function(data){
			if(data.code == 1){
				swal({
					text:'评论成功',
					inco:'success'
				});
				setTimeout(function(){
					showOrders(1);
				},2000);
			}else{
				swal({
					text:'评论不成功！',
					icon:'error'
				});
			}
		});
	}
</script>

<script type="text/javascript">
	//下一页
	function nextpage(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		current = current+1;
		showOrders(current);
	}
	//上一页
	function prepage(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		current = current-1;
		showOrders(current);
	}
	//中间点击页
	function pagenum(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		showOrders(current);
	}
	//跳转页面
	function jump(){
		current = $(".zxfinput").val();
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		showOrders(current);
	}
	
	
	//展示商品详情 	
	function showItemForOrder(obj){
		var htmlstr = '';
		$.get("order/showItemForOrderByOid",{
			"oid":obj
		},function(data){
          for(var i=0;i<data.length;i++){
        	htmlstr += '<div>';
  			htmlstr += '<p>商品'+(i+1)+'</p>';
  			htmlstr += '<img src="'+ data[i].product.pimage +'" width="100px" height="100px" class="img-circle">';
  			htmlstr += '<p>';
  			htmlstr += '<span>商品名称：</span>&nbsp;&nbsp;&nbsp;<span>'+ data[i].product.pname +'</span><br>';
  			htmlstr += '<span>购买数量：</span>&nbsp;&nbsp;&nbsp;<span>'+ data[i].pcount +'</span><br>';
  			htmlstr += '<span>单价：</span>&nbsp;&nbsp;&nbsp;<span>'+ data[i].prealPrice +'</span><br>';
  			htmlstr += '<span>总价：</span>&nbsp;&nbsp;&nbsp;<span>'+ data[i].prealPrice * data[i].pcount +'</span><br>';
  			htmlstr += '</p>';
  			htmlstr += '<div>';
  			if(i != data.length-1){
  				htmlstr += '<hr/>';
  			}
          }
          $("#orderItemBody").find(".form-group").after(htmlstr);
		});
	}
	</script>

</html>
