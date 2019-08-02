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
								<li class="parent-page"><a href="index">Home</a></li>
								<li>Wishlist</li>
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
    =            wishlist page content         =
    =============================================-->


    <div class="page-section mb-50">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#">				
                        <!--=======  wishlist table  =======-->
                        
                        <div class="cart-table table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="pro-thumbnail" name="pimage">Image</th>
                                        <th class="pro-title" name="pname">Product</th>
                                        <th class="pro-price" name="discPrice">Price</th>
                                        <th class="pro-remove">Remove</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody">
                                   
                                </tbody>
                            </table>
                            <div class="pagination-area mb-md-50 mb-sm-50">
					            <!--翻页-->
								<div class="zxf_pagediv"></div>
					        </div>
                        </div>
                        
                        <!--=======  End of wishlist table  =======-->
                        
                    </form>	
                </div>
            </div>
        </div>
    </div>

    <!--=====  End of Wishlist page content  ======-->

    
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
<!-- 分页插件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/pageHelper.js"></script>

<script type="text/javascript">
	//初始化收藏界面展示
	var uid=null;
	$(function(){
		uid = '${user.uid}';
		showFav(uid,1);
	})
	function showFav(uid,currPage){
		$("#tbody").html('');
		$.ajax({
			url:"selectfavorite",
			dataType:"json",
			type:"post",
			data:{"uid":uid,'currPage':currPage},
			success:function(data){
				if(data.data==null){
					$("#tbody").append('<tr><td>暂未收藏任何商品</td></tr>')
				}else{
					$.each(data.data,function(i,product){
						$("#tbody").append('<tr>'+
	                    '<td class="pro-thumbnail"><a href="product?pid='+product.pid+'"><img src="'+product.pimage+'" class="img-fluid" alt="Product"></a></td>'+
	                    '<td class="pro-title"><a href="product?pid='+product.pid+'">'+product.pname+'</a></td>'+
	                    '<td class="pro-price"><span>$'+product.discPrice+'</span></td>'+
	                    '<td class="pro-remove"><a href="javascript:void(0);" onclick="removeFav('+product.pid+','+uid+')"><i class="fa fa-trash-o"></i></a></td>'+
	                '</tr>')
					});
					//分页展示
					initpage(data);
				}
			}
		});
	}
	//删除收藏
	function removeFav(pid,uid){
		swal({
			  title: "操作提示",
			  text: "确定删除该收藏商品？",
			  icon: "info",
			  buttons: true,
			}).then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
						url:"delfavorite",
						dataType:"json",
						type:"post",
						data:{"uid":uid,
							"pid":pid},
						success:function(data){
							if(data==1){
								swal({
									text:'删除成功',
									icon:'success'
								});
								$("#tbody").empty();
								showFav(uid);
							}else{
								swal({
									text:'服务器忙',
									icon:'error'
								});
							}
						}
					});
			  }
		});
	}
	
	
	//下一页
	function nextpage(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		current = current+1;
		showFav(uid,current);
	}
	//上一页
	function prepage(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		current = current-1;
		showFav(uid,current);
	}
	//中间点击页
	function pagenum(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		showFav(uid,current);
	}
	//跳转页面
	function jump(){
		current = $(".zxfinput").val();
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		showFav(uid,current);
	}
</script>

</html>
