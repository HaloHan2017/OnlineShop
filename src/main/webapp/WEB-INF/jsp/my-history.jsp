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
									<li>My-History</li>
								</ul>
							</nav>
						</div>
						
						<!--=======  End of breadcrumb container  =======-->
					</div>
				</div>
			</div>
		</div>
		<!--=====  End of Cart page content  ======-->
	
	
		<!-- 我的足迹 商品列表 -->
		<div class="container">
			<div class="dropdown">
			  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			    	筛选
			  </button>
			  <div class="dropdown-menu">
			  	<a class="dropdown-item" href="javascript:void(0);" onClick="showHistoryByTime(-1)">今天</a>
			    <a class="dropdown-item" href="javascript:void(0);" onClick="showHistoryByTime(-2)">近三天</a>
			    <a class="dropdown-item" href="javascript:void(0);" onClick="showHistoryByTime(1)">近一周</a>
			    <a class="dropdown-item" href="javascript:void(0);" onClick="showHistoryByTime(2)">近半个月</a>
			    <a class="dropdown-item" href="javascript:void(0);" onClick="showHistoryByTime(3)">近一个月</a>
			  </div>
			</div>
			<button type="button" class="btn btn-danger" onclick="clearAllViewedProdList()">清除全部浏览记录</button>
			    	
			<div class="row" id="viewList">
					
			</div>
		</div>
			
		<div class="pagination-area mb-md-50 mb-sm-50">
            <!--翻页-->
			<div class="zxf_pagediv"></div>
        </div>
        
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/pageHelper.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/myutil.js"></script>
	<script type="text/javascript">
		var tcode=null;
		$(function(){
			//展示 历史记录  列表
			tcode=0;
			showHistoryProductList(tcode,1);
		});
		function showHistoryProductList(tcode,curr){
			$.getJSON("getHistoryProdsList?tcode="+tcode+"&currPage="+curr,function(data){
				if(data.code!=1){
					swal({
						text:data.msg,
						type:"info"
					});
				}else{
					$("#viewList").html('');
					//展示 列表
					if(data.data==null || data.data.length<=0){
						$("#viewList").append("<div>暂无商品的浏览记录</div>");
					}else{
					$.each(data.data,function(index,item){
						var viewTime = GetDate(item.viewedTime);
						var div=
							'<div class="col-lg-2 col-md-6 col-sm-6 col-12">'
							+'<div class="fl-product shop-grid-view-product">'
							+''+viewTime+''	
							+'<div class="image">'
							+'<a href="product?pid='+item.pid+'">'
							+'<img src="'+item.pimage+'" class="img-fluid" alt="">'
							+'<img src="'+item.pimage+'" class="img-fluid" alt="">'
							+'</a>'
							+'</div>'
							+'<div class="content">'
							+'<h2 class="product-title"> <a href="product">'+item.pname+'</a></h2>'
							+'<p class="product-price">'
							+'<span class="discounted-price">$'+item.discPrice+'</span>'
							+'</p>'
							+'<div class="hover-icons">'
							+'<ul>'
							+'<li><a href="javascript:void(0);" data-tooltip="删除" onclick="del('+item.pid+')"><i class="icon ion-md-del"></i></a></li>'
							+'</ul>'
							+'</div>'
							+'</div>'
							+'</div>'
							+'</div>';
						$("#viewList").append(div);
						//分页展示
						initpage(data);
					});
				  }
				}
			});
		}
		function clearAllViewedProdList(){
			swal({
				  title: "操作提示",
				  text: "确定回复？",
				  icon: "error",
				  buttons: true,
				}).then((willDelete) => {
				  if (willDelete) {
					  //去个人中心
					  $.ajax({
							url:"delAllViewdProds",
							dataType:"json",
							type:"post",
							success:function(data){
								if(data.code!=1){
									swal({
										text:data.msg,
										icon:'error'
									});
								}else{
									swal({
										text:'清除成功',
										icon:'success'
									});
									//刷新
									showHistoryProductList(tcode,1);
								}
							}
						});
				  }
			});
		}
		function del(pid){
			swal({
				  title: "操作提示",
				  text: "确定回复？",
				  icon: "info",
				  buttons: true,
				}).then((willDelete) => {
				  if (willDelete) {
					  //去个人中心
					  $.ajax({
							url:"delViewdProdByPid",
							dataType:"json",
							type:"post",
							data:{"pid":pid},
							success:function(data){
								if(data.code!=1){
									swal({
										text:data.msg,
										icon:'error'
									});
								}else{
									swal({
										text:'删除成功',
										icon:'success'
									});
									//刷新
									showHistoryProductList(tcode,1);
								}
							}
						});
				  }
			});
		}
		function showHistoryByTime(tc){
			tcode=tc;
			showHistoryProductList(tcode,1);
		}
		
	</script>
	<script type="text/javascript">
	//下一页
	function nextpage(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		current = current+1;
		showHistoryProductList(tcode,current);
	}
	//上一页
	function prepage(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		current = current-1;
		showHistoryProductList(tcode,current);
	}
	//中间点击页
	function pagenum(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		showHistoryProductList(tcode,current);
	}
	//跳转页面
	function jump(){
		current = $(".zxfinput").val();
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		showHistoryProductList(tcode,current);
	}
	</script>
</html>