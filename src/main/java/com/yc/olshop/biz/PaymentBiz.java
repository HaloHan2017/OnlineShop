package com.yc.olshop.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.olshop.bean.Address;
import com.yc.olshop.bean.AddressExample;
import com.yc.olshop.bean.AddressExample.Criteria;
import com.yc.olshop.bean.User;
import com.yc.olshop.dao.AddressMapper;
import com.yc.olshop.dao.UserMapper;
import com.yc.olshop.pojo.Cart;

@Service
public class PaymentBiz {
	@Autowired
	private RedisTemplate rt;// redis工具类
	
	@Autowired
	private UserMapper um;
	
	@Autowired
	private AddressMapper am;
	
	public Cart findCartByUser(String userId){
		Cart cart = (Cart) rt.opsForValue().get(userId + "");
		return cart;
	}

	public int findUserScore(int uid) {
		User user = um.selectByPrimaryKey(uid);
		return user.getScores();
	}

	public List<Address> findUserAddress(int uid) {
		AddressExample ae = new AddressExample();
		Criteria c = ae.createCriteria();
		c.andUidEqualTo(uid);
		List<Address> list = am.selectByExample(ae);
		return list;
	}
}
