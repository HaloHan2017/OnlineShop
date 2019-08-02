package com.yc.olshop.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yc.olshop.bean.Address;
import com.yc.olshop.bean.Result;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.CartBiz;
import com.yc.olshop.biz.OrderBiz;
import com.yc.olshop.biz.OrderItemBiz;
import com.yc.olshop.biz.PaymentBiz;
import com.yc.olshop.biz.UserBiz;
import com.yc.olshop.pojo.Cart;
import com.yc.olshop.pojo.CartItem;

@RestController
@RequestMapping("payment")
public class PaymentController {

	@Autowired
	PaymentBiz paymentBiz;

	@Autowired
	CartBiz cartBiz;

	@Autowired
	OrderBiz orderBiz;

	@Autowired
	OrderItemBiz orderItemBiz;

	@Autowired
	UserBiz userBiz;

	// 购物车
	@GetMapping("cartList")
	public Result findProductInPay(HttpSession session) {
		// 根据 当前登录user，获取对应的cart
		User user = (User) session.getAttribute("user");
		Cart cart = paymentBiz.findCartByUser(user.getUsername() + "-" + user.getUid());
		if (cart == null) {
			return new Result(0, "请先添加商品到购物车");
		}
		List<CartItem> list = cart.getCitemList();
		Result result = new Result();
		result.setData(list);
		result.setCode(1);
		return result;
	}

	// 获取当前用户的积分
	@GetMapping("getCurrentUserScore")
	public int getCurrentUserScore(HttpSession session) {
		// 根据 当前登录user，获取对应的cart
		User user = (User) session.getAttribute("user");
		int score = paymentBiz.findUserScore(user.getUid());
		return score;
	}

	// 当前用户所有的收货地址
	@GetMapping("userAddress")
	public List<Address> userAddress(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Address> list = paymentBiz.findUserAddress(user.getUid());
		return list;
	}

	// 阿里支付
	@RequestMapping("payForAli")
	@Transactional
	public ModelAndView findProductInPay(ModelAndView model,
			// 订单号
			@RequestParam(value = "orderId", required = true) String orderId,
			// 产品号
			@RequestParam(value = "pid", required = true) int[] pid,
			// 地址
			@RequestParam(value = "address", required = true) int addressId,
			// 订单总金额
			@RequestParam(value = "WIDtotal_amount", required = true) double totalMoney,
			// 每个商品对应的数量，与产品号一一对应
			@RequestParam(value = "pnum", required = true) int[] pnum,
			// 每个商品对应的价格，与产品号对应
			@RequestParam(value = "prealprice", required = true) double[] realPrice,
			@RequestParam(value = "scores", required = true) int scores, HttpSession session) {
		// 进入支付后，需要清空购物车，将商品写入订单表
		// 先清空购物车
		User user = (User) session.getAttribute("user");
		cartBiz.delCart(user.getUsername() + "-" + user.getUid());
		// 写入订单表
		orderBiz.addOrderFromCart(orderId, totalMoney, user.getUid(), addressId);
		// 写入订单详情表
		orderItemBiz.addOrderItemFromCart(pid, pnum, totalMoney, orderId, realPrice);
		// 扣除积分
		userBiz.modifyScores(user.getUid(), scores);
		// 获取订单号
		model.setViewName("alipay.pay");
		return model;
	}

	// 支付成功修改订单状态码
	@RequestMapping("payForAliSuccess")
	public ModelAndView payForAliSuccess(ModelAndView model, @RequestParam("out_trade_no") String orderId) {
		orderBiz.changStatusForOrderWithPaied(orderId);
		// 修改商品里面的销售数量
		orderItemBiz.modifyProductSaleNum(orderId);
		// 用js跳转网页，直接后台跳转会丢失文件
		model.setViewName("changeToPage");
		return model;
	}

	// 订单待支付，调用支付宝支付
	@RequestMapping("payForAliWithStatusEqualsZero")
	public ModelAndView payForAliWithStatusEqualsZero(ModelAndView model) {
		model.setViewName("alipay.pay");
		return model;
	}

	// 订单确认收货
	@PostMapping("changeStatusWithReceive")
	public Result changeStatusWithReceive(@RequestParam("orderId") String orderId) {
		int status = orderBiz.changStatusForOrderWithReceive(orderId);
		Result result = new Result();
		if (status <= 0) {
			result.setCode(-1);
			result.setMsg("服务器忙");
		} else {
			result.setCode(1);
			result.setData(status);
		}

		return result;
	}
}
