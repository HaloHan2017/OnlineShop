<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
									<li>Cart</li>
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
	    =            Cart page content         =
	    =============================================-->
	
	
	    <div class="page-section mb-50">
	        <div class="container">
	            <div class="row">
	                <div class="col-12">
	                    <form action="#">				
	                        <!--=======  cart table  =======-->
	                        
	                        <div class="cart-table table-responsive mb-40">
	                            <table class="table">
	                                <thead>
	                                    <tr>
	                                        <th class="pro-thumbnail">Image</th>
	                                        <th class="pro-title">Product</th>
	                                        <th class="pro-price">Price</th>
	                                        <th class="pro-quantity">Quantity</th>
	                                        <th class="pro-subtotal">Total</th>
	                                        <th class="pro-remove">Remove</th>
	                                    </tr>
	                                </thead>
	                                <tbody id="cart">
	                                    <!-- <tr>
	                                        <td class="pro-thumbnail"><a href="product"><img src="assets/images/products/product01.jpg" class="img-fluid" alt="Product"></a></td>
	                                        <td class="pro-title"><a href="product">Cillum dolore tortor nisl fermentum</a></td>
	                                        <td class="pro-price"><span>$29.00</span></td>
	                                        <td class="pro-quantity"><div class="pro-qty"><input type="text" value="1"></div></td> 
	                                        <td class="pro-subtotal"><span>$29.00</span></td>
	                                        <td class="pro-remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
	                                    </tr> -->
	                                    
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <!--=======  End of cart table  =======-->
	                        
	                        
	                    </form>	
	                        
	                    <div class="row">
	
	                        <div class="col-lg-6 col-12 d-flex">
	                            <!--=======  Cart summery  =======-->
	                        
	                            <div class="cart-summary">
	                                <div class="cart-summary-wrap" id="cart-summary">
	                                    <h4>Cart Summary</h4>
	                                    <p>Sub Total <span>$1250.00</span></p>
	                                    <p>Shipping Cost <span>$00.00</span></p>
	                                    <h2>Grand Total <span>$1250.00</span></h2>
	                                </div>
	                                <div class="cart-summary-button">
	                                    <button class="checkout-btn" onclick="location.href='checkout'">Checkout</button>
	                                    <button class="update-btn">Update Cart</button>
	                                </div>
	                            </div>
	                        
	                            <!--=======  End of Cart summery  =======-->
	                            
	                        </div>
	
	                    </div>
	                    
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!--=====  End of Cart page content  ======-->
	
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
		$(function(){
			showCart();
		});
		//查询购物车
		function showCart(){
			$("#cart").html('');
			//进行添加购物车操作
			$.getJSON('cart/query', function(data){
				if(data.data==null || data.data.length==0){
					$("#cart").append("<tr><td>暂无未添加任何商品</td></tr>");
				}else{
					//展示购物车
					var citemList=data.data.citemList;
					var totalMoney=data.data.totalMoney;
					for(var i=0;i<citemList.length;i++){
						var tr = 
							'<tr>'
		                        +'<td class="pro-thumbnail"><a href="product"><img src="'+citemList[i].product.pimage+'" class="img-fluid" alt="'+citemList[i].product.pname+'"></a></td>'
		                        +'<td class="pro-title"><a href="product">'+citemList[i].product.pname+'</a></td>'
		                        +'<td class="pro-price"><span>$'+citemList[i].product.discPrice+'</span></td>'
		                        +'<td class="pro-quantity"><div class="pro-qty"><input type="text" value="'+citemList[i].pcount+'" onkeyup="checkQty(this,'+citemList[i].product.pid+','+i+')"></div></td> '
		                        +'<td class="pro-subtotal"><span>$'+citemList[i].sumMoney+'</span></td>'
		                        +'<td class="pro-remove"><a href="javascript:void(0);" onClick="delItemByPid('+citemList[i].product.pid+')"><i class="fa fa-trash-o"></i></a></td>'
		                    +'</tr>';
						$("#cart").append(tr);   
					}
						
					$("#cart-summary").find("p").eq(0).find("span").html(totalMoney);
					$("#cart-summary").find("p").eq(1).find("span").html('${user.scores}');
					$("#cart-summary").find("h2").eq(0).find("span").html(totalMoney);
				}
			});
		}
		
		//删除购物车item
		function delItemByPid(pid){
			//var pid='\''+pid+'\'';
			$.getJSON('cart/del',{'pid':pid}, function(data){
				if(data.code!=1){
					swal({
						 text: '服务器忙',  
				         icon: 'info' 
					});
				}else{
					showCart();
				}
			});
		}
		
		//检测输出 的数量  是否正确
		function checkQty(obj,pid,i){
			var qty=obj.value;
			if(!(/(^[1-9]\d*$)/.test(qty))){
				obj.value=1;
				return;
			}else{
				//更新购物车的 价钱 以及 商品数量
				$.getJSON('cart/addPcount',{'pid':pid,'pcount':qty}, function(data){
					if(data.code!=1){
						swal({
							 text: '服务器忙',  
					         icon: 'info' 
						});
					}else{
						//更新该行item的 sumMoney，和总的totalMoney
						//showCart();
						var citemList=data.data.citemList;
						var totalMoney=data.data.totalMoney;
						//更新sumMoney
						$(obj).parents("td").next().find("span").html("$"+citemList[i].sumMoney);
						
						//更新totalMoney
						$("#cart-summary").find("p").eq(0).find("span").html(totalMoney);
						$("#cart-summary").find("h2").eq(0).find("span").html(totalMoney);
					}
				});
			}
		}
	</script>
</html>