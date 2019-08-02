<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
	<head>
		<title>OnLineShop-首页</title>
		<!-- 引入links.jsp -->
		<%@ include file="common/links.jsp" %>
	</head>
	<body>
		<!-- 引入header.jsp -->
		<%@ include file="common/header.jsp" %>
		
		<!-- 引入content.jsp -->
		<%@ include file="content.jsp" %>
		
		<!-- 引入footer.jsp -->
		<%@ include file="common/footer.jsp" %>
		
		<!-- 引入linkjs.jsp -->
		<%@ include file="common/links_js.jsp" %>
		
	</body>
</html>
<script type="text/javascript" src="assets/js/pageHelper.js"></script>
<script type="text/javascript">
	//全局变量
	var categoryid=null;
	var orderby=null;
	var text = null;
	var pflag = null;
	//商品按条件排序
	$("#sort-by").change(function(){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		orderby=$("#sort-by option:selected").val();
		showpageproduct(categoryid,1,startprice,endprice,orderby);
	});
	//全局模糊查询
	function searchLike(){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		text = $("#search").val();
		showpageproduct(categoryid,1,startprice,endprice,orderby,text);
	}
	
	//根据价格区间查找商品
	function selectByPrice(){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		//alert("sss");
		showpageproduct(categoryid,1,startprice,endprice);
	}
	//左导航栏产品类别加载
	$(function(){
		$.ajax({
			url:"showAllCategory",
			dataType:"json",
			type:"post",
			success:function(data){
				$("#categoryul").append('<li><a href="" onclick="showpageproduct(null,'+1+')">所有商品</a></li>')
				$.each(data, function(i, category){
					cid = '\''+category.cid+'\'';
					$("#categoryul").append('<li><a href="javascript:void();" onclick="addcid('+cid+')">'+category.cname+'</a></li>');
				});
			}
		});
	});
	//按类别查询
	function addcid(cid){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		categoryid=cid;
		showpageproduct(cid,1,startprice,endprice);
	}
	//分页数据展示
	function showpageproduct(cid,current,startprice,endprice,orderby,text){
		var uid = null;
		if("${user}"!=null){
			uid = "${user.uid}";
		}
		$.ajax({
			url:"showproduct",
			dataType:"json",
			data:{"currentpage":current,
					"cid":cid,
					"startprice":startprice,
					"endprice":endprice,
					"orderby":orderby,
					"text":text,
					"uid":uid},
			type:"post",
			success:function(data){
				$("#showproduct").empty();
				$.each(data.data,function(i,product){
					showproduct(product,uid);
				});
				initpage(data);
			}
		});
	}
	//页面初始化加载前台商品展示
	$(function(){
		var uid = null;
		if("${user}"!=null){
			uid = "${user.uid}";
		}
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		$.ajax({
			url:"showproduct",
			dataType:"json",
			type:"post",
			data:{"startprice":startprice,
				"endprice":endprice,
				"uid":uid},
			success:function(data){
				$.each(data.data,function(i,product){
					showproduct(product,uid);
				});
				initpage(data);
				/* $(".zxf_pagediv").createPage({
					pageNum: data.totalpage,
					current: data.currentpage,
					backfun: function(e){
						showpageproduct(categoryid,e.current,startprice,endprice);
					}
				}); */
			}
		});
	});
	
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
				var text='收藏成功';
				var icon='success';
				if(data==1){
					$("#favorite"+pid+"").empty();
					$("#favorite"+pid+"").append('<a href="javascript:void(0);"  data-tooltip="已收藏" onclick="delfavorite('+uid+','+pid+')"><i class="icon ion-md-heart" style="color: red"></i></a>');
				}else{
					text='服务器忙';
					icon='error';
				}
				swal({
					text:text,
					icon:icon
				});
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
				var text='已取消收藏';
				var icon='success';
				if(data==1){
					$("#favorite"+pid+"").empty();
					$("#favorite"+pid+"").append('<a href="javascript:void(0);" data-tooltip="收藏" onclick="addfavorite('+pid+')"><i class="icon ion-md-heart"></i></a>');
				}else{
					text='服务器忙';
					icon='error';
				}
				swal({
					text:text,
					icon:icon
				});
			}
		});
	}
	//前台商品数据填充
	function showproduct(product,uid){
		var pid = product.pid;
		var append = null;
		var html = null;
		html='<div class="col-lg-3 col-md-6 col-sm-6 col-12">'+
        '<div class="fl-product shop-grid-view-product">'+
        '<div class="image">'+
        	'<a href="product?pid='+pid+'&avgstar='+product.avgstar+'&cid='+product.cid+'">'+
                '<img src="'+product.pimage+'" class="img-fluid" alt="">'+
                '<img src="'+product.pimage+'" class="img-fluid" alt="">'+
            '</a>'+
        '</div>'+
        '<div class="content">'+
            '<h2 class="product-title"> <a href="product?pid='+pid+'&avgstar='+product.avgstar+'&cid='+product.cid+'">'+product.pname+'</a></h2>'+
            '<div class="rating">';
		for(var i=1;i<=product.avgstar;i++){
            		html+='<i class="fa fa-star active"></i>';
            	}
            	for(var i=1;i<=(5-product.avgstar);i++){
            		html+='<i class="fa fa-star"></i>';
            	}
                
            html +='</div>'+
            '<p class="product-price">'+
                '<!-- <span class="main-price discounted">$71</span> -->'+
                '<span class="discounted-price">$'+product.discPrice+'</span>'+
            '</p>'+
            '<div class="hover-icons">'+
                '<ul>'+
                    '<li><a href="javascript:void(0);" data-tooltip="添加购物车" onclick="addProdToCart('+pid+')"><i class="icon ion-md-cart"></i></a></li>';
             
            	product.favorites==null ?   append = '<li><a href="javascript:void(0);"  data-tooltip="收藏" onclick="addfavorite('+pid+')"><i class="icon ion-md-heart" id="favorite'+product.pid+'"></i></a></li>' :      
                
            	product.favorites.length==0 ? append = '<li id="favorite'+product.pid+'"><a href="javascript:void(0);"  data-tooltip="收藏" onclick="addfavorite('+pid+')"><i class="icon ion-md-heart"></i></a></li>' :
            	
            	$.each(product.favorites,function(i,favorite){
            			if(pid==favorite.pid){
            				append = '<li id="favorite'+product.pid+'"><a href="javascript:void(0);"  data-tooltip="已收藏" onclick="delfavorite('+uid+','+pid+')"><i class="icon ion-md-heart" style="color: red"></i></a></li>';
            				return false;
            			}else{
            				append = '<li id="favorite'+product.pid+'"><a href="javascript:void(0);"  data-tooltip="收藏" onclick="addfavorite('+pid+')"><i class="icon ion-md-heart"></i></a></li>';
            			}
            		});     
                   html+= append; 
                   html += ''+
                '</ul>'+
            '</div>'+
        '</div>'+
    '</div>'/* +
   	'<div class="fl-product shop-list-view-product">'+
        '<div class="image">'+
            '<a href="product">'+
                '<img src="'+product.pimage+'" class="img-fluid" alt="">'+
                '<img src="'+product.pimage+'" class="img-fluid" alt="">'+
            '</a>'+
        '</div>'+
        '<div class="content">'+
            '<h2 class="product-title"> <a href="product">'+product.pname+'</a></h2>'+
            '<div class="rating">'+
                '<i class="fa fa-star active"></i>'+
                '<i class="fa fa-star active"></i>'+
                '<i class="fa fa-star active"></i>'+
                '<i class="fa fa-star"></i>'+
                '<i class="fa fa-star"></i>'+
            '</div>'+
            '<p class="product-price">'+
                '<!-- <span class="main-price discounted">$71</span> -->'+
                '<span class="discounted-price">$'+product.discPrice+'</span>'+
            '</p>'+
            '<p class="product-description">'+product.pdesc+'</p>'+
            '<div class="hover-icons">'+
                '<ul>'+
                    '<li><a href="#"  data-tooltip="Add to Cart">Add to cart</a></li>';
                    html+= append;
                html+='</ul>'+
            '</div>'+
        '</div>'+
    '</div>'+
    '<!--=======  End of list view product  =======-->'+
'</div>' */;
		$("#showproduct").append(html);
	}
	
	//分页
	//下一页
	function nextpage(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		current = current+1;
		showpageproduct(categoryid,current,startprice,endprice,orderby,text);
	}
	//上一页
	function prepage(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		current = current-1;
		showpageproduct(categoryid,current,startprice,endprice,orderby,text);
	}
	//中间点击页
	function pagenum(current){
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		showpageproduct(categoryid,current,startprice,endprice,orderby,text);
	}
	//跳转页面
	function jump(){
		current = $(".zxfinput").val();
		var startprice=$('#price-range').slider( 'values', 0 );
		var endprice=$('#price-range').slider( 'values', 1 );
		showpageproduct(categoryid,current,startprice,endprice,orderby,text);
	}
	
	//添加商品到购物车
	function addProdToCart(pid){
		var ret =checkProdInCart(pid);
		if(ret=='error'){
			swal({  
	            text: "服务器繁忙，请稍后再试",  
	            icon: "info" 
	       });
			return;
		}else if(ret=='true'){
			  swal({  
		            text: "此商品已在购物车中",  
		            icon: "info" 
		       });
			  return;
		}
		//进行添加购物车操作
		$.ajax({ 
	        type: "GET", 
	        data: {'pid':pid}, 
	        async: false, 
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
	
</script>