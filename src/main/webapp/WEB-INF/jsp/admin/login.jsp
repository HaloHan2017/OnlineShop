<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%String PATH=request.getContextPath(); %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
            
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <link href="${PATH}/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="${PATH}/admin/assets/css/font-awesome.min.css" />
                <!--[if IE 7]>
                    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
                <![endif]-->
                <link rel="stylesheet" href="${PATH}/admin/assets/css/ace.min.css" />
                <link rel="stylesheet" href="${PATH}/admin/assets/css/ace-rtl.min.css" />
                <link rel="stylesheet" href="${PATH}/admin/assets/css/ace-skins.min.css" />
                <link rel="stylesheet" href="${PATH}/admin/css/style.css" />
                <!--[if lte IE 8]>
                    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
                <![endif]-->
                <script src="${PATH}/admin/assets/js/ace-extra.min.js"></script>
                <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.js"></script>
                    <script src="assets/js/respond.min.js"></script>
                <![endif]-->
                <script src="${PATH}/admin/js/jquery-1.9.1.min.js"></script>
                <script src="${PATH}/admin/assets/layer/layer.js" type="text/javascript"></script>
		<!-- 获取用户登录ip地址 -->
        	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
                <title>登陆</title></head>
            
            <body class="login-layout Reg_log_style">
                <div class="logintop">
                    <span>欢迎后台管理界面平台</span>
                    <ul>
                        <li>
                            <a href="#">返回首页</a></li>
                        <li>
                            <a href="#">帮助</a></li>
                        <li>
                            <a href="#">关于</a></li>
                    </ul>
                </div>
                <div class="loginbody">
                    <div class="login-container">
                        <div class="center">
                            <img src="${PATH}/admin/images/logo1.png" /></div>
                        <div class="space-6"></div>
                        <div class="position-relative">
                            <div id="login-box" class="login-box widget-box no-border visible">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header blue lighter bigger">
                                            <i class="icon-coffee green"></i>管理员登陆</h4>
                                        <div class="login_icon">
                                            <img src="${PATH}/admin/images/login.png" /></div>
                                        <form method="post" id="login">
                                            <fieldset>
                                                <ul>
                                                    <li class="frame_style form_error">
                                                        <label class="user_icon"></label>
                                                        <input name="aname" type="text" id="用户名" />
                                                        <i>用户名</i>
                                                    </li>
                                                    <li class="frame_style form_error">
                                                        <label class="password_icon"></label>
                                                        <input name="apwd" type="password" id="密码" />
                                                        <i>密码</i>
                                                    </li>
                                                    <li class="frame_style form_error">
                                                        <label class="Codes_icon"></label>
                                                        <input name="code" type="text" id="Codes_text" />
                                                        <i>验证码</i>
                                                        <img class="Codes_region" src="${PATH}/validateCode" onclick="changeCode()" id="validateCode"/>
                                                    </li>
                                                </ul>
                                                <div class="space"></div>
                                                <div class="clearfix">
                                                    <label class="inline">
                                                        <input type="checkbox" class="ace" name="check">
                                                        <span class="lbl">保存密码</span></label>
                                                    <button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="login_btn" onclick="login()">
                                                        <i class="icon-key"></i>登陆</button>
                                                </div>
                                                <div class="space-4"></div>
                                            </fieldset>
                                        </form>
                                        <div class="social-or-login center">
                                            <span class="bigger-110">通知</span></div>
                                        <div class="social-login center">本网站系统不再对IE8以下浏览器支持，请见谅。</div></div>
                                    <!-- /widget-main -->
                                    <div class="toolbar clearfix"></div>
                                </div>
                                <!-- /widget-body --></div>
                            <!-- /login-box --></div>
                        <!-- /position-relative --></div>
                </div>
                <div class="loginbm">版权所有 2019
                    <a href="">源晨信息科技有限公司</a></div>
                <strong></strong>
            </body>
        
        </html>
        <script type="text/javascript">
        	//更换验证码
        	function changeCode(){
        		var img = document.getElementById("validateCode");
        		img.src="${PATH}/validateCode?"+Math.random();
        	}
        	//管理员登录
			function login(){
				var cip = returnCitySN['cip'];
				var cname = returnCitySN['cname'];
				
				$.ajax({
					type:"post",
					dataType:"json",
					url:"${PATH}/adminlogin?cip="+cip+"&cname="+cname,
					data:$("#login").serialize(),
            		success:function(data){
            			if(data.code==0){
            				layer.alert(data.msg, {
            	                icon: 5,
            	                time: 1000
            	            });
            			}else{
                             layer.msg('登录成功', {
             	                icon: 6,
             	                time: 1000
             	             });
                             //登录成功 ，判断是否需要 记住密码
                             if($("input[type='checkbox']").is(':checked')){ //如果记住密码是勾选的，则保存账号密码到cookie
             			        setCookie('adminUser',$("input[name='aname']").val(),7); //保存帐号到cookie，有效期7天
             			        setCookie('adminPwd',$("input[name='apwd']").val(),7); //保存密码到cookie，有效期7天
             			     }
                             location.href = "/admin";
            			}	
            		}
				});
			}
        	$(function(){
        		//页面初始化时，如果帐号密码cookie存在则填充
        	    if(getCookie('adminUser') && getCookie('adminPwd')){
        		      var username = getCookie('adminUser');
        		      var password = getCookie('adminPwd');
        		      $("input[name='aname']").val(username);
        		      $("input[name='apwd']").val(password);
        		      $("input[name='check']").attr("checked","checked");
        	    }
        	    //复选框勾选状态发生改变时，如果未勾选则清除cookie
        	    $("input[name='check']").change(function(){
        		  	 if(!this.checked){
        		        delCookie('adminUser');
        		        delCookie('adminPwd');
        		     }
        	    });
        	});
			//设置cookie
			function setCookie(name,value,day){
				  var date = new Date();
				  date.setDate(date.getDate() + day);
				  document.cookie = name + '=' + value + ';expires='+ date;
			};
			//获取cookie
			function getCookie(name){
				  var reg = RegExp(name+'=([^;]+)');
				  var arr = document.cookie.match(reg);
				  if(arr){
				    	return arr[1];
				  }else{
				    	return '';
				  }
			};
			//删除cookie
			function delCookie(name){
			  	setCookie(name,null,-1);
			};
		</script>
         <script>
             $(document).ready(function() {
                $("input[type='text'],input[type='password']").blur(function() {
                    var $el = $(this);
                    var $parent = $el.parent();
                    $parent.attr('class', 'frame_style').removeClass(' form_error');
                    if ($el.val() == '') {
                        $parent.attr('class', 'frame_style').addClass(' form_error');
                    }
                });
                $("input[type='text'],input[type='password']").focus(function() {
                    var $el = $(this);
                    var $parent = $el.parent();
                    $parent.attr('class', 'frame_style').removeClass(' form_errors');
                    if ($el.val() == '') {
                        $parent.attr('class', 'frame_style').addClass(' form_errors');
                    } else {
                        $parent.attr('class', 'frame_style').removeClass(' form_errors');
                    }
                });
            }) 
            </script>