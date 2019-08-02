package com.yc.olshop.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.olshop.biz.ProductBiz;

@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class TestRedis {
	@SuppressWarnings("rawtypes")
	@Autowired
	private RedisTemplate rt;
	@Autowired
	private ProductBiz pb;

	@Test
	public void testName() throws Exception {
		rt.opsForValue().set("name", "tom");
		System.out.println(rt.opsForValue().get("name"));

	}

	@Test
	public void testName2() throws Exception {
		int r = pb.delAllViewdProds("zhangsan9");
		System.out.println(r);
	}
}
