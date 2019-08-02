<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.yc.olshop.bean.Orderitem"%>
<%@page import="com.yc.olshop.bean.Orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <% String PATH=request.getContextPath(); %>
<!DOCTYPE html>
<html >
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
        <script type="text/javascript" src="${PATH }/admin/js/H-ui.js"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${PATH }/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript"></script>
        <script src="${PATH }/admin/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${PATH }/admin/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="${PATH }/admin/js/lrtk.js" type="text/javascript"></script>
        <title>订单详细</title>
    </head>
    
    <body>
        <div class="margin clearfix">
            <div class="Order_Details_style">
                <div class="Numbering">订单编号:
                    <b>${order.oid }</b>
                </div>
            </div>
            <div class="detailed_style">
                <!--收件人信息-->
                <div class="Receiver_style">
                    <div class="title_name">收件人信息</div>
                    <div class="Info_style clearfix">
                        <div class="col-xs-3">
                            <label class="label_name" for="form-field-2">收件人姓名：</label>
                            <div class="o_content">${order.user.name }</div></div>
                        <div class="col-xs-3">
                            <label class="label_name" for="form-field-2">收件人电话：</label>
                            <div class="o_content">${order.user.phone }</div></div>
                       <!--  <div class="col-xs-3">
                            <label class="label_name" for="form-field-2">收件地邮编：</label>
                            <div class="o_content">104545</div></div> -->
                        <div class="col-xs-3">
                            <label class="label_name" for="form-field-2">收件地址：</label>
                            <div class="o_content">${order.addr.address }</div></div>
                    </div>
                </div>
                <!--订单信息-->
                <div class="product_style">
                    <div class="title_name">产品信息</div>
                    <div class="Info_style clearfix">
                      <c:forEach items="${order.oitemList }" var="oitem">
                      	<div class="product_info clearfix">
                            <a href="#" class="img_link">
                                <img src="${PATH }/${oitem.product.pimage }" /></a>
                            <span>
                                <a href="#" class="name_link">${oitem.product.pname }</a>
                                <b>${oitem.product.pname }</b>
                                <!-- <p>规格：500g/斤</p>
                                <p>数量：2kg</p> -->
                                <p>价格：
                                    <b class="price">
                                        <i>￥</i>${oitem.product.discPrice }</b>
                                </p>
                               <!--  <p>状态：
                                    <i class="label label-success radius">有货</i></p> -->
                            </span>
                        </div>
                      </c:forEach>
                    </div>
                </div>
                <!--总价-->
                <div class="Total_style">
                    <div class="Info_style clearfix">
                        <div class="col-xs-3">
                            <label class="label_name" for="form-field-2">支付方式：</label>
                            <div class="o_content">支付宝支付</div></div>
                        <div class="col-xs-3">
                            <label class="label_name" for="form-field-2">支付状态：</label>
                            <div class="o_content">
                            	<c:choose>
                              		<c:when test="${order.status == 0}">
                              			<span class="label label-success radius">待付款</span>
                              		</c:when>
                              		<c:when test="${order.status == 1}">
                              			<span class="label label-success radius">待发货</span>
                              		</c:when>
                              		<c:when test="${order.status == 2}">
                              			<span class="label label-success radius">已发货</span>
                              		</c:when>
                              		<c:when test="${order.status == 3}">
                              			<span class="label label-success radius">已收货</span>
                              		</c:when>
                              		<c:when test="${order.status == 4}">
                              			<span class="label label-success radius">已评价</span>
                              		</c:when>
                              		<c:when test="${order.status == -1}">
                              			<span class="label label-failed radius">已失效</span>
                              		</c:when>
                              		<c:when test="${order.status == -2}">
                              			<span class="label label-success radius">待退款</span>
                              		</c:when>
                              		<c:when test="${order.status ==-3}">
                              			<span class="label label-success radius">已退款</span>
                              		</c:when>
                              	</c:choose>
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <label class="label_name" for="form-field-2">订单生成日期：</label>
                            <div class="o_content">
                            	<fmt:formatDate value="${order.ordertime }" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </div>
                        </div>
                        <!-- <div class="col-xs-3">
                            <label class="label_name" for="form-field-2">快递名称：</label>
                            <div class="o_content">中通快递</div></div> -->
                        <%-- <div class="col-xs-3">
                            <label class="label_name" for="form-field-2">发货日期：</label>
                            <div class="o_content">${ }</div></div> --%>
                    </div>
                    <div class="Total_m_style">
                    	<%-- <%
                        	Orders ord = (Orders)request.getAttribute("order");
                        	java.util.List <Orderitem> oitemList = ord.getOitemList();
                        	int totalCount =0;
                        	for(Orderitem oi : oitemList){
                        		totalCount+=oi.getPcount();
                        	}<%=totalCount %>
                        %> --%>
                        <span class="Total">总数：
                            <b>${order.prodCount }</b>
                        </span>
                        <span class="Total_price">总价：
                            <b>${order.totalMoney }</b>元</span>
                    </div>
                </div>
                
                <div class="Button_operation">
                    <button onclick="javascript:history.go(-1);" class="btn btn-primary radius" type="submit">
                        <i class="icon-save "></i>返回</button>
                    <!-- <button onclick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button> -->
                </div>
            </div>
        </div>
    </body>

</html>