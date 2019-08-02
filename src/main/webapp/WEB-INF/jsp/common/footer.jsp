<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--=============================================
	=            footer         =
	=============================================-->

<div class="footer-container">
	<!--=======  footer 导航  =======-->
	
	<div class="footer-navigation pt-40 pb-20 pb-lg-40 pt-sm-30 pb-sm-10">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<!--=======  address block  =======-->
					
					<div class="address-block">
						<div class="image">
							<a href="index.html">
								<img src="assets/images/logo.png" class="img-fluid" alt="">
							</a>
						</div>

						<div class="address-text">
							<ul>
								<li>Address: 123 Main Street, Anytown, CA 12345 - USA.</li>
								<li>Phone: (012) 800 456 789</li>
								<li>Fax: (012) 800 456 789</li>
								<li>Email: support@hastech.company</li>
							</ul>
						</div>

						<div class="social-links">
							<ul>
								<li><a href="http://www.twitter.com/" class="twitter"  data-tooltip="Twitter"><i class="fa fa-twitter"></i></a></li>
								<li><a href="http://www.facebook.com/" class="facebook"  data-tooltip="Facebook"><i class="fa fa-facebook"></i></a></li>
								<li><a href="http://www.behance.com/" class="behance" data-tooltip="Behance"><i class="fa fa-behance"></i></a></li>
								<li><a href="http://www.pinterest.com/" class="pinterest" data-tooltip="Pinterest"><i class="fa fa-pinterest"></i></a></li>
								<li><a href="http://www.rss.com/" class="rss" data-tooltip="RSS"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
					</div>
					
					<!--=======  End of address block  =======-->
				</div>
				<div class="col-lg-2 col-md-6">
					<!--=======  widget block  =======-->
					
					<div class="widget-block" >
						<h4 class="footer-widget-title mb-sm-10">友情链接1</h4>
						<ul id="flinks1">
							<li><a href="about.html">About Us</a></li>
							<li><a href="contact.html">Contact</a></li>
							<li><a href="blog-left-sidebar.html">Blog</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Seller Login</a></li>
							<li><a href="#l">Site Map</a></li>
						</ul>
					</div>
					
					<!--=======  End of widget block  =======-->
				</div>
				<div class="col-lg-2 col-md-6">
					<!--=======  widget block  =======-->
					
					<div class="widget-block" >
						<h4 class="footer-widget-title mt-sm-20 mb-sm-10">友情链接2</h4>
						<ul id="flinks2">
							<li><a href="contact.html">友情链接2</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="my-account.html">My Account</a></li>
							<li><a href="wishlist">Wishlist</a></li>
							<li><a href="cart.html">Cart</a></li>
							<li><a href="#">Order History</a></li>
						</ul>
					</div>
					
					<!--=======  End of widget block  =======-->
				</div>
				<div class="col-lg-4 col-md-6">
					<!--=======  widget block  =======-->
					
					<div class="widget-block">
						<h4 class="footer-widget-title mt-sm-20 mb-sm-10">Leave a Message</h4>
						<textarea rows="5" class="form-control" id="message"></textarea>
						<div class="newsletter-form mb-20" style="margin-top: 10px">
							<form id="mc-form" class="mc-form">
								<button type="button" value="submit" onclick="sendMessage()">subscribe</button>
							</form>
						</div>

						<!-- mailchimp-alerts Start -->
						<div class="mailchimp-alerts">
							<div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
							<div class="mailchimp-success"></div><!-- mailchimp-success end -->
							<div class="mailchimp-error"></div><!-- mailchimp-error end -->
						</div><!-- mailchimp-alerts end -->
						
						<!--=======  End of newsletter formq  =======-->
					</div>
					
					<!--=======  End of widget block  =======-->
				</div>
			</div>
		</div>
	</div>
	
	<!--=======  End of footer navigation  =======-->

	<!--=======  footer copyright  =======-->
	
	<div class="footer-copyright pt-20 pb-20">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 text-center text-md-left mb-20 mb-md-0">
					<!--=======  footer copyright text  =======-->
					
					<div class="footer-copyright-text">
						<p>Copyright &copy; 2018 <a href="http://www.17sucai.com/">Furnilife</a>, All Rights Reserved.</p>
					</div>
					
					<!--=======  End of footer copyright text  =======-->
				</div>
				<div class="col-md-6 text-center text-md-right">
					<!--=======  payment logo  =======-->
					
					<div class="payment-logo">
						<img src="assets/images/payment.png" class="img-fluid" alt="">
					</div>
					
					<!--=======  End of payment logo  =======-->
				</div>
			</div>
		</div>
	</div>
	
	<!--=======  End of footer copyright  =======-->
	<script type="text/javascript">
		$(function(){
			//加载友情链接
			$("#flinks1").html('');
			$("#flinks2").html('');
			$.getJSON(
				'links/queryAllLinksList',function(data){
					if(data.data.length<=6){
						for(var i=0;i<6;i++){
							var item=data.data[i];
							var a='<li><a target="_blank" href="http://'+item.lurl+'">'+item.lname+'</a></li>';
							$("#flinks1").append(a);
						}
					}else{
						for(var i=0;i<6;i++){
							var item=data.data[i];
							var a='<li><a target="_blank" href="http://'+item.lurl+'">'+item.lname+'</a></li>';
							$("#flinks1").append(a);
						}
						for(var i=6;i<data.data.length;i++){
							var item=data.data[i];
							var a='<li><a target="_blank" href="http://'+item.lurl+'">'+item.lname+'</a></li>';
							$("#flinks2").append(a);
						}
					}
				}		
			);
		});
		//发送留言反馈
		function sendMessage(){
			//对留言内容进行控制
			if($("#message").val().length<=10){
				swal({
					text:'留言内容不能少于10个字符',
					icon:'warning'
				});
				return;
			}
			//判断是否绑定邮箱
			if(!checkEmialIsExist()){
				swal({
					  title: "操作提示",
					  text: "您还未绑定邮箱，是否先去个人中心绑定？",
					  icon: "warning",
					  buttons: true,
					}).then((willDelete) => {
					  if (willDelete) {
						  //去个人中心
						  location.href="my-account";
					  }else{
						  sendMsg();
					  }
				});
			}else{
				sendMsg()
			}
		}
		function sendMsg(){
			swal({
				  title: "操作提示",
				  text: "确定回复？",
				  icon: "info",
				  buttons: true,
				}).then((willDelete) => {
				  if (willDelete) {
					  //去个人中心
					  $.ajax({
							url:"leave/sendMessage",
							dataType:"json",
							type:"post",
							data:{"message":$("#message").val()},
							success:function(data){
								if(data.code!=1){
									swal({
										text:data.msg,
										icon:'error'
									});
								}else{
									swal({
										text:'留言反馈成功',
										icon:'success'
									});
								}
							},
							error:function(data){   
				                if(data.responseText=='isAjax'){
				                	window.location.href="login";
				                }
				            }
						});
				  }
			});
		}
		function checkEmialIsExist(){
			var flag=true;
			$.ajax({ 
		        type: "GET", 
		        async: false, 
		        url: 'user/checkEmialIsExistByUid', 
		        success: function(result) {
		        	flag =result.data;
		        }
		    });
			return flag
		}
	</script>
</div>

<!--=====  End of footer  ======-->

   