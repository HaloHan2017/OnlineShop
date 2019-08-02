<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String PATH=request.getContextPath(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link href="${PATH }/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${PATH }/admin/css/style.css" />
        <link href="${PATH }/admin/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${PATH }/admin/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${PATH }/admin/font/css/font-awesome.min.css" />
       
        <script src="${PATH }/admin/js/jquery-1.9.1.min.js"></script>
        <script src="${PATH }/admin/assets/js/bootstrap.min.js"></script>
        <script src="${PATH }/admin/assets/js/typeahead-bs2.min.js"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript"></script>
        <script src="${PATH }/admin/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${PATH }/admin/js/myutil.js" type="text/javascript"></script>
        <title>留言</title>
    </head>
    
    <body>
        <div class="margin clearfix">
            <div class="Guestbook_style">
                <div class="search_style">
                    <ul class="search_content clearfix">
                        <li>
                            <label class="l_f">网站名称</label>
                            <input name="siteName" type="text" class="text_add" placeholder="输入关键字信息" style=" width:150px"></li>
                        <li style="width:90px;">
                            <button type="button" class="btn_search" onclick="searchByKey()">
                                <i class="fa fa-search"></i>查询</button>
                        </li>
                    </ul>
                </div>
                <div class="border clearfix">
                    <span class="l_f">
                       
                        <a href="javascript:void()" class="btn btn-danger" onclick="addOrUpdateLink(-1,this)">
                            <i class="fa fa-times"></i>&nbsp;新增</a>
                    </span>
                </div>
                <!--留言列表-->
                <div class="Guestbook_list">
                    <table class="table table-striped table-bordered table-hover" id="sample-table">
                        <thead>
                            <tr>
                                <th width="80">ID</th>
                                <th width="150px">网站名称</th>
                                <th width="150px">网站地址</th>
                                <th width="150px">添加时间</th>
                                <th width="200">操作</th>
                             </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--修改密码样式-->
         <div class="change_Pass_style" id="change_Links">
            <ul class="">
             <li><label class="label_name">网站名称</label><input name="网站名称" type="lname" class="" id="lname"></li>
             <li><label class="label_name">网站地址</label><input name="网站地址" type="lurl" class="" id="lurl"></li>
            </ul>
     		<!-- <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
         </div>
        
    </body>

</html>
<script type="text/javascript">
	var table;
	$(function(){
		showAllLinkList();
	});
	//按 关键字 查找
	function searchByKey(){
		var key=$("input[name='siteName']").val();
		table.ajax.url('${PATH}/links/queryAllLinksList?key='+key).load();
	}
	//查找所有 留言反馈列表
	function showAllLinkList(){
		table=$('#sample-table').DataTable( {
	        "ajax": 'links/queryAllLinksList',
	        "columns": [
                   { "data": "lid" },
                   { "data": "lname",
                	 "render":function( data, type, full, meta){
                		 var a='<a href="http://'+full.lurl+'" target="_blank">'+data+'</a>';
                		 return a;
                	 }   
                   },
                   { "data": "lurl",
                  	 "render":function( data, type, full, meta){
                  		var a='<a href="http://'+data+'" target="_blank">'+data+'</a>';
               		 	return a;
                  	 }   
                   },
                   { "data": "ltime",
                  	 	"render": function ( data, type, full, meta ) {
                 	       return GetDate(data);
                 	     }
                   },{"render": function (data,type,full) {
	            	 		//待浏览
	            	 		var a='<a onClick="addOrUpdateLink('+full.lid+',this)" href="javascript:void(0);"'
			         		 +'title="修改" class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a>'
			 	        	 +'<a title="删除" href="javascript:void(0);" onclick="member_del('+full.lid+')"'
			                  	+'class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>';
			         		return a;
	        	  		}
	             	}
               ],
             "aLengthMenu": [5, 10, 20],
             "bAutoWidth":true
	    });
	}
	
	//新增 --修改
	function addOrUpdateLink(lid,obj){
		if(lid!=-1){
			//修改，将内容回显
			var lname= $(obj).parent().prevAll().eq(2).find("a").html();
			var lurl= $(obj).parent().prevAll().eq(1).find("a").html();
			$("#lname").val(lname);
			$("#lurl").val(lurl);
		}else{
			$("#lname").val('');
			$("#lurl").val('');
		}
		layer.open({
		    type: 1,
			title:'修改或添加',
			area: ['250px','200px'],
			shadeClose: true,
			content: $('#change_Links'),
			btn:['确认'],
			yes:function(index, layero){	
				  var reg1=/^[\u4e00-\u9fa5a-zA-Z0-9]+$/;
				  if (!reg1.test($("#lname").val())){
					  layer.alert('名称格式有误!',{
		              title: '提示框',				
						icon:0,
					 });
					 return false;
		          } 
				  var reg2=/(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
				  if (!reg2.test("http://"+$("#lurl").val())){
					  layer.alert('网址格式不正确!',{
		              title: '提示框',				
						icon:0,
					 });
					 return false;
		          } 
				  //ajax进行 修改和添加
				  $.post('links/addOrUpdate',
						  {'lid':lid,
					  	   'lname':$("#lname").val(),
					  	   'lurl':$("#lurl").val(),},
						function(data){
					  		if(data.code!=1){
					  			 layer.alert(data.msg,{
					                title: '提示框',				
									icon:2,		
								  }); 
					  		}else{
					  			 layer.alert('成功！',{
					                title: '提示框',				
									icon:1,		
								  }); 
					  			//刷新页面
					          	$('#sample-table').DataTable().ajax.reload();
					  		}
					  		layer.close(index);
				  		}
				  );
			}
		});
	}
	
    /*留言-删除*/
    function member_del(id) {
        layer.confirm('确认要删除吗？',
	        function(index) {
	           $.post('links/delByLid',{'lid':id},function(data){
	        	   if(data.code!=1){
	   				//失败，提示信息
	   				layer.alert(data.msg, {
	   	                icon: 2,
	   	                time: 1000
	   	            });
	   			}else{
	   				//success,刷新界面
	   				layer.alert('删除成功', {
	   	                icon: 1,
	   	                time: 1000
	   	            });
	   				//刷新页面
	          	    $('#sample-table').DataTable().ajax.reload();
	   			}
	           });
        });
    }

</script>
