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
                            <label class="l_f">留言</label>
                            <input name="liuyan" type="text" class="text_add" placeholder="输入留言信息" style=" width:200px"></li>
                        <li style="width:90px;">
                            <button type="button" class="btn_search" onclick="searchByKey()">
                                <i class="fa fa-search"></i>查询</button>
                        </li>
                    </ul>
                </div>
                <div class="border clearfix">
                    <span class="l_f">
                       
                        <a href="javascript:void()" class="btn btn-yellow" onclick="filterByState(0)">
                            <i class="fa fa-times"></i>&nbsp;待浏览</a>
                        <a href="javascript:void()" class="btn btn-danger" onclick="filterByState(1)">
                            <i class="fa "></i>&nbsp;待回复</a>
                        <a href="javascript:void()" class="btn btn-sm btn-primary" onclick="filterByState(2)">
                            <i class="fa fa-check"></i>&nbsp;已回复</a>
                    </span>
                </div>
                <!--留言列表-->
                <div class="Guestbook_list">
                    <table class="table table-striped table-bordered table-hover" id="sample-table">
                        <thead>
                            <tr>
                                <!-- <th width="25">
                                    <label>
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th> -->
                                <th width="80">ID</th>
                                <th width="150px">用户名</th>
                                <th width="">留言内容</th>
                                <th width="">回复内容</th>
                                <th width="150px">时间</th>
                                <th width="70">状态</th>
                                <th width="200">操作</th>
                             </tr>
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
                                <td>
                                    <u style="cursor:pointer" class="text-primary" onclick="member_show('张小泉','member-show.html','1031','500','400')">张小泉</u></td>
                                <td class="text-l">
                                    <a href="javascript:;" onclick="Guestbook_iew('12')">“第二届中国无锡水蜜桃开摘节”同时开幕，为期三个月的蜜桃季全面启动。值此京东“618品质狂欢节”之际，中国特产无锡馆限量上线618份8只装精品水蜜桃，61.8元全国包邮限时抢购。为了保证水蜜桃从枝头到达您的手中依旧鲜甜如初，京东采用递送升级服务，从下单到包装全程冷链运输。</a>
                                    <td>2016-6-11 11:11:42</td>
                                    <td class="td-status">
                                        <span class="label label-success radius">已浏览</span></td>
                                    <td class="td-manage">
                                        <a onClick="member_stop(this,'10001')" href="javascript:;" title="已浏览" class="btn btn-xs btn-success">
                                            <i class="fa fa-check  bigger-120"></i>
                                        </a>
                                        <a onclick="member_edit('回复','member-add.html','4','','510')" title="回复" href="javascript:;" class="btn btn-xs btn-info">
                                            <i class="fa fa-edit bigger-120"></i>
                                        </a>
                                        <a href="javascript:;" onclick="member_del(this,'1')" title="删除" class="btn btn-xs btn-warning">
                                            <i class="fa fa-trash  bigger-120"></i>
                                        </a>
                                    </td>
                            </tr> -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--留言详细-->
        <div id="Guestbook" style="display:none">
            <div class="content_style">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">留言用户</label>
                    <div class="col-sm-9" id="uname">胡海天堂</div></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">留言内容</label>
                    <div class="col-sm-9" id="lmContent">三年同窗，一起沐浴了一片金色的阳光，一起度过了一千个日夜，我们共同谱写了多少友谊的篇章?愿逝去的那些闪亮的日子，都化作美好的记忆，永远留在心房。认识您，不论是生命中的一段插曲，还是永久的知已，我都会珍惜，当我疲倦或老去，不再拥有青春的时候，这段旋律会滋润我生命的每一刻。在此我只想说：有您真好!无论你身在何方，我的祝福永远在您身边!</div></div>
                <div class="form-group" id="replyDiv">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">是否回复</label>
                    <div class="col-sm-9">
                        <label>
                            <input name="checkbox" type="checkbox" class="ace" id="checkbox">
                            <span class="lbl">回复</span></label>
                        <div class="Reply_style">
                            <textarea name="权限描述" class="form-control" id="form_textarea" placeholder="请输入回复内容" onkeyup="checkLength(this);"></textarea>
                            <span class="wordage">剩余字数：
                                <span id="sy" style="color:Red;">200</span>字</span></div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
<script type="text/javascript">
	var table;
	$(function(){
		showAllLeaveMsgList();
	});
	//按 类型 过滤
	function filterByState(fcode){
		table.ajax.url('${PATH}/leave/queryAllLeaveMsgList?fcode='+fcode).load();
	}
	//按 关键字 查找
	function searchByKey(){
		var key=$("input[name='liuyan']").val();
		table.ajax.url('${PATH}/leave/queryAllLeaveMsgList?key='+key).load();
	}
	//查找所有 留言反馈列表
	function showAllLeaveMsgList(){
		table=$('#sample-table').DataTable( {
	        "ajax": 'leave/queryAllLeaveMsgList',
	        "columns": [
                   { "data": "lmId" },
                   { "data": "user.name"},
                   { "data": "lmContent",
                	 "render":function( data, type, full, meta){
                		 var uname='\''+full.user.name+'\'';
                		 var lmContent='\''+data+'\'';
                		 var a='<a href="javascript:void(0);" onclick="Guestbook_iew('+full.lmId+','+uname+','+lmContent+','+full.uid+')">'+data+'</a>';
                		 return a;
                	 }   
                   },
                   { "data": "lmReply",
                  	 "render":function( data, type, full, meta){
                  		 if(data==''|| data==null){
                  			 return '暂未回复';
                  		 }else{
                  			 return data;
                  		 }
                  	 }   
                   },
                   { "data": "lmTime",
                  	 	"render": function ( data, type, full, meta ) {
                 	       return GetDate(data);
                 	     }
                   },
                   { "data": "state",
                  	 "render": function ( data, type, full, meta ) {
   	            		//return GetStatus(data);
                   		 if(data=='0'){
                   			 return "<span class='label label-yellow radius'>待浏览</span>";
                   		 }else if(data=='1'){
                   			 return "<span class='label label-danger radius'>待回复</span>";
                   		 }else{
                   			 return "<span class='label label-primary radius'>已回复</span>";
                   		 }
   	           	     }		 
                   },{"render": function (data,type,full) {
		            	 	//var state = '\''+full.state+'\'';
		            	 	var state=full.state;
		            	 	var td='';
		            	 	if(state==0){
		            	 		//待浏览
		            	 		var a='<a onClick="markAsViewed('+full.lmId+')" href="javascript:void(0);"'
				         		 +'title="标记为已浏览" class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>'
		            	 		td+=a;
		            	 	}else {}
			 	        	td +='<a title="删除" href="javascript:void(0);" onclick="member_del('+full.lmId+')"'
			                  	+'class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>';
			         		return td;
	        	  		}
	             	}
               ],
             "aLengthMenu": [5, 10, 20],
             "bAutoWidth":true
	    });
	}
	function markAsViewed(lmid){
		$.post('leave/markAsViewed',{'lmId':lmid},function(data){
			if(data.code!=1){
				//失败，提示信息
				layer.alert(data.msg, {
	                icon: 2,
	                time: 1000
	            });
			}else{
				//success,刷新界面
				layer.alert('标记成功', {
	                icon: 1,
	                time: 1000
	            });
				//刷新页面
       	        $('#sample-table').DataTable().ajax.reload();
			}
		});
	}
	
	/*用户-查看*/
    function member_show(title, url, id, w, h) {
        layer_show(title, url + '#?=' + id, w, h);
    }
    /*留言-删除*/
    function member_del(id) {
        layer.confirm('确认要删除吗？',
	        function(index) {
	           $.post('leave/delByLmid',{'lmId':id},function(data){
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

    /*checkbox激发事件*/
    $('#checkbox').on('click',
    function() {
        if ($('input[name="checkbox"]').prop("checked")) {
            $('.Reply_style').css('display', 'block');
        } else {
            $('.Reply_style').css('display', 'none');
        }
    })
    /*留言查看*/
    function Guestbook_iew(id,uname,lmContent,uid) {
    	//判断 是否是 已回复，或者是未回复
    	/* 	$.ajax({
			url : 'leave/checkIsReplied',
			type : 'post',
			async: false,//使用同步的方式,true为异步方式
			data : {'lmId':id},//这里使用json对象
			success : function(data){
				$("#replyDiv").html('');
				if(data.code==0){
					//已回复,则只显示 回复内容
					var div=''
						+'<label class="col-sm-2 control-label no-padding-right" for="form-field-1">回复内容</label>'
			                    +'<div class="col-sm-9">'
			               +'<div class="Reply_style">'
			               		+'<textarea name="回复内容" class="form-control" id="form_textarea">'+data.data+'</textarea>'
			               +'</div>'
			            +'</div>';
						
					$("#replyDiv").append(div);
				}else{
					var div=''
						+'<label class="col-sm-2 control-label no-padding-right" for="form-field-1">是否回复</label>'
			            +'<div class="col-sm-9">'
			               +'<label><input name="checkbox" type="checkbox" class="ace" id="checkbox">'
                           +'<span class="lbl">回复</span></label>'
			               +'<div class="Reply_style">'
			               		+'  <textarea name="权限描述" class="form-control" id="form_textarea" placeholder="请输入回复内容" onkeyup="checkLength(this);"></textarea>'
			               		+'<span class="wordage">剩余字数：'
                                +'<span id="sy" style="color:Red;">200</span>字</span>'
			               +'</div>'
			            +'</div>';
                        
					//未回复，则可以进行 回复操作
					$("#replyDiv").append(div);
				}
			}
		});
		*/
		
		replyFunc(id,uname,lmContent,uid);
    };
    function replyFunc(id,uname,lmContent,uid){
    	//console.info(id+"  "+uname+" "+lmContent+" "+uid);
    	$("#uname").html(uname);
    	$("#lmContent").html(lmContent);
    	var index = layer.open({
            type: 1,
            title: '留言信息',
            maxmin: true,
            shadeClose: false,
            area: ['600px', ''],
            content: $('#Guestbook'),
            btn: ['确定', '取消'],
            yes: function(index, layero) {
                if ($('input[name="checkbox"]').prop("checked")) {
                	//回复
                    if ($('.form-control').val() == "") {
                        layer.alert('回复内容不能为空！', {
                            title: '提示框',
                            icon: 0,
                        })
                        return;
                    } else {
                        layer.alert('确定回复该内容？', {
                            title: '提示框',
                            icon: 0,
                            btn: ['确定', '取消'],
                            yes: function(index) {
                            	//调用后台 方法进行回复 ，发送到用户 的邮箱
                            	$.post('leave/replyByEmail',{
                            		'lmId':id,
                            		'uid':uid,
                            		'lmReply':$("#form_textarea").val()
                            		},
                            		function(data){
	                            		if(data.code!=1){
	                            			layer.alert(data.msg, {
	                        	                icon: 2,
	                        	                time: 1000
	                        	            });
	                            		}else{
	                            			//回复成功
	                            			layer.msg('回复成功', {
	                        	                icon: 1,
	                        	                time: 1000
	                        	            });
	                            			//刷新表格
	                            			$('#sample-table').DataTable().ajax.reload();
	                            			layer.closeAll();
	                            		}
                            	});
                            }
                        });
                    }
                } else {
                    layer.alert('是否要取消回复！', {
                        title: '提示框',
                        icon: 0,
                    });
                    layer.close(index);
                }
            }
        })
    }
    
    /*字数限制*/
    function checkLength(which) {
        var maxChars = 200; //
        if (which.value.length > maxChars) {
            layer.open({
                icon: 2,
                title: '提示框',
                content: '您输入的字数超过限制!',
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
</script>
<script type="text/javascript">
	/* jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],
            //默认第几个排序
            "bStateSave": true,
            //状态保存
            "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {
                "orderable": false,
                "aTargets": [0, 2, 3, 5, 6]
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
    }) */
</script>