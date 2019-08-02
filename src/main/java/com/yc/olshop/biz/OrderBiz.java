package com.yc.olshop.biz;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.yc.olshop.bean.Address;
import com.yc.olshop.bean.MyConstants;
import com.yc.olshop.bean.Orderitem;
import com.yc.olshop.bean.OrderitemExample;
import com.yc.olshop.bean.Orders;
import com.yc.olshop.bean.OrdersExample;
import com.yc.olshop.bean.OrdersExample.Criteria;
import com.yc.olshop.bean.Product;
import com.yc.olshop.bean.Result;
import com.yc.olshop.bean.User;
import com.yc.olshop.dao.AddressMapper;
import com.yc.olshop.dao.OrderitemMapper;
import com.yc.olshop.dao.OrdersMapper;
import com.yc.olshop.dao.ProductMapper;
import com.yc.olshop.dao.UserMapper;
import com.yc.olshop.pojo.ProChart;
import com.yc.olshop.utils.TimeUtil;

@Service
@Transactional
public class OrderBiz {
	@Autowired
	private OrdersMapper om;
	@Autowired
	private OrderitemMapper oim;
	@Autowired
	private ProductMapper pm;
	@Autowired
	private UserMapper um;
	@Autowired
	private AddressMapper am;

	/**
	 * 查询全年 12 个月，每个月订单（已付款。。。）的数量
	 * 
	 * @return
	 */
	public Map<String, Object> queryOrderTransAllYearByMonth() {
		// 当前年的1.1
		String fd = TimeUtil.getCurrYearFD();// 1.1
		String lmd = TimeUtil.getCurrYearLMD();// 12.1

		// List<Integer> allOdrCntList = getOrderCount(fd, lmd, null);

		// 查询未付款订单的数量
		List<Integer> noPaidOdrCntList = getOrderCount(fd, lmd, 0);
		// 查询已付款
		List<Integer> paidOdrCntList = getOrderCount(fd, lmd, MyConstants.PAIED_ORDER);
		// 已发货
		List<Integer> delieverOdrCntList = getOrderCount(fd, lmd, MyConstants.DELIVERED_ORDER);
		// 已收货
		List<Integer> recieveOdrCntList = getOrderCount(fd, lmd, MyConstants.RECEIVED_ORDER);
		// 已评价
		List<Integer> commentOdrCntList = getOrderCount(fd, lmd, MyConstants.COMMENTED_ORDER);

		// 统计 所有订单
		List<Integer> allOdrCntList = getOrderCount(noPaidOdrCntList, paidOdrCntList, delieverOdrCntList,
				recieveOdrCntList, commentOdrCntList);

		// 查询数据完成，封装到map中
		Map<String, Object> map = new HashMap<>();
		map.put("allOdrCntList", allOdrCntList);
		map.put("noPaidOdrCntList", noPaidOdrCntList);
		map.put("paidOdrCntList", paidOdrCntList);
		map.put("delieverOdrCntList", delieverOdrCntList);
		map.put("recieveOdrCntList", recieveOdrCntList);
		map.put("commentOdrCntList", commentOdrCntList);

		return map;

	}

	private List<Integer> getOrderCount(List<Integer> noPaidOdrCntList, List<Integer> paidOdrCntList,
			List<Integer> delieverOdrCntList, List<Integer> recieveOdrCntList, List<Integer> commentOdrCntList) {
		List<Integer> allOdrCntList = new ArrayList<>();
		for (int i = 0; i < 12; i++) {
			int cnt = 0;
			cnt = noPaidOdrCntList.get(i) + paidOdrCntList.get(i) + delieverOdrCntList.get(i) + recieveOdrCntList.get(i)
					+ commentOdrCntList.get(i);
			allOdrCntList.add(cnt);
		}
		return allOdrCntList;
	}

	private List<Integer> getOrderCount(String fd, String lmd, Integer code) {
		List<Integer> odrCntList = new ArrayList<>();
		List<Map<String, Object>> mapList = om.queryOrderTransAllYearByMonth(fd, lmd, code);
		for (Map<String, Object> map : mapList) {
			int i = Integer.parseInt(map.get("number").toString());
			odrCntList.add(i);
		}
		return odrCntList;
	}

	/**
	 * 查询交易情况（当月）
	 * 
	 * @return
	 */
	public Map<String, Object> queryTranscCondition() {
		Map<String, Object> map = new HashMap<>();
		OrdersExample oe = new OrdersExample();

		// 所有订单的数量--设置当前月
		// oe.createCriteria().andOrdertimeGreaterThanOrEqualTo(TimeUtil.getFirstDayOfCurrentMonth());//
		// 获取当前月的第一天，然后条件设置为大于它，即可获取本月所有订单
		int totalOrdersCount = om.countByExample(null);
		map.put("totalOrdersCount", totalOrdersCount);

		// 成功订单的数量(status大于0)
		// oe.createCriteria().andStatusGreaterThan(MyConstants.NOT_PAIED_ORDER);//
		// >0,代表订单成功;
		int successOrdersCount = om.countByExample(oe);
		map.put("successOrdersCount", successOrdersCount);

		// 当月所有成功订单的交易金额
		List<Orders> list = om.selectByExample(oe);
		double transMoney = 0;
		for (Orders Orders : list) {
			transMoney += Orders.getTotalMoney();
		}
		map.put("transMoney", transMoney);

		// 失败订单的数量 小于0，失败订单
		oe.clear();
		oe.createCriteria().andStatusLessThan(MyConstants.NOT_PAIED_ORDER);
		// .andOrdertimeGreaterThanOrEqualTo(TimeUtil.getFirstDayOfCurrentMonth());//
		// 小于0，失败订单
		int failedOrdersCount = om.countByExample(oe);
		map.put("failedOrdersCount", failedOrdersCount);

		// 退款订单的总金额
		oe.clear();
		oe.createCriteria().andStatusEqualTo(MyConstants.MONEY_RETURNED_ORDER);
		// .andOrdertimeGreaterThan(TimeUtil.getFirstDayOfCurrentMonth());//
		// 等于-3，退款订单
		double returnMoney = 0;
		List<Orders> list2 = om.selectByExample(oe);
		for (Orders Orders : list2) {
			returnMoney += Orders.getTotalMoney();
		}
		map.put("returnMoney", returnMoney);

		return map;
	}

	/**
	 * 当月 销售情况（用图表展示
	 */
	public Map<String, Object> querySalesCondition() {
		Map<String, Object> map = new HashMap<>();
		// 查询订单类型

		// 查询成功订单--订单数和交易金额 status>0
		int[] statusArrOfSuccess = { 1, 2, 3, 4 };
		List<Map<String, Object>> mp1 = om.getOrdersTransByDays(TimeUtil.getFirstDayStrOfCurrentMonth(), 31,
				statusArrOfSuccess);
		List<Result> resultListOfSucc = getListFromMap(mp1);
		// 查询失败订单--订单数和交易金额
		int[] statusArrOfFailed = { -1, -2, -3 };
		List<Map<String, Object>> mp2 = om.getOrdersTransByDays(TimeUtil.getFirstDayStrOfCurrentMonth(), 31,
				statusArrOfFailed);
		List<Result> resultListOfFailed = getListFromMap(mp2);

		map.put("resultListOfSucc", resultListOfSucc);
		map.put("resultListOfFailed", resultListOfFailed);
		return map;
	}

	// 将 当月 销售情况的查询结果Map，抽出数据
	private List<Result> getListFromMap(List<Map<String, Object>> mList) {
		List<Result> resultsList = new ArrayList<>();
		List<Integer> countList = new ArrayList<>();
		List<Double> moneyList = new ArrayList<>();
		for (Map<String, Object> map : mList) {
			countList.add(Integer.parseInt(map.get("odrNum").toString()));
			moneyList.add(Double.parseDouble(map.get("odrMoney").toString()));
		}
		Result r1 = new Result();
		r1.setData(countList);
		Result r2 = new Result();
		r2.setData(moneyList);

		resultsList.add(r1);
		resultsList.add(r2);
		return resultsList;
	}

	// 分页查询Orders，动态条件
	public List<Orders> queryOrdersByConditionAndPage(Integer scode, String oid) {
		OrdersExample oe = new OrdersExample();
		Criteria c = oe.createCriteria();
		if (scode != null) {
			// 查询对应 status码的 订单列表
			c.andStatusEqualTo(scode);
		} else if (!StringUtil.isEmpty(oid)) {
			// 根据 oid 模糊查询
			c.andOidLike("%" + oid + "%");
		} else {
			// 查询全部订单（但不包括 待退款和已退款 ）
			c.andStatusGreaterThanOrEqualTo(MyConstants.FAILED_ORDER);// 状态码 >=
		}
		// 加上 查询条件
		// 查出来 符合 条件的订单
		oe.setOrderByClause("ordertime desc");
		List<Orders> orderList = om.selectByExample(oe);
		// 对每一个 order 进行 关联 orderitem列表，统计订单里商品的数量
		for (Orders odr : orderList) {
			// 根据oid 查出 对应的orderitem列表
			OrderitemExample oie = new OrderitemExample();
			oie.createCriteria().andOidEqualTo(odr.getOid());
			List<Orderitem> oitemList = oim.selectByExample(oie);
			// 统计 每个item里的商品数，累加
			Integer prodCount = 0;
			if (oitemList != null && oitemList.size() > 0) {
				for (Orderitem orderitem : oitemList) {
					prodCount += orderitem.getPcount();
					// 根据oitem里的pid查到对应的product
					Product product = pm.selectByPrimaryKey(orderitem.getPid());
					// 设置到oitem里
					orderitem.setProduct(product);
				}
			}

			// 设置到order里去
			odr.setProdCount(prodCount);
			// 设置oitemList到order里去
			odr.setOitemList(oitemList);
		}
		return orderList;
	}

	/**
	 * 根据oid 删除Orders（以及对应的Orderitem）
	 * 
	 * @param oid
	 * @return
	 */
	@Transactional // 注解事务
	public int deleteByOid(String oid) {
		// 删除订单
		try {
			om.deleteByPrimaryKey(oid);
			// 删除订单对应的 orderitem列表
			OrderitemExample oie = new OrderitemExample();
			oie.createCriteria().andOidEqualTo(oid);
			oim.deleteByExample(oie);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	// 发货 和 退款
	public int deliverAndReturnMoney(String oid, int flag) {
		OrdersExample oe = new OrdersExample();
		oe.createCriteria().andOidEqualTo(oid);
		// 根据 oid 查找订单
		List<Orders> list = om.selectByExample(oe);
		// 管理 order的所有itemlist
		if (list == null || list.size() == 0) {
			return -1;
		}
		for (Orders o : list) {
			OrderitemExample oie = new OrderitemExample();
			oie.createCriteria().andOidEqualTo(o.getOid());
			List<Orderitem> oitemList = oim.selectByExample(oie);
			o.setOitemList(oitemList);
		}
		Orders Orders = list.get(0);

		if (flag == 1) {
			// 发货
			// 1.先判断是否可以进行 发货（只能是出于“待发货”状态，才可以进行 发货）
			if (Orders.getStatus() != MyConstants.PAIED_ORDER) {
				return -2;
			} else
				Orders.setStatus(MyConstants.DELIVERED_ORDER);// 已发货状态
		} else {
			// 1.先判断是否可以进行 退款 （只能是出于“待退款”状态，才可以进行 退款）
			if (Orders.getStatus() != MyConstants.MONEY_RETURNING_ORDER) {
				return -3;
			} else {
				Orders.setStatus(MyConstants.MONEY_RETURNED_ORDER);// 已退货状态
				// 将 对应商品的 的销售数量 减去 对应的 pcount
				List<Orderitem> oitemList = Orders.getOitemList();
				for (Orderitem oi : oitemList) {
					// 对每个oi进行商品销量 的 减法
					Integer pid = oi.getPid();
					Product product = pm.selectByPrimaryKey(pid);
					product.setPsalenum(product.getPsalenum() - oi.getPcount());
					pm.updateByPrimaryKeySelective(product);
				}
			}

		}
		// 进行操作
		return om.updateByPrimaryKeySelective(Orders);
	}

	// 查询 订单 详情
	public Orders queryDetailsByOid(String oid) {
		// 1.根据oid 查到 对应的Orders
		Orders orders = om.selectByPrimaryKey(oid);
		// 2.查找该订单下的所有 Orderitem
		OrderitemExample oie = new OrderitemExample();
		oie.createCriteria().andOidEqualTo(oid);
		List<Orderitem> oitemListByOid = oim.selectByExample(oie);
		int prodCount = 0;
		for (Orderitem oi : oitemListByOid) {
			// 3.对每一个Orderitem进行 product关联，利用pid
			Product product = pm.selectByPrimaryKey(oi.getPid());
			oi.setProduct(product);
			prodCount += oi.getPcount();
		}
		orders.setProdCount(prodCount);
		// 4.将 关联完商品的Orderitem 关联到 Orders中
		orders.setOitemList(oitemListByOid);

		// 5.根据uid 关联user到orders中
		User user = um.selectByPrimaryKey(orders.getUid());
		orders.setUser(user);

		// 6.根据addr_id 关联 address到orders中
		Address addr = am.selectByPrimaryKey(orders.getAddrId());
		orders.setAddr(addr);
		return orders;
	}

	// 条件查询 订单列表
	public List<Orders> getOrdersListByCond(OrdersExample oe) {
		return om.selectByExample(oe);
	}

	// 条件查询 订单item列表
	public List<Orderitem> getOrderItemListByCond(OrderitemExample oie) {
		return oim.selectByExample(oie);
	}

	// 获取全部订单的数量
	public int getAllOrdersNum() {
		return om.countByExample(null);
	}

	// 获取全部订单的数量（除了退款的）
	public int getAllOrdersNumExceptRefund() {
		OrdersExample oe = new OrdersExample();
		oe.createCriteria().andStatusGreaterThanOrEqualTo(MyConstants.FAILED_ORDER);
		return om.countByExample(oe);
	}

	// 查询所有 订单的成交金额，和今日的
	public Map<String, Object> queryTransMoney() {
		Map<String, Object> map = new HashMap<>();
		// 查询所有订单的 成交金额
		double allTransMoney = om.getAllTransMoney();
		// 查询今日订单的成交金额
		double todayTransMoney = om.getTodayTransMoney();
		// 查询 总订单数
		int allOrdersNum = om.getAllOrdersNum();
		map.put("allTransMoney", allTransMoney);
		map.put("todayTransMoney", todayTransMoney);
		map.put("allOrdersNum", allOrdersNum);
		return map;
	}

	// 按时间 分页查询 orders列表
	public List<Orders> queryOrdersListByPageAndTime(String flag) {
		OrdersExample oe = new OrdersExample();
		if (flag.equals("2")) {
			// 查询当月订单---时间大于当月第一天
			oe.createCriteria().andOrdertimeGreaterThan(TimeUtil.getFirstDayOfCurrentMonth());
		} else if (flag.equals("3")) {
			// 查询近一周
			oe.createCriteria().andOrdertimeGreaterThanOrEqualTo(TimeUtil.addDate(-7));
		} else if (flag.equals("4")) {
			// 查询近三天
			oe.createCriteria().andOrdertimeGreaterThanOrEqualTo(TimeUtil.addDate(-3));
		} else if (flag.equals("5")) {
			// 查询当天
			oe.createCriteria().andOrdertimeGreaterThanOrEqualTo(TimeUtil.getCurrentDay());
		} else {
			// 查询全部订单
		}

		List<Orders> list = om.selectByExample(oe);
		return list;
	}

	// 查询 待退款，已退款的所有订单列表
	public List<Orders> queryRefundOrdersList(String flag) {
		OrdersExample oe = new OrdersExample();
		Criteria c = oe.createCriteria();
		if ("1".equals(flag)) {
			// 查询 已退款
			c.andStatusEqualTo(MyConstants.MONEY_RETURNED_ORDER);
		} else if ("2".equals(flag)) {
			// 查询 未退款
			c.andStatusEqualTo(MyConstants.MONEY_RETURNING_ORDER);
		} else {
			// 查询 全部类型 // <=-2(-2，-3)
			c.andStatusLessThanOrEqualTo(MyConstants.MONEY_RETURNING_ORDER);
		}
		List<Orders> olist = om.selectByExample(oe);
		// 遍历olist下的所有orderitem，
		for (Orders o : olist) {
			OrderitemExample oie = new OrderitemExample();
			oie.createCriteria().andOidEqualTo(o.getOid());
			List<Orderitem> oitemList = oim.selectByExample(oie);
			// 对于每一个oitem，关联上对应的 product
			int prodCount = 0;
			for (Orderitem oi : oitemList) {
				Product product = pm.selectByPrimaryKey(oi.getPid());
				oi.setProduct(product);
				// 获得每个oitem的pcount,累加
				prodCount += oi.getPcount();
			}
			// 设置到order中去
			o.setOitemList(oitemList);
			o.setProdCount(prodCount);
		}
		return olist;
	}

	/**
	 * 查找每种订单状态下的订单数量
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getOrderNumByStatus() {
		List<Map<String, Object>> retList = new ArrayList<>();
		OrdersExample oe = new OrdersExample();
		// 获取 对应 的 订单数量
		int noPaidOdrCnt = getONumByExample(oe, MyConstants.NOT_PAIED_ORDER);
		int paidOdrCnt = getONumByExample(oe, MyConstants.PAIED_ORDER);
		int delieverOdrCnt = getONumByExample(oe, MyConstants.DELIVERED_ORDER);
		int recieveOdrCnt = getONumByExample(oe, MyConstants.RECEIVED_ORDER);
		int commentOdrCnt = getONumByExample(oe, MyConstants.COMMENTED_ORDER);

		retList.add(returnMap("未付款", noPaidOdrCnt));
		retList.add(returnMap("已支付", paidOdrCnt));
		retList.add(returnMap("已发货", delieverOdrCnt));
		retList.add(returnMap("已收货", recieveOdrCnt));
		retList.add(returnMap("已评价", commentOdrCnt));

		return retList;
	}

	private int getONumByExample(OrdersExample oe, int scode) {
		oe.clear();
		oe.createCriteria().andStatusEqualTo(scode);
		return om.countByExample(oe);
	}

	private int getONumByExample2(OrdersExample oe, int scode) {
		oe.clear();
		oe.createCriteria().andStatusGreaterThan(scode);
		return om.countByExample(oe);
	}

	public Map<String, Object> returnMap(String odrStatus, Integer odrCnt) {
		Map<String, Object> map = new HashMap<>();
		map.put("odrCnt", odrCnt);
		map.put("odrStatus", odrStatus);
		return map;
	}

	// 根据 省份 统计每个 省份的订单数量
	public List<ProChart> queryOrderNumByPro() {
		List<ProChart> list = new ArrayList<>();
		// 省份 数组
		String[] proArr = { "北京", "天津", "上海", "重庆", "河北", "河南", "云南", "辽宁", "黑龙江", "湖南", "安徽", "山东", "新疆", "江苏", "浙江",
				"江西", "湖北", "广西", "甘肃", "山西", "内蒙古", "陕西", "吉林", "福建", "贵州", "广东", "青海", "西藏", "四川", "宁夏", "海南", "台湾",
				"香港", "澳门" };
		// 将 省份 存到list集合,初始化
		for (String s : proArr) {
			ProChart p = new ProChart(s, 0);
			list.add(p);
		}

		// 查询 出所有订单--对应的地址（只需要地址）
		List<String> addrList = om.getAllOrderAddress();
		for (int i = 0; i < addrList.size(); i++) {
			String addr = addrList.get(i);
			if (!StringUtil.isEmpty(addr)) {
				// 分割 地址，获得省份
				String proName = addr.split("-")[0];// 湖南省
				// 遍历 省份集合 ，给对应的省份 订单量+1
				for (ProChart pv : list) {
					String pname = pv.getName();// 湖南
					if (proName.contains(pname)) {
						Integer value = pv.getValue();
						value += 1;
						pv.setValue(value);
					}
				}
			}
		}
		return list;
	}

	// 查询 home 界面的数据
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> queryHomeOrdersStatistic() {
		List<Map<String, Object>> retList = new ArrayList<>();
		// 获取每种status订单的数量
		OrdersExample oe = new OrdersExample();
		int noReturnCnt = getONumByExample(oe, MyConstants.MONEY_RETURNING_ORDER);// 待退款
		int successCnt = getONumByExample2(oe, MyConstants.NOT_PAIED_ORDER);// 已成功
		int totalONum = om.countByExample(null);// 总订单数
		List<Map<String, Object>> orderNumByStatus = getOrderNumByStatus();

		Map<String, Object> noPaidMap = orderNumByStatus.get(0);// 未付款
		Map<String, Object> paidedMap = orderNumByStatus.get(1);// 待发货
		Map<String, Object> noCommentMap = orderNumByStatus.get(3);// 待评价

		// 查询所有订单的 成交金额
		double allTransMoney = om.getAllTransMoney();

		retList.add(returnMap("待退款", noReturnCnt));
		retList.add(returnMap("已成交", successCnt));
		retList.add(returnMap("全部订单", totalONum));
		HashMap map = new HashMap<>();
		map.put("odrCnt", allTransMoney);
		map.put("odrStatus", "总成交金额");
		retList.add(map);
		retList.add(noPaidMap);
		retList.add(paidedMap);
		retList.add(noCommentMap);
		return retList;
	}

	public void addOrderFromCart(String orderId, double totalMoney, Integer uid, int addressId) {
		Orders orders = new Orders();
		orders.setOid(orderId);
		orders.setUid(uid);
		orders.setAddrId(addressId);
		orders.setTotalMoney(totalMoney);
		orders.setOrdertime(new Date());
		// 设置支付状态为未支付
		orders.setStatus(MyConstants.NOT_PAIED_ORDER);
		om.insertSelective(orders);
	}

	public void changStatusForOrderWithPaied(String orderId) {
		Orders o = new Orders();
		o.setStatus(MyConstants.PAIED_ORDER);
		o.setOid(orderId);
		om.updateByPrimaryKeySelective(o);
	}

	// 分页 查询所有 订单
	public PageInfo<Orders> queryAllOrder(Integer currPage, Integer pageSize, Integer uid) {
		PageHelper.startPage(currPage, pageSize);
		List<Orders> list = om.selectAllOrderWithAddress(uid);
		PageInfo<Orders> page = new PageInfo<>(list);

		// Map<String, Object> map = new HashMap<>();
		// map.put("allOrder", list);
		return page;
	}

	public int changStatusForOrderWithReceive(String orderId) {
		Orders o = new Orders();
		o.setStatus(MyConstants.RECEIVED_ORDER);
		o.setOid(orderId);
		return om.updateByPrimaryKeySelective(o);
		// return MyConstants.RECEIVED_ORDER;
	}

	// 退款的操作，根据订单号修改状态码和退货理由
	public int moneyReturn(String orderId, String desc) {
		Orders order = new Orders();
		order.setOid(orderId);
		order.setDesc(desc);
		order.setStatus(MyConstants.MONEY_RETURNING_ORDER);
		int flag = om.updateByPrimaryKeySelective(order);
		return flag;
	}

	// 修改为已评价
	public void changStatusForOrderWithComment(String orderId) {
		Orders o = new Orders();
		o.setStatus(MyConstants.COMMENTED_ORDER);
		o.setOid(orderId);
		om.updateByPrimaryKeySelective(o);
	}

	//// 查询 新订单数（待发货）
	public int queryNewOdrCnt() {
		return getOdrCnt(MyConstants.PAIED_ORDER);
	}

	//// 查询 新订单数（待退货）
	public int queryReturnOdrCnt() {
		return getOdrCnt(MyConstants.MONEY_RETURNING_ORDER);
	}

	private int getOdrCnt(int status) {
		OrdersExample oe = new OrdersExample();
		oe.createCriteria().andStatusEqualTo(status).andOrdertimeBetween(TimeUtil.getBeforeByHourTime(1), new Date());
		return om.countByExample(oe);
	}

}
