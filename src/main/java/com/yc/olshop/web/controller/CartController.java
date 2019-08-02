package com.yc.olshop.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yc.olshop.bean.Result;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.CartBiz;
import com.yc.olshop.pojo.Cart;

@RestController
@RequestMapping("cart")
public class CartController {
	@Autowired
	private CartBiz cz;

	/**
	 * 添加购物车
	 * 
	 * @param pid
	 *            商品id
	 * @param pcount
	 *            商品数量
	 * @return
	 */
	@GetMapping("add")
	public Result addToCart(Integer pid, @RequestParam(defaultValue = "1") Integer pcount, HttpSession session) {
		Result result = new Result(1, "添加成功");
		// 根据 当前登录user，获取对应的cart
		User user = (User) session.getAttribute("user");
		int ret = cz.addToCart(pid, pcount, user.getUsername() + "-" + user.getUid());
		if (ret <= 0) {
			result = new Result(-1, "添加失败");
		}
		return result;
	}

	/**
	 * 删除购物车 某一行
	 * 
	 * @param pid
	 * @param session
	 * @return
	 */
	@GetMapping("del")
	public Result delFromCart(Integer pid, HttpSession session) {
		Result result = new Result(1, "删除成功");
		// 根据 当前登录user，获取对应的cart
		User user = (User) session.getAttribute("user");
		int ret = cz.delFromCart(pid, user.getUsername() + "-" + user.getUid());
		if (ret <= 0) {
			result = new Result(1, "删除失败");
		}
		return result;
	}

	/**
	 * 清空购物车
	 * 
	 * @param pid
	 * @param session
	 * @return
	 */
	@GetMapping("delAll")
	public Result delCart(HttpSession session) {
		Result result = new Result(1, "清空购物车成功");
		// 根据 当前登录user，获取对应的cart
		User user = (User) session.getAttribute("user");
		int ret = cz.delCart(user.getUsername() + "-" + user.getUid());
		if (ret <= 0) {
			result = new Result(1, "清空购物车失败");
		}
		return result;
	}

	/**
	 * 查询购物车
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping("query")
	public Result query(HttpSession session) {
		Result result = new Result(1, "ok");
		// 根据 当前登录user，获取对应的cart
		User user = (User) session.getAttribute("user");
		Cart cart = cz.queryCart(user.getUsername() + "-" + user.getUid());
		result.setData(cart);
		return result;
	}

	/**
	 * 添加 商品数量
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping("addPcount")
	public Result addPcount(Integer pid, @RequestParam(defaultValue = "1") Integer pcount, HttpSession session) {
		if (pcount <= 0)
			pcount = 1;
		Result result = new Result(1, "ok");
		// 根据 当前登录user，获取对应的cart
		User user = (User) session.getAttribute("user");
		Cart cart = cz.addPcount(pid, pcount, user.getUsername() + "-" + user.getUid());
		result.setData(cart);
		return result;
	}

	/**
	 * 确认product是否已在购物车当中
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping("checkProd")
	public Result checkProdIsInCartByPid(Integer pid, HttpSession session) {

		Result result = new Result(1, "ok");
		// 根据 当前登录user，获取对应的cart
		User user = (User) session.getAttribute("user");
		try {
			boolean ret = cz.checkProdIsInCartByPid(pid, user.getUsername() + "-" + user.getUid());
			result.setData(ret);
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(-1, "服务器忙");
		}
		return result;
	}
}
