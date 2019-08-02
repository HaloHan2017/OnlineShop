package com.yc.olshop.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.olshop.biz.LeaveMsgBiz;

@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class TestAdminHome {
	@SuppressWarnings("rawtypes")
	@Autowired
	private LeaveMsgBiz lz;

	@Test
	public void testAdd() throws Exception {
		int cnt = lz.queryNewNotReplayLeaveMsgCnt();
		System.out.println(cnt);
	}

}
