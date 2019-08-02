package com.yc.olshop.test;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.olshop.bean.Category;
import com.yc.olshop.biz.CategoryBiz;

@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class TestCategory {
	@Autowired
	private CategoryBiz cz;

	@Test
	public void testName() throws Exception {
		List<Category> list = cz.queryAll();
		for (Category category : list) {
			System.out.println(category.getProdNum());
		}
		Assert.assertEquals(8, list.size());
	}
}
