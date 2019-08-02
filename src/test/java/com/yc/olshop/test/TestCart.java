package com.yc.olshop.test;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.olshop.bean.Comment;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.CartBiz;
import com.yc.olshop.biz.CommentBiz;
import com.yc.olshop.pojo.Cart;
import com.yc.olshop.pojo.CartItem;

@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class TestCart {
	@SuppressWarnings("rawtypes")
	@Autowired
	private CartBiz cz;

	@Autowired
	private CommentBiz cb;

	@Test
	public void testName5() throws Exception {
		List<Integer> like = cb.selectLike(1);
		System.out.println(like.size());
	}

	@Test
	public void testcomm() {
		int pid = 10;
		List<Comment> lst = cb.selectAllComment(pid);
		System.out.println(lst.get(0).toString());
	}

	@Test
	public void testAdd() throws Exception {
		User user = new User();
		user.setUid(1);
		user.setUsername("zhangsan");

		int pid = 1;
		int pcount = 1;

		int ret = cz.addToCart(pid, pcount, user.getUsername() + "-" + user.getUid());
		Assert.assertEquals(1, ret);
	}

	@Test
	public void testAdd2() throws Exception {
		User user = new User();
		user.setUid(1);
		user.setUsername("zhangsan");

		int pid = 2;
		int pcount = 2;

		int ret = cz.addToCart(pid, pcount, user.getUsername() + "-" + user.getUid());
		Assert.assertEquals(1, ret);
	}

	@Test
	public void testDel() throws Exception {
		User user = new User();
		user.setUid(1);
		user.setUsername("zhangsan");

		int pid = 1;
		int ret = cz.delFromCart(pid, user.getUsername() + "-" + user.getUid());
		Assert.assertEquals(1, ret);
	}

	@Test
	public void testDelAll() throws Exception {
		User user = new User();
		user.setUid(1);
		user.setUsername("zhangsan");

		int pid = 1;
		int ret = cz.delCart(user.getUsername() + "-" + user.getUid());
		Assert.assertEquals(1, ret);
	}

	@Test
	public void testQuery() throws Exception {
		User user = new User();
		user.setUid(1);
		user.setUsername("zhangsan");

		Cart cart = cz.queryCart(user.getUsername() + "-" + user.getUid());
		System.out.println(cart.getTotalMoney());
		List<CartItem> citemList = cart.getCitemList();
		for (CartItem cartItem : citemList) {
			System.out.println(cartItem.getProduct().getPname() + "--" + cartItem.getPcount());
		}
	}
}
