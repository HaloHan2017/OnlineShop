<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
							<li class="parent-page">Home</li>
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
    =            shop page content         =
    =============================================-->

<div class="shop-page-content mb-50">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 order-2 order-lg-1">
                <!--=======  page sidebar   =======-->
                
                <div class="page-sidebar">
                    <!--=======  single sidebar block  =======-->
                    
                    <div class="single-sidebar">
                        <h3 class="sidebar-title">产品类别</h3>
						<!-- 商品类别列表 -->
                        <div class="category">
                            <ul id="categoryul">
                            </ul>
                        </div>
                    </div>
                    
                    <!--=======  End of single sidebar block  =======-->

                    <!--=======  single sidebar block  =======-->
                    
                    <div class="single-sidebar price-range-bg">
                        <h3 class="sidebar-title filter-price-title">FILTER BY PRICE</h3>
                        <div class="sidebar-price">
							<div id="price-range" onmouseup="selectByPrice()"></div>
							<input type="text" id="price-amount" class="price-amount" readonly>
						</div>
                    </div>
                    
                    <!--=======  End of single sidebar block  =======-->

                    <!--=======  single sidebar block  =======-->
                    
                    <!-- <div class="single-sidebar mb-30">
                        <h3 class="sidebar-title color-title">COLOR</h3>
                        <div class="color-category">
                            <ul>
                                <li><a href="shop-left-sidebar.html">Black</a> <span class="counter">(2)</span></li>
                                <li><a href="shop-left-sidebar.html">Blue</a> <span class="counter">(4)</span></li>
                                <li><a href="shop-left-sidebar.html">Red</a> <span class="counter">(1)</span></li>
                                <li><a href="shop-left-sidebar.html">Yellow</a> <span class="counter">(5)</span></li>
                            </ul>
                        </div>
                    </div> -->
                    
                    <!--=======  End of single sidebar block  =======-->

                    <!--=======  single sidebar block  =======-->
                    
                    <!-- <div class="single-sidebar mb-30">
                        <h3 class="sidebar-title">COMPARE PRODUCTS</h3>
                        =======  compare product container  =======
			
						<ul class="product-list">
                            <li>
                                <a href="product" class="remove" title="Remove">x</a>
                                <a class="title" href="product">Cillum dolore tortor nisl</a>
                            </li>
                            <li>
                                <a href="product" class="remove" title="Remove">x</a>
                                <a class="title" href="product">Condimentum posuere</a>
                            </li>
                        </ul>
                        <div class="compare-btns">
                            <a href="#" class="clear-all">Clear all</a>
                            <a href="#" class="compare">Compare <i class="fa fa-check"></i></a>
                        </div>
                        =======  End of compare product container  =======
                    </div> -->
                    
                    <!--=======  End of single sidebar block  =======-->

                    <!--=======  single sidebar block  =======-->
                    
                    <!-- <div class="single-sidebar">
                        <h3 class="sidebar-title">POPULAR TAGS</h3>
                        
                        =======  tag container  =======
			
						<ul class="tag-container">
                            <li><a href="shop-left-sidebar.html">new</a> </li>
                            <li><a href="shop-left-sidebar.html">bags</a> </li>
                            <li><a href="shop-left-sidebar.html">new</a> </li>
                            <li><a href="shop-left-sidebar.html">kids</a> </li>
                            <li><a href="shop-left-sidebar.html">fashion</a> </li>
                            <li><a href="shop-left-sidebar.html">Accessories</a> </li>
                        </ul>
                        
                        =======  End of tag container  =======
                    </div> -->
                    
                    <!--=======  End of single sidebar block  =======-->
                </div>
                
                <!--=======  End of page sidebar   =======-->
            </div>
            <div class="col-lg-9 order-1 order-lg-2">
                <!--=======  slider banner  =======-->
                
                <div class="slider-banner home-one-banner banner-bg banner-bg-1 mb-30">
                    <div class="banner-text">
                        <p>Look of The Week</p>
                        <p class="big-text">Lamps Light Color</p>
                        <p>Only from $209</p>
                    </div>
                </div>
                
                <!--=======  End of slider banner  =======-->

                <!--=======  Shop header  =======-->
	
				<div class="shop-header mb-30">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 d-flex align-items-center">
                            <!--=======  view mode  =======-->
                            
                            <div class="view-mode-icons mb-xs-10">
                                <a class="active" href="#" data-target="grid"><i class="icon ion-md-apps"></i></a>
                                <a href="#" data-target="list"><i class="icon ion-ios-list"></i></a>
                            </div>
                            
                            <!--=======  End of view mode  =======-->
                            
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12 d-flex flex-column flex-sm-row justify-content-between align-items-left align-items-sm-center">
                            <!--=======  Sort by dropdown  =======-->
                            
                            <div class="sort-by-dropdown d-flex align-items-center mb-xs-10">
                                <p class="mr-10 mb-0">Sort By: </p>
                                <select name="sort-by" id="sort-by" class="nice-select">
                                    <option value="1">Sort By Average Rating</option>
                                    <option value="2">Sort By Newness</option>
                                    <option value="3">Sort By Price: Low to High</option>
                                    <option value="4">Sort By Price: High to Low</option>
                                </select>
                            </div>
                            
                            <!--=======  End of Sort by dropdown  =======-->

                            
                        </div>
                    </div>
                </div>
                
                <!--=======  End of Shop header  =======-->

                <!--=======  shop product display area  =======-->
                <div class="shop-product-wrap grid row mb-30 no-gutters" id="showproduct">
                    
                </div>
                
                
                <!--=======  End of shop product display area  =======-->

                <!--=======  pagination area  =======-->
                
                <div class="pagination-area mb-md-50 mb-sm-50">
                    <!--翻页-->
					<div class="zxf_pagediv"></div>
                </div>
                
                <!--=======  End of pagination area  =======-->
            </div>
        </div>
    </div>
</div>

<!--=====  End of shop page content  ======-->
