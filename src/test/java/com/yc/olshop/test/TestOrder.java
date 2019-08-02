package com.yc.olshop.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yc.olshop.bean.Orders;
import com.yc.olshop.bean.OrdersExample;
import com.yc.olshop.bean.Product;
import com.yc.olshop.biz.OrderBiz;
import com.yc.olshop.dao.OrderitemMapper;
import com.yc.olshop.dao.OrdersMapper;
import com.yc.olshop.dao.ProductMapper;
import com.yc.olshop.pojo.ProChart;
import com.yc.olshop.utils.TimeUtil;

@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class TestOrder {
	@Autowired
	private OrderBiz oz;
	@Autowired
	private OrdersMapper om;
	@Autowired
	private OrderitemMapper oim;
	@Autowired
	private ProductMapper pm;

	@Test
	public void testName() throws Exception {

		Map<String, Object> map = oz.queryTranscCondition();
		System.out.println(map.get("totalOrdersCount"));
		System.out.println(map.get("successOrdersCount"));
		System.out.println(map.get("transMoney"));
		System.out.println(map.get("failedOrdersCount"));
		System.out.println(map.get("returnMoney"));

	}

	@Test
	public void testName1() throws Exception {
		OrdersExample oe = new OrdersExample();
		oe.createCriteria().andOrdertimeBetween(TimeUtil.getFirstDayOfCurrentMonth(), new Date());

	}

	@Test
	public void testName2() throws Exception {
		Map<String, Object> map = oz.queryTranscCondition();
		System.out.println();
	}

	@Test
	public void testName3() throws Exception {
		Map<String, Object> map = oz.queryTransMoney();
		System.out.println(map.get("allTransMoney").toString());
		System.out.println(map.get("todayTransMoney").toString());
		System.out.println(map.get("allOrdersNum").toString());
	}

	@Test
	public void testName4() throws Exception {
		Orders o = oz.queryDetailsByOid("D201906201058009140");
		System.out.println(o.getProdCount());
		// Assert.assertNotNull(om.selectByPrimaryKey("D201906201058009140"));
	}

	@Test
	public void testName5() throws Exception {
		int[] arr = { 1, 2, 3, 4 };
		List<Integer> count = new ArrayList<>();
		List<Double> money = new ArrayList<>();
		List<Map<String, Object>> list = om.getOrdersTransByDays(TimeUtil.getFirstDayStrOfCurrentMonth(), 15, arr);
		for (Map<String, Object> map : list) {
			// System.out.print(map.get("orderTime") + ",");
			// System.out.print(map.get("odrNum") + ",");
			count.add(Integer.parseInt(map.get("odrNum").toString()));
			money.add(Double.parseDouble(map.get("odrMoney").toString()));
			// System.out.print(map.get("odrMoney") + "\n\n");
		}
		System.out.println(count.size());
		System.out.println(money.size());
	}

	@Test
	public void testName6() throws Exception {
		Map<String, Object> map = oz.queryOrderTransAllYearByMonth();
		List<Integer> allOdrCntList = (List<Integer>) map.get("allOdrCntList");
		List<Integer> noPaidOdrCntList = (List<Integer>) map.get("noPaidOdrCntList");
		List<Integer> paidOdrCntList = (List<Integer>) map.get("paidOdrCntList");
		List<Integer> delieverOdrCntList = (List<Integer>) map.get("delieverOdrCntList");
		List<Integer> recieveOdrCntList = (List<Integer>) map.get("recieveOdrCntList");
		List<Integer> commentOdrCntList = (List<Integer>) map.get("commentOdrCntList");

		for (Integer integer : allOdrCntList) {
			System.out.print(integer + ",");
		}
		System.out.println();
		for (Integer integer : noPaidOdrCntList) {
			System.out.print(integer + ",");
		}
		System.out.println();
		for (Integer integer : paidOdrCntList) {
			System.out.print(integer + ",");
		}
		System.out.println();
		for (Integer integer : delieverOdrCntList) {
			System.out.print(integer + ",");
		}
		System.out.println();
		for (Integer integer : recieveOdrCntList) {
			System.out.print(integer + ",");
		}
		System.out.println();
		for (Integer integer : commentOdrCntList) {
			System.out.print(integer + ",");
		}
		System.out.println();
	}

	@Test
	public void testName7() throws Exception {
		List<ProChart> list = oz.queryOrderNumByPro();
		System.out.println(list.size());
		for (ProChart proChart : list) {
			System.out.println(proChart.getName() + " " + proChart.getValue());
		}
	}

	@Test
	public void testName8() throws Exception {
		int[] pidArr = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		// List<Product> list = pm.selectByPidsWithPage(pidArr, 4, 3);
		// System.out.println(list.size());
		// int countByPids = pm.getCountByPids(pidArr);
		// System.out.println(countByPids);
		PageHelper.startPage(2, 3);
		List<Product> list = pm.selectByPidsWithPage(pidArr);
		System.out.println(list.size());
		PageInfo<Product> page = new PageInfo<>(list);
		System.out.println(page.getPages());
		for (Product p : page.getList()) {
			System.out.println("--" + p.getPid() + " " + p.getDiscPrice());
		}
	}
}
