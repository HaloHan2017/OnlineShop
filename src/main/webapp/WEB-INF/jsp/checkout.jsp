<%@page import="com.yc.olshop.utils.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								<li class="parent-page">><a href="index">Home</a></li>
								<li>Checkout</li>
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
	=            Checkout page content         =
	=============================================-->
	
	<div class="page-section mb-50">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    
                    <!-- Checkout Form s-->
                    <form name=alipayment target="_blank" method="post" action="payment/payForAli" id="payForm" class="checkout-form">
                        <div class="row row-40">
                            
                            <div class="col-lg-7 mb-20">
                                
                                <!-- Billing Address -->
                                <div id="billing-form" class="mb-40">
                                    <h4 class="checkout-title">地址列表</h4>
                                </div>
                                
                                
                                
                                
                            </div>
                            
                            
	                            <div class="col-lg-5">
	                                <div class="row">
	                                    
	                                    <!-- Cart Total -->
	                                    <div class="col-12 mb-60">
	                                    
	                                        <h4 class="checkout-title">购物车总计</h4>
	                                
	                                        <div class="checkout-cart-total">
	    
	                                            <h4>商品 <span>总计</span></h4>
	                                            
	                                            <ul id="productList">
	                                                
	                                            </ul>
	                                            
	                                            <p>小计 <span></span></p>
	                                            
	                                            <div class="checkout-payment-method">
	                                            
	                                            <p><input id="saleChecked" type="checkbox" onclick="changeTotalMoney()" >使用积分 <span id="currentUserScore">可用积分：</span></p>
	                                            
	                                            
	                                        	</div>
	                                            
	                                            <h4>总计 <span></span></h4>
	                                            
	                                        </div>
	                                        
	                                    </div>
	                                    
	                                    <!-- Payment Method -->
	                                    <div class="col-12">
	                                    
	                                        <h4 class="checkout-title">支付方式</h4>
	                                
	                                        <div class="checkout-payment-method">
	                                            
	                                            <div class="single-method">
	                                                <input type="radio" id="payment_check" name="payment-method" value="check">
	                                                <label for="payment_check">推荐使用支付宝</label>
	                                                <p data-method="check"></p>
	                                            </div>
	                                            
	                                            
	                                        </div>
	                                        <input type="hidden" value="<%=StringUtil.getOrderId() %>" name="orderId">
	                                        <input onclick="flushPage()" type="submit" value="支付" class="place-order">
	                                    </div>
	                                    
	                                </div>
	                            </div>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
    
    <!--=====  End of Checkout page content  ======-->
    
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

	<!-- 引入links_js.jsp -->
	<%@ include file="common/links_js.jsp" %>

</body>

<script type="text/javascript">
	//总价格
	var totalMoney = 0;
	//优惠价格
	var saleRate = 0;
	//初始化时  插入购物车的商品  并进行计算  并且设置积分  设置地址
	$(function(){ 
		//首先要获得优惠价格 saleRate ，所以getCurrentUserScore()函数先执行
		getCurrentUserScore();
		cartList();
		userAddress();
	});
	
	function cartList(){
		$.get("payment/cartList",function(data){
			//清空子元素
			$("#productList").empty();
			
			var htmlstr = "";
			
			for(var i=0;i<data.data.length;i++){
				//加入商品id
				htmlstr += '<input type=hidden name=pid id=pid value='+ data.data[i].product.pid +'>';
				htmlstr += "<li>"+data.data[i].product.pname+"<span>$"+data.data[i].product.discPrice*data.data[i].pcount +" × "+ data.data[i].pcount +"</span></li>";
				//加入商品数量
				htmlstr += '<input type=hidden name=pnum id=pnum value='+ data.data[i].pcount +'>';
				//加入商品价格
				htmlstr += '<input type=hidden name=prealprice id=prealprice value='+ data.data[i].product.discPrice +'>';
				totalMoney += data.data[i].product.discPrice*data.data[i].pcount;
			}
			//插入代码
			$("#productList").html(htmlstr);
			//<input type="hidden" name="WIDtotal_amount" value="">
			//隐域给支付宝支付
			$("#productList").next().children().after('<input type=hidden name=WIDtotal_amount value='+ totalMoney +'>');
			$("#productList").next().children().html("$"+totalMoney);
			//减去优惠价格
			/* totalMoney -= saleRate;
			//如果购物车没有东西，而用户选择了商品和积分，那总金额会出现负数
			if(totalMoney < 0){
				totalMoney = 0;
			} */
			$("#productList").next().next().next().children().html("$"+totalMoney);
		});
	}
	 
	var scores = 0;
	//获取当前用户的积分
	function getCurrentUserScore(){
		$.get("payment/getCurrentUserScore",function(data){
			if(data != null && data > 0){
				scores = data;
				$("#currentUserScore").html('可用积分：'+data +'<input type=hidden name=scores value='+data+'>');
			}else{
				$("#currentUserScore").html('可用积分：'+0 + '<input type=hidden name=scores value='+0+'>');
			}
			//设置积分隐藏域
			//$("#saleChecked").after('<input type=hidden name=scores value='+data == null ? 0 : data+'>');
			//设置全局变量
			saleRate = Math.round(data/100);
			$("#currentUserScore").after('<p>可抵扣额度： <span>'+Math.round(data/100)+'</span></p>');
		});
	}
	
	
	//收货地址
	function userAddress(){
		$.get("payment/userAddress",function(data){
			var htmlstr = "";
			for(var i=0;i<data.length;i++){
				htmlstr += '<input type="radio" checked=checked name="address" value='+ data[i].addrId +' >'+
                '<p>电话：'+ data[i].phone +'</p>'+
                '<p>名字：'+ data[i].name +'</p>'+
                '<p>收货地址：'+ data[i].address +'</p>';
			}
			if(data.length == 0 || data == null){
				//htmlstr = "<p>请现在个人中心设置地址！！</p>";
				swal({
					text:'没有设置地址！请先进个人中心设置地址',
					icon:'warning'
				});
				setTimeout(function(){
					location.href='my-account';
				},3000);
				return;
			}
			
			$("#billing-form").after(htmlstr);
		});
	}
	
	//点击单选框，选中使用积分和不适用积分的总金额
	function changeTotalMoney(){
		var temp = totalMoney;
		$('input[id="saleChecked"]:checked').each(function(){
			temp -= saleRate; 
		});
		$("#productList").next().next().next().children().html("$"+temp);
		//改变隐域的价格
		$('input[name="WIDtotal_amount"]').attr("value",temp);
	}
	
	function flushPage(){
		location.replace(document.referrer);
		//window.location.href="http://localhost/my-account#orders";
	}
	
	function changTotalMoney(){
	/* 	$.("#saleChecked").prop("checked",function(){
			totalMoney -= saleRate;
		});
		$.("#saleChecked").prop("unchecked",function(){
			totalMoney += saleRate;
		});
		$("#productList").next().next().next().children().html("$"+totalMoney); */
	}
	
	
</script>

</html>
