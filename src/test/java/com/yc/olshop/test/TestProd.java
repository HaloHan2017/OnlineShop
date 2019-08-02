package com.yc.olshop.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.olshop.bean.Category;
import com.yc.olshop.biz.ProductBiz;

@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class TestProd {
	@Autowired
	private ProductBiz pz;

	@Test
	public void testName() throws Exception {
		List<Category> map = pz.querySaleByCategory();
		for (Category category : map) {
			System.out.println(category.getProdNum() + "-" + category.getProdSales());
		}
	}
}
