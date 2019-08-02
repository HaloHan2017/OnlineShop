<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
	<!-- 引入header.jsp -->
	<%@ include file="common/links.jsp" %>

</head>

<body>

	<!-- 引入header.jsp  -->
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
								<li>Product</li>
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
    =            single product content         =
    =============================================-->
    
    <div class="single-product-content-area mb-50">
        <div class="container"> 
            <div class="row">
                <div class="col-lg-5 col-md-6 col-xs-12 mb-xxs-25 mb-xs-25 mb-sm-25">
                    <!-- single product tabstyle one image gallery -->
                    <div class="product-image-slider fl-product-image-slider fl3-product-image-slider">
                        <!--product large image start -->
                        <div class="tab-content product-large-image-list fl-product-large-image-list fl3-product-large-image-list" id="myTabContent">
                            <div class="tab-pane fade show active" id="single-slide-1" role="tabpanel" aria-labelledby="single-slide-tab-1">
                                <!--Single Product Image Start-->
                                <div class="single-product-img img-full">
                                    <img src="${singlepro.pimage }" class="img-fluid" alt="">
                                    <a href="${singlepro.pimage }" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                                </div>
                                <!--Single Product Image End-->
                            </div>
                            <%-- <div class="tab-pane fade" id="single-slide-2" role="tabpanel" aria-labelledby="single-slide-tab-2">
                                <!--Single Product Image Start-->
                                <div class="single-product-img img-full">
                                    <img src="assets/images/single-product-slider/02.jpg" class="img-fluid" alt="">
                                    <a href="assets/images/single-product-slider/02.jpg" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                                </div>
                                <!--Single Product Image End-->
                            </div>
                            <div class="tab-pane fade" id="single-slide-3" role="tabpanel" aria-labelledby="single-slide-tab-3">
                                <!--Single Product Image Start-->
                                <div class="single-product-img img-full">
                                    <img src="assets/images/single-product-slider/03.jpg" class="img-fluid" alt="">
                                    <a href="assets/images/single-product-slider/03.jpg" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                                </div>
                                <!--Single Product Image End-->
                            </div>
                            <div class="tab-pane fade" id="single-slide-4" role="tabpanel" aria-labelledby="single-slide-tab-4">
                                <!--Single Product Image Start-->
                                <div class="single-product-img img-full">
                                    <img src="assets/images/single-product-slider/04.jpg" class="img-fluid" alt="">
                                    <a href="assets/images/single-product-slider/04.jpg" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                                </div>
                                <!--Single Product Image End-->
                            </div>
                            <div class="tab-pane fade" id="single-slide-5" role="tabpanel" aria-labelledby="single-slide-tab-5">
                                <!--Single Product Image Start-->
                                <div class="single-product-img img-full">
                                    <img src="${singlepro.pimage }" class="img-fluid" alt="">
                                    <a href="assets/images/single-product-slider/05.jpg" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                                </div>
                                <!--Single Product Image End-->
                            </div> --%>
                        </div>
                        <!--product large image End-->

                        <!--product small image slider Start-->
                        <div class="product-small-image-list fl-product-small-image-list fl3-product-small-image-list"> 
                            <div class="nav small-image-slider fl3-small-image-slider" role="tablist">
                                <div class="single-small-image img-full">
                                    <a data-toggle="tab" id="single-slide-tab-1" href="#single-slide-1"><img src="${singlepro.pimage }"
                                        class="img-fluid" alt=""></a>
                                </div>
                               <!--  
                               
                               <div class="single-small-image img-full">
                                    <a data-toggle="tab" id="single-slide-tab-2" href="#single-slide-2"><img src="assets/images/single-product-slider/02.jpg"
                                        class="img-fluid" alt=""></a>
                                </div>
                                <div class="single-small-image img-full">
                                    <a data-toggle="tab" id="single-slide-tab-3" href="#single-slide-3"><img src="assets/images/single-product-slider/03.jpg"
                                        class="img-fluid" alt=""></a>
                                </div>
                                <div class="single-small-image img-full">
                                    <a data-toggle="tab" id="single-slide-tab-4" href="#single-slide-4"><img src="assets/images/single-product-slider/04.jpg"
                                        alt=""></a>
                                </div>
                                <div class="single-small-image img-full">
                                    <a data-toggle="tab" id="single-slide-tab-5" href="#single-slide-5"><img src="assets/images/single-product-slider/05.jpg"
                                        alt=""></a>
                                </div> -->
                            </div>
                        </div>
                        <!--product small image slider End-->
                    </div>
                    <!-- end of single product tabstyle one image gallery -->
                </div>
                <div class="col-lg-7 col-md-6 col-xs-12">
                    <!-- product view description -->
                    <div class="product-feature-details">
                        <h2 class="product-title mb-15">${singlepro.pname}</h2>

                        <div class="rating d-inline-block mb-15">
                            <c:forEach var="i" begin="1" end="${singlepro.avgstar}" step="1">
                        	<span><i class="fa fa-star active"></i></span>
                          </c:forEach>
                          <c:forEach var="i" begin="${singlepro.avgstar+1}" end="5" step="1">
                        	<span><i class="fa fa-star"></i></span>
                          </c:forEach>
                        </div>

                        <p class="d-inline-block ml-10 review-link"><a href="#">(浏览量：${singlepro.viewCount } )</a></p>

                        <h2 class="product-price mb-0"> 
                            <!-- <span class="main-price discounted">$12.90</span>  -->
                            <span class="discounted-price"> $ ${singlepro.discPrice }</span>
                        </h2>

                        <p class="product-description mb-20">${singlepro.pdesc }</p>
                        
                        <div class="cart-buttons mb-20">
                            <span class="quantity-title mr-10">Quantity: </span>
                            <div class="pro-qty mb-20">
                                <input type="text" value="1" readonly="readonly" id="quantity">
                            </div>
                            <div class="add-to-cart-btn d-block">
                                <a class="fl-btn" href="javascript:void(0);" onClick="addProdToCart(${singlepro.pid })">
                                	<i class="fa fa-shopping-cart"></i> Add to Cart
                                </a>
                            </div>
                        </div>

                        <p class="wishlist-link mb-20 pb-15" id="${singlepro.pid}">
                            <a href="javascript:void(0);" onClick="addfavorite(${singlepro.pid})">
                            	<i class="icon ion-md-heart" ></i> Browse Wishlist
                          	</a>
                        </p>
                        <div class="social-share-buttons">
                            <h3>share this product</h3>
                            <ul>
                                <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a class="google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a class="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- end of product quick view description -->
                </div>
            </div>
        </div>
    </div>
    
    <!--=====  End of single product content  ======-->

    <!--=======  product description review   =======-->
    
    <div class="product-description-review-area mb-50">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!--=======  product description review container  =======-->
                    
                    <div class="tab-slider-wrapper product-description-review-container">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="description-tab" data-toggle="tab" href="#product-description" role="tab"
                                    aria-selected="true">Description</a>
					
                                <a class="nav-item nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab"
                                    aria-selected="false">Review</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
			    <div class="tab-pane fade show active" id="product-description" role="tabpanel" aria-labelledby="description-tab">
                                <!--=======  product description  =======-->
                                
                                <div class="product-description">
                                    <c:if test="${singlepro.pdesc==null}">
                                    		<p>此商品暂无商品描述</p>
                                   	</c:if>
                                   	<c:if test="${singlepro.pdesc!=null}">
                                   		<p>${singlepro.pdesc}</p>
                                   	</c:if>
                                    
                                </div>
                                
                                <!--=======  End of product description  =======-->
                            </div>
	
                            <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                                <!--=======  review content  =======-->
                                
                                <div class="product-ratting-wrap">
                                    <div class="pro-avg-ratting">
                                        <h4>${singlepro.avgstar} <span>(Overall)</span></h4>
                                        <span id="countcomm"></span>
                                    </div>
                                    <div class="ratting-list">
                                        <div class="sin-list float-left">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <span>(5)</span>
                                        </div>
                                        <div class="sin-list float-left">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <span>(4)</span>
                                        </div>
                                        <div class="sin-list float-left">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <span>(3)</span>
                                        </div>
                                        <div class="sin-list float-left">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <span>(2)</span>
                                        </div>
                                        <div class="sin-list float-left">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <span>(1)</span>
                                        </div>
                                    </div>
                                    <div class="rattings-wrapper" id="comm">

                                    </div>
                                    
                                </div>
                                
                                <!--=======  End of review content  =======-->
                            </div>
                        </div>
                    </div>
                    
                    <!--=======  End of product description review container  =======-->
			 <!--=============================================
    =            related product slider         =
    =============================================-->
    
    <div class="related-product-slider-area mb-50">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
					<!--=======  section title  =======-->
					
					<div class="section-title">
						<h2>RELATED PRODUCTS</h2>
					</div>
					
					<!--=======  End of section title  =======-->
				</div>
            </div>
            <div class="row">
                <div class="col-lg-12" >
                    <!--=======  tab product slider  =======-->
								
                    <div class="fl-slider tab-product-slider">
                        <!--=======  single product  =======-->
                        <c:forEach  items="${relatepro}" var="product">
                        <div class="fl-product">
                            <div class="image sale-product">
                                <a href="product?pid=${product.pid}&avgstar=${product.avgstar}&cid=${product.cid}">
                                    <img src="${product.pimage}" class="img-fluid" alt="">
                                    <img src="${product.pimage}" class="img-fluid" alt="">
                                </a>
                                
                            </div>
                            <div class="content">
                                <h2 class="product-title"> <a href="single-product.html">${product.pname}</a></h2>
                                <div class="rating">
                                    <c:forEach var="i" begin="1" end="${product.avgstar}" step="1">
			                        	<span><i class="fa fa-star active"></i></span>
			                        </c:forEach>
			                        <c:forEach var="i" begin="${product.avgstar+1}" end="5" step="1">
			                        	<span><i class="fa fa-star"></i></span>
			                        </c:forEach>
                                </div>
                                <p class="product-price">
                                    <span class="discounted-price">$${product.discPrice}</span>
                                </p>

                                <!-- <div class="hover-icons">
                                    <ul>
                                        <li><a href="#"  data-tooltip="Add to Cart"><i class="icon ion-md-cart"></i></a></li>
                                        <li><a href="#"  data-tooltip="Compare"><i class="icon ion-md-options"></i></a></li>
                                        <li><a href="#"  data-toggle = "modal" data-target="#quick-view-modal-container" data-tooltip="Quick View"><i class="icon ion-md-open"></i></a></li>
                                    </ul>
                                </div> -->
                            </div>
                        </div>
                        </c:forEach>
                        <!--=======  End of single product  =======-->
                    </div>
                    
                    <!--=======  End of tab product slider  =======-->
                </div>
            </div>
        </div>
    </div>
     <!--=====  End of related product slider  ======-->
                </div>
            </div>
        </div>
    </div>
    <!--=======  End of product description review   =======-->
	<!-- 引入footer.jsp -->
	<%@ include file="common/footer.jsp" %>
	
	<!--=============================================
	=            search overlay         =
	=============================================-->
	
	<div class="search-overlay" id="search-overlay">
		<a href="javascript:void(0);" class="search-overlay-close" id="search-overlay-close"><i class="fa fa-times"></i></a>
		<div class="search-box">
			<input type="search" placeholder="Search entire store here">
			<button><i class="icon ion-md-search"></i></button>
		</div>
	</div>
		
	<!--=====  End of search overlay  ======-->

	<!-- scroll to top  -->
	<a href="javascript:void(0);" class="scroll-top"></a>
	<!-- end of scroll to top -->


	<!--=============================================
	=            Quick view modal         =
	=============================================-->
	
	<div class="modal fade quick-view-modal-container" id="quick-view-modal-container" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-5 col-md-6 col-xs-12 mb-xxs-25 mb-xs-25 mb-sm-25">
							<!-- single product tabstyle one image gallery -->
							<div class="product-image-slider fl-product-image-slider fl3-product-image-slider quickview-product-image-slider">
								<!--product large image start -->
								<div class="tab-content product-large-image-list fl-product-large-image-list fl3-product-large-image-list quickview-product-large-image-list" id="myTabContent2">
									<div class="tab-pane fade show active" id="single-slide-1-q" role="tabpanel" aria-labelledby="single-slide-tab-1-q">
										<!--Single Product Image Start-->
										<div class="single-product-img img-full">
											<img src="assets/images/single-product-slider/01.jpg" class="img-fluid" alt="">
										</div>
										<!--Single Product Image End-->
									</div>
									<div class="tab-pane fade" id="single-slide-2-q" role="tabpanel" aria-labelledby="single-slide-tab-2-q">
										<!--Single Product Image Start-->
										<div class="single-product-img img-full">
											<img src="assets/images/single-product-slider/02.jpg" class="img-fluid" alt="">
										</div>
										<!--Single Product Image End-->
									</div>
									<div class="tab-pane fade" id="single-slide-3-q" role="tabpanel" aria-labelledby="single-slide-tab-3-q">
										<!--Single Product Image Start-->
										<div class="single-product-img img-full">
											<img src="assets/images/single-product-slider/03.jpg" class="img-fluid" alt="">
										</div>
										<!--Single Product Image End-->
									</div>
									<div class="tab-pane fade" id="single-slide-4-q" role="tabpanel" aria-labelledby="single-slide-tab-4-q">
										<!--Single Product Image Start-->
										<div class="single-product-img img-full">
											<img src="assets/images/single-product-slider/04.jpg" class="img-fluid" alt="">
										</div>
										<!--Single Product Image End-->
									</div>
									<div class="tab-pane fade" id="single-slide-5-q" role="tabpanel" aria-labelledby="single-slide-tab-5-q">
										<!--Single Product Image Start-->
										<div class="single-product-img img-full">
											<img src="assets/images/single-product-slider/05.jpg" class="img-fluid" alt="">
										</div>
										<!--Single Product Image End-->
									</div>
								</div>
								<!--product large image End-->
		
								<!--product small image slider Start-->
								<div class="product-small-image-list fl-product-small-image-list fl3-product-small-image-list quickview-product-small-image-list"> 
									<div class="nav small-image-slider fl3-small-image-slider" role="tablist">
										<div class="single-small-image img-full">
											<a data-toggle="tab" id="single-slide-tab-1-q" href="#single-slide-1-q"><img src="assets/images/single-product-slider/01.jpg"
												class="img-fluid" alt=""></a>
										</div>
										<div class="single-small-image img-full">
											<a data-toggle="tab" id="single-slide-tab-2-q" href="#single-slide-2-q"><img src="assets/images/single-product-slider/02.jpg"
												class="img-fluid" alt=""></a>
										</div>
										<div class="single-small-image img-full">
											<a data-toggle="tab" id="single-slide-tab-3-q" href="#single-slide-3-q"><img src="assets/images/single-product-slider/03.jpg"
												class="img-fluid" alt=""></a>
										</div>
										<div class="single-small-image img-full">
											<a data-toggle="tab" id="single-slide-tab-4-q" href="#single-slide-4-q"><img src="assets/images/single-product-slider/04.jpg"
												alt=""></a>
										</div>
										<div class="single-small-image img-full">
											<a data-toggle="tab" id="single-slide-tab-5-q" href="#single-slide-5-q"><img src="assets/images/single-product-slider/05.jpg"
												alt=""></a>
										</div>
									</div>
								</div>
								<!--product small image slider End-->
							</div>
							<!-- end of single product tabstyle one image gallery -->
						</div>
						<div class="col-lg-7 col-md-6 col-xs-12">
							<!-- product quick view description -->
							<div class="product-feature-details">
								<h2 class="product-title mb-15">Kaoreet lobortis sagittis</h2>

								<h2 class="product-price mb-15"> 
									<span class="main-price discounted">$12.90</span> 
									<span class="discounted-price"> $10.00</span>
									<span class="discount-percentage">Save 8%</span>
								</h2>

								<p class="product-description mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco,Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus</p>
								

								<div class="cart-buttons mb-20">
									<div class="pro-qty mr-10">
										<input type="text" value="1">
									</div>
									<div class="add-to-cart-btn">
										<a href="javascript:void(0);"  class="fl-btn"><i class="fa fa-shopping-cart"></i> Add to Cart</a>
									</div>
								</div>

						
								<div class="social-share-buttons">
									<h3>share this product</h3>
									<ul>
										<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a class="google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
										<li><a class="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
									</ul>
								</div>
							</div>
							<!-- end of product quick view description -->
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--=====  End of Quick view modal  ======-->

	<!-- 引入links_js.jsp -->
	<%@ include file="common/links_js.jsp" %>
	<script type="text/javascript">
	//添加商品到购物车
	function addProdToCart(pid){
		var ret =checkProdInCart(pid);
		if(ret=='error'){
			swal({  
	            text: "服务器繁忙，请稍后再试",  
	            icon: "info" 
	       });
		}else if(ret=='true'){
			  swal({  
		            text: "此商品已在购物车中",  
		            icon: "info" 
		       });
			  return;
		}
		//拿到 商品的 数量()进行js校验
		var pcount=$("#quantity").val();
		if(pcount<=0){
			$("#quantity").val(1);
			pcount=1;
		}
		$.ajax({ 
	        type: "GET", 
	        data: {'pid':pid,'pcount':pcount}, 
	        url: 'cart/add', 
	        success: function(data) {
	        	var type='success';
				if(data.code!=1){
					type='error';
				}
				swal({  
		            text: data.msg,  
		            icon: type 
		        });
				//刷新 购物车icon
				showCartIcon();
	        },error:function(data){   
	            if(data.responseText=='isAjax'){
	            	window.location.href="login";
	            }
	        }
	    });
	}
	//添加之前，判断是否已在购物车
	function checkProdInCart(pid){
		var flag='true';
		$.ajax({ 
	        type: "GET", 
	        data: {'pid':pid}, 
	        async: false, 
	        url: 'cart/checkProd', 
	        success: function(result) {
	        	if(result.code==-1){
	        		return 'error';
	        	}
	        	if(!result.data){
	        		flag='false';
	        	}
	        },error:function(data){   
	            if(data.responseText=='isAjax'){
	            	window.location.href="login";
	            }
	        }
	    });
		return flag;
	}
	function addLike(commId){
		$.ajax({
			url:"comment/addLikeComment",
			dataType:"json",
			type:"post",
			data:{"commId":commId},
			success:function(data){
				if(data.code==1){
					$("#commid").empty();
					$("#commid").append('<a href="javascript:void(0);" onclick="delLike('+commId+')"><i class="icon ion-md-heart" style="color: red"></i></a><span>（'+data.data.length+'）</span>');
				}
			},
			error:function(data){   
                if(data.responseText=='isAjax'){
                	window.location.href="login";
                }
            }
		});
	}
	function delLike(commId){
		$.ajax({
			url:"comment/delLikeComment",
			dataType:"json",
			type:"post",
			data:{"commId":commId},
			success:function(data){
				if(data.code==1){
					$("#commid").empty();
					$("#commid").append('<a href="javascript:void(0);" onclick="addLike('+commId+')"><i class="icon ion-md-heart"></i></a><span>（'+data.data.length+'）</span>');
				}
			}
		});
	}
	$(function(){
		var pid = "${singlepro.pid}";
		var uid = "${user.uid}";
		if(uid!=""){
		$.ajax({
			url:"selectfavorite",
			data:{"uid":uid},
			dataType:"json",
			type:"post",
			success:function(data){
				$.each(data.data,function(i,product){
					if(product.pid==pid){
						$("#"+pid+"").empty();
						$("#"+pid+"").append('<a href="javascript:void(0);"  data-tooltip="已收藏" onclick="delfavorite('+uid+','+pid+')"><i class="icon ion-md-heart" style="color: red"></i>Browse Wishlist</a>');
						return false;
					}else{
						$("#"+pid+"").empty();
						$("#"+pid+"").append('<a href="javascript:void(0);"  data-tooltip="收藏" onclick="addfavorite('+pid+')"><i class="icon ion-md-heart"></i>Browse Wishlist</a>');
					}
				})
			}
		})
		}
		$.ajax({
			url:"comment/selectAllComment",
			data:{"pid":pid},
			dataType:"json",
			type:"post",
			success:function(cdata){
				$("#countcomm").append('Based on '+cdata.data.length+' Comments');
				if(cdata.code==1){
					console.log(cdata.data);
						$.each(cdata.data,function(i,comment){
						console.log(comment);
						$.ajax({
							url:"comment/selectLike",
							data:{"commId":comment.commId},
							dataType:"json",
							type:"post",
							success:function(ldata){
								console.log(ldata);
								var likecount = ldata.data.length;
								if(uid!=""){
									if(ldata.code==1 && ldata.data.length>0){
										$.each(ldata.data,function(i,luid){
											if(luid==uid){
												Comment(comment,likecount);
											}else{
												showComment(comment,likecount);
											}
										})
									}else{
										showComment(comment,likecount);
									}
								}else{
										showComment(comment,likecount);
								}
							}
						});
					})	
				}else{
					$("#comm").empty();
					$("#comm").html('此商品暂无评价');
				}
			}
		}) 
	})
	function Comment(comment,likecount){
		$("#comm").append('<div class="sin-rattings">'+
                '<div class="ratting-author">'+
                '<h3>'+comment.user.name+'</h3>'+
                '<div class="rating d-inline-block mb-15">');
					for(var i=1;i<=comment.commStars;i++){
						$("#comm").append('<i class="fa fa-star"></i>');
			    	}
			    	for(var i=1;i<=(5-comment.commStars);i++){
			    		$("#comm").append('<i class="fa fa-star-o"></i>');
			    	}
			$("#comm").append('</div>'+
                '</div>'+
            
            '<p>'+comment.commContent+'</p>'+
            '<div style="float: right" id="commid"><a href="javascript:void(0);" onclick="delLike('+comment.commId+')"><i class="icon ion-md-heart" style="color: red"></i></a><span>（'+likecount+'）</span></div>'+
            
        '</div>')
	}
	function showComment(comment,likecount){
		console.log(comment);
		$("#comm").append('<div class="sin-rattings">'+
                '<div class="ratting-author">'+
                '<h3>'+comment.user.name+'</h3>'+
                '<div class="rating d-inline-block mb-15">');
				for(var i=1;i<=comment.commStars;i++){
					$("#comm").append('<i class="fa fa-star"></i>');
		    	}
		    	for(var i=1;i<=(5-comment.commStars);i++){
		    		$("#comm").append('<i class="fa fa-star-o"></i>');
		    	}
    
        $("#comm").append('</div>'+
                
            '</div>'+
            '<p>'+comment.commContent+'</p>'+
            '<div style="float: right" id="commid"><a href="javascript:void(0);" '
            +'onclick="addLike('+comment.commId+')"><i class="icon ion-md-heart" ></i></a><span>（'+likecount+'）</span></div>'+
            
        '</div>');
	}
	
	//收藏商品
	function addfavorite(pid){
		var uid = "${user.uid}";
		$.ajax({
			url:"addfavorite",
			dataType:"json",
			type:"post",
			data:{"pid":pid,
				"uid":uid},
			success:function(data){
				if(data==1){
					$("#"+pid+"").empty();
					$("#"+pid+"").append('<a href="javascript:void(0);"  data-tooltip="已收藏" onclick="delfavorite('+uid+','+pid+')"><i class="icon ion-md-heart" style="color: red"></i>Browse Wishlist</a>');
				}
			},
			error:function(data){   
                if(data.responseText=='isAjax'){
                	window.location.href="login";
                }
            }
		});
	}
	//删除商品收藏
	function delfavorite(uid,pid){
		$.ajax({
			url:"delfavorite",
			dataType:"json",
			type:"post",
			data:{"uid":uid,
				"pid":pid},
			success:function(data){
				if(data==1){
					$("#"+pid+"").empty();
					$("#"+pid+"").append('<a href="javascript:void(0);"  data-tooltip="收藏" onclick="addfavorite('+pid+')"><i class="icon ion-md-heart"></i>Browse Wishlist</a>');
				}
			}
		});
	}
</script>
</body>

</html>
    