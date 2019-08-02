<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        <script src="${PATH }/admin/js/H-ui.js" type="text/javascript"></script>
        <script src="${PATH }/admin/assets/layer/layer.js" type="text/javascript"></script>
        <title>退款详细</title></head>
    
    <body>
        <div class="margin clearfix">
            <div class="Refund_detailed">
                <div class="Numbering">退款单编号:
                    <b>${order.oid }</b>
                </div>
                <div class="detailed_style">
                    <!--退款信息-->
                    <div class="Receiver_style">
                        <div class="title_name">退款信息</div>
                        <div class="Info_style clearfix">
                            <div class="col-xs-3">
                                <label class="label_name" for="form-field-2">退款人姓名：</label>
                                <div class="o_content">${order.user.name }</div></div>
                            <div class="col-xs-3">
                                <label class="label_name" for="form-field-2">退款人电话：</label>
                                <div class="o_content">${order.user.phone }</div></div>
                            <div class="col-xs-3">
                                <label class="label_name" for="form-field-2">退款方式：</label>
                                <div class="o_content">支付宝</div></div>
                            <div class="col-xs-3">
                                <label class="label_name" for="form-field-2">退款数量：</label>
                                <div class="o_content">${order.prodCount }件</div></div>
                            <div class="col-xs-3">
                                <label class="label_name" for="form-field-2">退款金额：</label>
                                <div class="o_content">${order.totalMoney }元</div></div>
                            <div class="col-xs-3">
                                <label class="label_name" for="form-field-2">退款日期：</label>
                                <div class="o_content">
                                	<fmt:formatDate value="${order.ordertime }" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                <label class="label_name" for="form-field-2">状态：</label>
                                <div class="o_content">
                                	<c:choose>
	                                	<c:when test="${order.status==-2 }">待退款</c:when>
	                                	<c:when test="${order.status==-3 }">已退款</c:when>
                                	</c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="Receiver_style">
                        <div class="title_name">退款说明</div>
                        <div class="reund_content">
                        	<c:if test="${order.desc==null }">暂无说明</c:if>
                        	<c:if test="${order.desc!=null }">${order.desc }</c:if>
                       	</div>
                    </div>
                    <!--产品信息-->
                    <div class="product_style">
                        <div class="title_name">产品信息</div>
                        <div class="Info_style clearfix">
                          <c:forEach items="${order.oitemList }" var="oitem">
                          	<div class="product_info clearfix">
                                <a href="#" class="img_link">
                                    <img src="${PATH }/${oitem.product.pimage }"></a>
                                <span>
                                    <a href="#" class="name_link">${oitem.product.pname }</a>
                                    <b>${oitem.product.pname }</b>
                                    <!-- <p>编号：HY54567</p>
                                    <p>规格：500g/斤</p> -->
                                    <p>数量：${oitem.pcount }件</p>
                                    <p>价格：
                                        <b class="price">
                                            <i>￥</i>${oitem.product.discPrice }</b>
                                    </p>
                                </span>
                            </div>
                          </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>