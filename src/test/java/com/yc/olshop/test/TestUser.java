package com.yc.olshop.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.alibaba.fastjson.JSON;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.UserBiz;

@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class TestUser {
	@Autowired
	private UserBiz uz;

	@Test
	public void testName() throws Exception {
		User u = new User();
		u.setName("test");
		u.setUsername("testun");
		u.setEmail("22222222222aaa");
		String user = JSON.toJSONString(u);
		uz.insertOrUpdateUser(user);
	}

	@Test
	public void testName1() throws Exception {
		User u = new User();
		u.setUid(10);
		u.setHead("/upload/head/-c8bf0683663d4a7.jpg");
		String user = JSON.toJSONString(u);
		uz.insertOrUpdateUser(user);
	}
}
