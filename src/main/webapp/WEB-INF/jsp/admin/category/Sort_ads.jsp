<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <% String PATH=request.getContextPath(); %>
<!DOCTYPE html >
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link href="${PATH }/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${PATH }/admin/css/style.css" />
        <link href="${PATH }/admin/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${PATH }/admin/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${PATH }/admin/font/css/font-awesome.min.css" />
         
        <script src="${PATH }/admin/js/jquery-1.9.1.min.js"></script>
        <script src="${PATH }/admin/assets/js/typeahead-bs2.min.js"></script>
        <script src="${PATH }/admin/js/lrtk.js" type="text/javascript"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript"></script>
         <script src="${PATH }/admin/js/myutil.js"></script>
        <title>分类管理</title>
    </head>
    
    <body>
        <div class="page-content clearfix">
            <div class="sort_style">
                <div class="border clearfix">
                    <span class="l_f">
                        <a href="javascript:void()" id="sort_add" class="btn btn-warning">
                            <i class="fa fa-plus"></i>添加分类</a>
                        <!-- <a href="javascript:void()" id="sort_del" class="btn btn-danger">
                            <i class="fa fa-trash"></i>批量删除</a> -->
                    </span>
                    <span class="r_f" >共：
                        <b id="countSpan"></b>类</span>
                </div>
                <div class="sort_list">
                    <table class="table table-striped table-bordered table-hover" id="sample-table">
                        <thead>
                            <tr>
                                <!-- <th width="25px">
                                    <label>
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th> -->
                                <th width="50px">ID</th>
                                <th width="150px">类别名称</th>
                                <th width="100px">商品数量</th>
                                <th width="250px">描述</th>
                                <th width="180px">创建时间</th>
                                <!-- <th width="70px">状态</th> -->
                                <th width="250px">操作</th></tr>
                        </thead>
                        <tbody>
                            <!-- <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>1</td>
                                <td>幻灯片</td>
                                <td>5</td>
                                <td>首页顶部广告轮播图，大图区别于其他图片</td>
                                <td>2016-6-29 12:34</td>
                                <td class="td-manage">
                                    <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:void(0);" class="btn btn-xs btn-info">
                                        <i class="fa fa-edit bigger-120"></i>
                                    </a>
                                    <a title="删除" href="javascript:void(0);" onclick="member_del(this,'1')" class="btn btn-xs btn-warning">
                                        <i class="fa fa-trash  bigger-120"></i>
                                    </a>
                                </td>
                            </tr> -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--添加分类-->
        <div class="sort_style_add margin" id="sort_style_add" style="display:none">
            <div class="">
                <ul>
                    <li>
                        <label class="label_name">类别名称</label>
                        <div class="col-sm-9">
                            <input name="分类名称" required type="text" id="cname" placeholder="请输入商品类别" class="col-xs-10 col-sm-7"></div>
                    </li>
                </ul>
            </div>
        </div>
    </body>
	<script type="text/javascript">
		function query(){
			//每次操作前清空
			$("#sample-table tbody").html('');
			$.post(
				"${PATH }/category/query",
				function(data){
					//显示类别数量
					var count = data.length;
					$("#countSpan").html('');
					$("#countSpan").append(count);
					$.each(data,function(index,item){
						//var checkboxTd = $("<td></td>").append("<label><input type='checkbox' class='ace'><span class='lbl'></span></label>");
						var cidTd = $("<td></td>").append(item.cid);
						var cnameTd = $("<td></td>").append(item.cname);
						var pcountTd = $("<td></td>").append(item.prodNum);
						var descTd = $("<td></td>").append(item.cname);
						var ctimeTd = $("<td></td>").append(GetDate(item.createTime));
						var cid ="\""+item.cid+"\"";
						var cname ="\""+item.cname+"\"";
						//添加 编辑 和 修改 按钮
						var td1 = $("<a title='编辑' onClick='editCategory("+cid+","+cname+")' href='javascript:void(0);'class='btn btn-xs btn-info'></a>").append("<i class='fa fa-edit bigger-120'></i>");
						var td2 = $("<a title='删除' href='javascript:void(0);'onclick='member_del(this,"+item.cid+")' class='btn btn-xs btn-warning'></a>").append("<i class='fa fa-trash bigger-120'></i>");
						
						var butTd = $("<td></td>").append(td1).append(td2);
						
						//将category的列都添加到一行 ，再追加到表格中
						var tr = $("<tr></tr>").append(cidTd)
							.append(cnameTd).append(pcountTd)
							.append(descTd).append(ctimeTd)
							.append(butTd)
							.appendTo("#sample-table tbody");
					});
				},"JSON"
			);
		}
		//查询所有商品类别
		$(function(){
			query();
		});
		//修改类别
		function editCategory(cid,cname){
			//alert(data.cid+","+data.cname);
			$("#cname").val(cname);
			 layer.open({
	            type: 1,
	            title: '修改分类',
	            maxmin: true,
	            shadeClose: false,
	            //点击遮罩关闭层
	            area: ['400px', ''],
	            content: $('#sort_style_add'),
	            btn: ['修改', '取消'],
	            yes: function(index, layero) {
	            	//修改
	            	$.post("category/add",
		        		{cname:$("#cname").val().trim(),
	            		cid:cid,
	            		flag:'edit'},
		        		function(data){
		        			if(data.code!=1){
		        				//添加失败
		        				layer.alert(data.msg, {
		        	                icon: 2,
		        	                time: 1000
		        	            });
		        			}else{
		        				//success
		        				layer.alert('修改成功！', {
		                            title: '提示框',
		                            icon: 1,
		                        });
		                        layer.close(index);
		                        //刷新当前界面
		                        query();
		        			}
		        		},"JSON"
		        	);
	            }
			 });
		}
	</script>
</html>
<script type="text/javascript">
	//批量删除类别
	$('#sort_del').on('click',function(){
		layer.confirm('确认要批量删除吗？', {
            icon: 0,
        },function(index) {
        	//ajax进行删除
        	$.post("category/delAll",
        		{cid:id},//获取选中行的id
        		function(data){
        			if(data.code!=1){
        				//删除失败
        				layer.alert(data.msg, {
        	                icon: 2,
        	                time: 1000
        	            });
        			}else{
        				//success
        	            layer.msg('已删除!', {
        	                icon: 1,
        	                time: 1000
        	            });
        				query();
        			}
        		},"JSON"
        	);
        });
	});
	
	//添加类别
	$('#sort_add').on('click',function(){
        layer.open({
            type: 1,
            title: '添加分类',
            maxmin: true,
            shadeClose: false,
            //点击遮罩关闭层
            area: ['400px', ''],
            content: $('#sort_style_add'),
            btn: ['提交', '取消'],
            yes: function(index, layero) {
                var num = 0;
                var str = "";
                $(".sort_style_add input[type$='text']").each(function(n) {
                    if ($(this).val() == "") {
                        layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                            title: '提示框',
                            icon: 0,
                        });
                        num++;
                        return false;
                    }
                });
                if (num > 0) {
                    return false;
                } else {
                	//ajax添加
                	$.post("category/add",
		        		{cname:$("#cname").val().trim()},
		        		function(data){
		        			if(data.code!=1){
		        				//添加失败
		        				layer.alert(data.msg, {
		        	                icon: 2,
		        	                time: 1000
		        	            });
		        			}else{
		        				//success
		        				layer.alert('添加成功！', {
		                            title: '提示框',
		                            icon: 1,
		                        });
		                        layer.close(index);
		                        //刷新当前界面
		                        query();
		        			}
		        		},"JSON"
		        	);
                }
            }
        });
    })

    function checkLength(which) {
        var maxChars = 200; //
        if (which.value.length > maxChars) {
            layer.open({
                icon: 2,
                title: '提示框',
                content: '您出入的字数超多限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
   
    /*-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', {
            icon: 0,
        },function(index) {
        	//ajax进行删除
        	$.post("category/del",
        		{cid:id},
        		function(data){
        			if(data.code!=1){
        				//删除失败
        				layer.alert(data.msg, {
        	                icon: 2,
        	                time: 1000
        	            });
        			}else{
        				//success
        				//$(obj).parents("tr").remove();//移除该行
        	            layer.msg('已删除!', {
        	                icon: 1,
        	                time: 1000
        	            });
        	            query();
        			}
        		},"JSON"
        	);
        });
    }
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Order_form ,.ads_link').on('click',
    function() {
        var cname = $(this).attr("title");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe span').html(cname);
        parent.$('#parentIframe').css("display", "inline-block");
        parent.$('.Current_page').attr("name", herf).css({
            "color": "#4c8fbd",
            "cursor": "pointer"
        });
        //parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+">" + cnames + "</a>");
        parent.layer.close(index);
    });
    function AdlistOrders(id) {
        window.location.href = "Ads_list.html?=" + id;
    };
</script>
<script type="text/javascript">
	//排序功能
	jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],
            //默认第几个排序
            "bStateSave": true,
            //状态保存
            "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {
                "orderable": false,
                "aTargets": [0, 2, 4, 6, 7, ]
            } // 制定列不参与排序
            ]
        });
        $('table th input:checkbox').on('click',
        function() {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox').each(function() {
                this.checked = that.checked;
                $(this).closest('tr').toggleClass('selected');
            });

        });
        $('[data-rel="tooltip"]').tooltip({
            placement: tooltip_placement
        });
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table') var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }
    })
</script>