package com.yc.olshop.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.yc.olshop.bean.Product;
import com.yc.olshop.pojo.Cart;
import com.yc.olshop.pojo.CartItem;
import com.yc.olshop.utils.Arith;

@Service
public class CartBiz {
	@Autowired
	private ProductBiz pbiz;
	@Autowired
	private RedisTemplate rt;// redis工具类

	// 添加商品到购物车
	@SuppressWarnings("unchecked")
	public int addToCart(Integer pid, Integer pcount, String userId) {
		try {
			// 1.根据pid查找 商品
			Product product = pbiz.selectByPid(pid);
			// 2.新建一个明细item
			CartItem ci = new CartItem();
			ci.setPcount(pcount);
			ci.setProduct(product);
			double sumMoney = Math.floor(Arith.mul(product.getDiscPrice(), pcount));
			ci.setSumMoney(sumMoney);
			// 3.根据uid 从云端redis数据库中 获得 cart
			Cart cart = (Cart) rt.opsForValue().get(userId + "");
			// 如果cart为空，则新建一个
			List<CartItem> citemList = null;
			if (cart == null) {
				cart = new Cart();
				citemList = new ArrayList<>();
			} else {
				// 4.给cart设置cartItem
				citemList = cart.getCitemList();
			}
			citemList.add(ci);
			cart.setCitemList(citemList);

			// 5.给cart设置totalMoney
			Double totalMoney = cart.getTotalMoney() != null ? cart.getTotalMoney() : 0.0;
			totalMoney += ci.getSumMoney();// 加上新添加的citem的sunMoney
			cart.setTotalMoney(Math.floor(totalMoney));
			// 6.将操作完毕的cart，重新写入redis
			rt.opsForValue().set(userId + "", cart);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	// 删除购物车 item
	@SuppressWarnings("unchecked")
	public int delFromCart(Integer pid, String userId) {
		try {
			// 1.根据pid查找 商品
			// Product product = pbiz.selectByPid(pid);
			// 2.根据uid 从云端redis数据库中 获得 cart
			Cart cart = (Cart) rt.opsForValue().get(userId + "");
			// 3.从 cart 中 根据商品pid，删除CartItem
			List<CartItem> citemList = cart.getCitemList();
			for (int i = 0; i < citemList.size(); i++) {
				Integer pid2 = citemList.get(i).getProduct().getPid();
				if (pid2.equals(pid)) {
					// 找到，进行删除(同时还要对totalMoney 减少)，退出循环
					double totalMoney = Math.floor(Arith.sub(cart.getTotalMoney(), citemList.get(i).getSumMoney()));
					cart.setTotalMoney(totalMoney);
					citemList.remove(i);
					cart.setCitemList(citemList);
					break;
				}
			}
			// 4.将操作完毕的cart，重新写入redis
			rt.opsForValue().set(userId + "", cart);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	// 清空购物车
	@SuppressWarnings("unchecked")
	public int delCart(String userId) {
		try {
			rt.opsForValue().set(userId + "", null);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	// 查询购物车
	public Cart queryCart(String userId) {
		return (Cart) rt.opsForValue().get(userId);
	}

	// 添加商品数量
	@SuppressWarnings("unchecked")
	public Cart addPcount(Integer pid, Integer pcount, String userId) {
		try {
			// 1.根据pid查找 商品
			Product product = pbiz.selectByPid(pid);
			// 2.根据uid 从云端redis数据库中 获得 cart
			Cart cart = (Cart) rt.opsForValue().get(userId);
			// 3.遍历 citemlist，找到要修改数量的item
			List<CartItem> citemList = cart.getCitemList();
			for (int i = 0; i < citemList.size(); i++) {
				Integer pid2 = citemList.get(i).getProduct().getPid();
				if (pid2.equals(pid)) {
					// //找到对应 citem，对数量进行 响应操作 退出循环
					Double oldSumMoney = citemList.get(i).getSumMoney();
					// citemList.get(i).setPcount(citemList.get(i).getPcount() +
					// pcount);// 改变数量
					citemList.get(i).setPcount(pcount);
					double sumMoney = Math.floor(
							Arith.mul(citemList.get(i).getPcount(), citemList.get(i).getProduct().getDiscPrice()));
					citemList.get(i).setSumMoney(sumMoney);// 改变sumMoney
					// 计算出 改变的 sumMoney
					Double newSumMoney = citemList.get(i).getSumMoney();
					Double changeSumMoney = newSumMoney - oldSumMoney;
					// 对应改变 cart的totalMoney
					cart.setTotalMoney(cart.getTotalMoney() + changeSumMoney);
					cart.setCitemList(citemList);
					break;
				}
			}
			rt.opsForValue().set(userId + "", cart);
			return cart;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// 确认product是否已在购物车当中
	public boolean checkProdIsInCartByPid(Integer pid, String userId) {
		// 1.根据uid 从云端redis数据库中 获得 cart
		Cart cart = (Cart) rt.opsForValue().get(userId);
		// 2.遍历 citemlist，判断是否包含该product
		if (cart == null) {
			return false;
		}
		List<CartItem> citemList = cart.getCitemList();
		if (citemList == null || citemList.size() <= 0) {
			return false;
		}
		for (CartItem cartItem : citemList) {
			if (cartItem.getProduct().getPid() == pid) {
				return true;
			}
		}
		return false;
	}

}
