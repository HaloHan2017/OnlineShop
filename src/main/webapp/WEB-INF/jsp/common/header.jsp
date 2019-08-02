<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String PIC="47.100.123.185"; %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--=============================================
=            header container         =
=============================================-->
<div class="header-container header-sticky">

	<!--=============================================
	=            header top         =
	=============================================-->
	
	<div class="header-top pt-15 pb-15">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-6">
					<div class="header-top-text text-center text-lg-left mb-0 mb-md-15 mb-sm-15">
							<p><i class="icon ion-md-alarm"></i> Ordered before 17:30, shipped today - <span class="support-no">Support: (012) 800 456 789</span></p>
					</div>
				</div>
				<div class="col-12 col-lg-6">
					<!--=======  header top dropdowns  =======-->
						
					<div class="header-top-dropdown d-flex justify-content-center justify-content-lg-end">
							

						<!--=======  single dropdown  =======-->
						<c:if test="${user==null }">
							暂未登录,请先进行<b> <a href="login">登录</a> </b>&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${user!=null }">
							当前登录用户：${user.username }&nbsp;&nbsp;&nbsp;&nbsp;
							<b> <a href="javascript:void(0);" onClick="logout()">注销</a> </b>&nbsp;&nbsp;
						</c:if>
						
						<div class="single-dropdown">
							
							<span class="d-none d-sm-inline-block">Language:</span> <a href="#" id="changeLanguage"><span id="languageName">English <i class="fa fa-angle-down"></i></span></a>
							<div class="language-currency-list hidden" id="languageList">
								<ul>
									<li><a href="#">English</a></li>
									<li><a href="#">Français</a></li>
								</ul>
							</div>
						</div>

						<span class="separator pl-15 pr-15">|</span>
						
						<!--=======  End of single dropdown  =======-->

						<!--=======  single dropdown  =======-->
						
						
						<div class="single-dropdown">
						<span class="d-none d-sm-inline-block">Currency:</span>  <a href="#" id="changeCurrency"><span id="currencyName">USD $ <i class="fa fa-angle-down"></i></span></a>
							<div class="language-currency-list hidden" id="currencyList">
								<ul>
									<li><a href="#">USD $</a></li>
									<li><a href="#">EURO €</a></li>
								</ul>
							</div>
						</div>

						<span class="separator pl-15 pr-15">|</span>
						
						<!--=======  End of single dropdown  =======-->
						

						<!--=======  single dropdown  =======-->
						
						
						<div class="single-dropdown">
							<a href="#" id="changeAccount"><span id="accountMenuName">My Account <i class="fa fa-angle-down"></i></span></a>
							<div class="language-currency-list hidden" id="accountList">
								<ul>
									<li><a href="cart">购物车</a></li>
									<li><a href="checkout">结算</a></li>
									<li><a href="my-account">个人中心</a></li>
									<li><a href="login">登录</a></li>
									<li><a href="my-history">我的足迹</a></li>
								</ul>
							</div>
						</div>
						<!--=======  End of single dropdown  =======-->
					</div>
					<!--=======  End of header top dropdowns  =======-->
				</div>
			</div>
		</div>
	</div>
	
	<!--=====  End of header top  ======-->

	<!--=============================================
	=            导航菜单 top            =
	=============================================-->
	

	<div class="navigation-menu-top pt-35 pb-35 pt-md-15 pb-md-15 pt-sm-15 pb-sm-15">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-6 col-lg-2 col-md-6 col-sm-6 order-1 order-lg-1">
					<!--=======  logo  =======-->
					
					<div class="logo">
						<a href="index">
							<img src="assets/images/logo.png" class="img-fluid" alt="">
						</a>
					</div>
					
					<!--=======  End of logo  =======-->
				</div>
				<div class="col-12 col-lg-8 col-md-12 col-sm-12 order-3 order-lg-2">
					<!--=======  header feature container  =======-->
					
					<div class="header-feature-container mt-md-15 mt-sm-15">
						<!--=======  single feature  =======-->
						
						<div class="single-feature d-flex">
							<div class="image">
								<i class="icon ion-md-globe"></i>
							</div>
							<div class="content">
								<h5>FREE SHIPPING</h5>
								<p>Free shipping on all order</p>
							</div>
						</div>
						
						<!--=======  End of single feature  =======-->	
						<!--=======  single feature  =======-->
						
						<div class="single-feature d-flex">
							<div class="image">
								<i class="icon ion-md-checkmark-circle-outline"></i>
							</div>
							<div class="content">
								<h5>MONEY RETURN</h5>
								<p>Back guarantee under 7 days</p>
							</div>
						</div>
						
						<!--=======  End of single feature  =======-->	
						<!--=======  single feature  =======-->
						
						<div class="single-feature d-flex mb-sm-0">
							<div class="image">
								<i class="icon ion-md-notifications-outline"></i>
							</div>
							<div class="content">
								<h5>MEMBER DISCOUNT</h5>
								<p>On every order over $120.00</p>
							</div>
						</div>
						
						<!--=======  End of single feature  =======-->	

						
					</div>
					
					<!--=======  End of header feature container  =======-->

					
				</div>
				<div class=" col-6 col-lg-2 col-md-6 col-sm-6 order-2 order-lg-3">
					<!--=======  cart icon  =======-->
					
					<div class="minicart-section">
						<a href="#" id="cart-icon">
							<span class="image"><i class="icon ion-md-cart"></i></span>
							<h5>$0.00 <i class="fa fa-angle-down"></i></h5>
							<p>0 件商品</p>
						</a>

						<!-- cart floating box -->
						<div class="cart-floating-box hidden" id="cart-floating-box">
							<div class="cart-items">
								<!-- <div class="cart-float-single-item d-flex">
									<span class="remove-item" id="remove-item"><a href="#"><i class="icon ion-md-close"></i></a></span>
									<div class="cart-float-single-item-image">
										<a href="single-product.html"><img src="assets/images/products/product01.jpg" class="img-fluid" alt=""></a>
									</div>
									<div class="cart-float-single-item-desc">
										<p class="product-title"> <a href="single-product.html">Duis pulvinar obortis eleifend </a></p>
										<p class="quantity"> Qty: 1</p>
										<p class="price">$20.50</p>
									</div>
								</div> -->
								
							</div>
							<div class="cart-calculation">
								<div class="calculation-details">
									<p class="total">Subtotal <span>$0.00</span></p>
								</div>
								<div class="floating-cart-btn text-center">
									<a class="fl-btn pull-left" href="cart">View Cart</a>
									<a class="fl-btn pull-right" href="checkout">Checkout</a>
								</div>
							</div>
						</div>
						<!-- end of cart floating box -->
					</div>
					
					<!--=======  End of cart icon  =======-->
				</div>
			</div>
		</div>
	</div>
	
	<!--=======  End of navigation menu top  =======-->

	<!--=============================================
	=            导航菜单         =
	=============================================-->
	
	<div class="navigation-menu">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-12 col-lg-3 col-md-12 col-sm-12">
					<!--=======  category menu  =======-->
					
					<div class="hero-side-category">
						<!-- Category Toggle Wrap -->
						<div class="category-toggle-wrap">
							<!-- Category Toggle -->
							<button class="category-toggle"> <i class="fa fa-bars"></i> CATEGORIES </button>
						</div>

						<!-- 菜单按钮 -->
						<nav class="category-menu">
							<!-- <ul>
								<li><a href="shop-left-sidebar.html">Sofas &amp; Chairs</a></li>
								<li class="menu-item-has-children"><a href="shop-left-sidebar.html">Drawing Room</a>
									category submenu
									<ul class="category-mega-menu">
										<li><a href="shop-left-sidebar.html">Sofas</a></li>
										<li><a href="shop-left-sidebar.html">Armchairs</a></li>
										<li><a href="shop-left-sidebar.html">Dining Chairs &amp; Benches</a></li>
										<li><a href="shop-left-sidebar.html">Desk Chairs</a></li>
									</ul>
								</li>
								<li class="menu-item-has-children"><a href="shop-left-sidebar.html">Dinning Room</a>
									category submenu
									<ul class="category-mega-menu">
										<li><a href="shop-left-sidebar.html">Sofas</a></li>
										<li><a href="shop-left-sidebar.html">Armchairs</a></li>
										<li><a href="shop-left-sidebar.html">Dining Chairs &amp; Benches</a></li>
										<li><a href="shop-left-sidebar.html">Desk Chairs</a></li>
									</ul>
								</li>
								<li><a href="shop-left-sidebar.html">Out Door Room</a></li>
								<li><a href="shop-left-sidebar.html">Room living</a></li>
								<li><a href="shop-left-sidebar.html">Estilo</a></li>
								<li><a href="shop-left-sidebar.html">Living Chairs</a></li>
								<li class="hidden"><a href="shop-left-sidebar.html">New Sofas</a></li>
								<li class="hidden"><a href="shop-left-sidebar.html">Sleight Sofas</a></li>
								<li><a href="#" id="more-btn">... More</a></li>
							</ul> -->
						</nav>
					</div>
					
					<!--=======  End of category menu =======-->

					<!--=======  sticky logo  =======-->
					
					<div class="sticky-logo">
						<a href="index">
							<img src="assets/images/logo.png" class="img-fluid" alt="">
						</a>
					</div>
					
					<!--=======  End of sticky logo  =======-->

					<!--=======  search icon for tablet  =======-->
                               
					<div class="search-icon-menutop-tablet text-right d-inline-block d-lg-none">
						<a href="#" id="search-overlay-active-button">
							<i class="icon ion-md-search"></i>
						</a>
					</div>
					
					<!--=======  End of search icon for tablet  =======-->
				</div>
				<div class="col-12 col-lg-6">
					<!-- navigation section -->
					<div class="main-menu">
						<nav>
							<ul>
								<li class="active menu-item"><a href="index">HOME</a></li>
								<li class="menu-item-has-children"><a href="#">PAGES</a>
									<ul class="mega-menu three-column">
										<li><a href="#">Column One</a>
											<ul>
												<li><a href="cart">Cart</a></li>
												<li><a href="checkout">Checkout</a></li>
												<li><a href="wishlist">Wishlist</a></li>
												
											</ul>
										</li>
										<li><a href="#">Column Two</a>
											<ul>
												<li><a href="my-account">My Account</a></li>
												<li><a href="login">Login</a></li>
												<li><a href="register">Register</a></li>
											</ul>
										</li>
										<li class="megamenu-banner text-center d-none d-lg-block">
											<a href="shop-left-sidebar.html">
												<img src="assets/images/banners/megamenu-banner.jpg" class="img-fluid" alt="">
											</a>
										</li>
									</ul>
								</li>
								<li><a href="javascript:void(0);">CONTACT</a></li>
							</ul>
						</nav>
					</div>
					<!-- end of navigation section -->
				</div>
				<div class="col-12 col-lg-3">
					<!--=======  navigation search bar  =======-->
					
					<div class="navigation-search d-none d-lg-block">
							<input id="search" type="search" placeholder="Search product ...">
						<button onclick="searchLike()"><i class="icon ion-md-search"></i></button>
					</div>
					
					<!--=======  End of navigation search bar  =======-->
				</div>
				<div class="col-12 d-block d-lg-none">
					<!-- Mobile Menu -->
					<div class="mobile-menu"></div>
				</div>
			</div>
		</div>
	</div>
	<!--=====  End of navigation menu  ======-->
	<script src="assets/js/vendor/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		showCartIcon();
	});
	function showCartIcon(){
		$(".cart-items").html('');
		$.getJSON('cart/query', function(data){
			if(data.data==null){return;}
			if(data.data.citemList==null) return;
			var citemList=data.data.citemList;
			var totalMoney=data.data.totalMoney;
			$("#cart-icon").find("h5").html(totalMoney+'<i class="fa fa-angle-down"></i>');
			$("#cart-icon").find("p").html(citemList.length+'件商品');
			$(".cart-calculation").find("div").find("p").find("span").html(totalMoney);
			var limitLen = citemList.length;
			
			for(var i=0;i<citemList.length;i++){
				if(i>2){
					$(".cart-items").append("至多显示3个");
					return;//只显示3个
				}
				var div=
					'<div class="cart-float-single-item d-flex">'
						+'<span class="remove-item" id="remove-item"><a href="javascript:void(0);" onClick="delItemByPid('+citemList[i].product.pid+')"><i class="icon ion-md-close"></i></a></span>'
						+'<div class="cart-float-single-item-image">'
							+'<a href="product?pid="'+citemList[i].product.pid+'"><img src="'+citemList[i].product.pimage+'" class="img-fluid" alt=""></a>'
						+'</div>'
						+'<div class="cart-float-single-item-desc">'
							+'<p class="product-title"> <a href="product?pid="'+citemList[i].product.pid+'>'+citemList[i].product.pname+'</a></p>'
							+'<p class="quantity"> Qty: '+citemList[i].pcount+'</p>'
							+'<p class="price">$'+citemList[i].product.discPrice+'</p>'
						+'</div>'
					+'</div>';
				
					$(".cart-items").append(div);
			}
		});
	}
	//删除购物车item
	function delItemByPid(pid){
		$.getJSON('cart/del',{'pid':pid}, function(data){
			if(data.code!=1){
				swal({
					 text: '服务器忙',  
			         icon: 'info' 
				});
			}else{
				showCartIcon();
			}
		});
	}
	
	function logout(){
		swal({
			  title: "操作提示",
			  text: "确定注销？",
			  icon: "warning",
			  buttons: true,
			}).then((willDelete) => {
			  if (willDelete) {
				  $.getJSON('user/logout', function(data){
						swal({
							 text: '注销成功',  
					         icon: 'success' 
						});
						location.href="index";
					});
			  }
		});
		
	}

	</script>

	
</div>
<!--=====  End of header container  ======-->


