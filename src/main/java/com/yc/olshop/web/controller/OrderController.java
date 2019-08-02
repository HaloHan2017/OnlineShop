package com.yc.olshop.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.github.pagehelper.PageInfo;
import com.yc.olshop.bean.Category;
import com.yc.olshop.bean.Orderitem;
import com.yc.olshop.bean.Orders;
import com.yc.olshop.bean.Result;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.CategoryBiz;
import com.yc.olshop.biz.OrderBiz;
import com.yc.olshop.biz.OrderItemBiz;
import com.yc.olshop.biz.ProductBiz;
import com.yc.olshop.pojo.ProChart;
import com.yc.olshop.utils.PageHelperUtil;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	private OrderBiz obiz;
	@Autowired
	private ProductBiz pbiz;
	@Autowired
	private CategoryBiz cbiz;
	@Autowired
	private OrderItemBiz oibiz;

	/**
	 * 查询 交易详情（当月的）
	 * 
	 * @return
	 */
	@PostMapping("queryTransc")
	@ResponseBody
	public Map<String, Object> queryTransc() {
		return obiz.queryTranscCondition();
	}

	/**
	 * 分页查询order，动态条件----订单管理，顶上的图表和左侧的订单状态表
	 * 
	 * @param model
	 * @return
	 */
	// @ResponseBody Map<String, Object>
	@RequestMapping("querySaleByCategory")
	public String querySaleByCategory(Model model, Orders ord) {
		// 查询每种商品类别 的销售所占比例,以及总销量,订单数量
		// 以及 所有商品类别名（以及下面所有商品数量）
		List<Category> percentList = pbiz.querySaleByCategory();
		int totalSaleCount = 0;
		// 获取 商品的总销量
		if (percentList != null && percentList.size() > 0) {
			for (Category c : percentList) {
				totalSaleCount += c.getProdSales();
			}
		}
		model.addAttribute("percentList", percentList);
		model.addAttribute("totalSaleCount", totalSaleCount);

		// 查找每种订单状态下的订单数量
		// List<Category> categoryList = cbiz.getOrderNumByCategory();
		List<Map<String, Object>> odrNumMapList = obiz.getOrderNumByStatus();
		int allOrdersNum = obiz.getAllOrdersNumExceptRefund();

		model.addAttribute("odrNumMapList", odrNumMapList);
		model.addAttribute("allOrdersNum", allOrdersNum);

		// 查询所有订单，按时间排序
		// List<Orders> olist = obiz.queryOrdersByConditionAndPage(ord);
		// model.addAttribute("olist", olist);
		// model.addAttribute("ord", ord);

		return "admin/order/Orderform";// 跳转到jsp
		// return returnMap(olist);
	}

	/**
	 * 根据订单状态码scode 查询对应状态的订单列表--所属功能-订单管理-订单管理
	 * 
	 * @param scode
	 *            订单状态码
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOrderList")
	public Map<String, Object> queryOrderList(@RequestParam(required = false) Integer scode,
			@RequestParam(required = false) String oid) {
		// 查询所有订单，按时间排序
		List<Orders> olist = obiz.queryOrdersByConditionAndPage(scode, oid);
		return returnMap(olist);
	}

	/**
	 * 根据oid删除订单
	 * 
	 * @return
	 */
	@PostMapping("del")
	@ResponseBody
	public Map<String, Object> delByOid(String oid) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ret = obiz.deleteByOid(oid);
		if (ret <= 0) {
			map.put("code", -1);
			map.put("msg", "服务器忙");
		} else {
			map.put("code", 1);
		}

		return map;
	}

	/**
	 * 订单的发货 和 退款 操作----
	 * 
	 * @param oid
	 * @param flag
	 * @return
	 */
	@PostMapping("deliverAndReturnMoney")
	@ResponseBody
	public Map<String, Object> deliverAndReturnMoney(String oid, int flag) {
		Map<String, Object> map = new HashMap<String, Object>();
		int ret = obiz.deliverAndReturnMoney(oid, flag);
		// int ret = -2;
		if (ret <= 0) {
			if (ret == -1) {
				map.put("code", ret);
				map.put("msg", "操作失败");
			} else if (ret == -2) {
				map.put("code", ret);
				map.put("msg", "发货失败，请先确认订单状态！");
			} else {// 退款失败
				map.put("code", ret);
				map.put("msg", "退款失败，请先确订单状态！");
			}
		} else {
			map.put("code", 1);
		}
		return map;
	}

	/**
	 * 查询订单详情（不包括退款和，待退款）--所属功能-订单管理-订单管理
	 * 
	 * @param model
	 * @param oid
	 * @return
	 */
	@RequestMapping("orderDetails")
	public String orderDetails(Model model, String oid) {
		// 根据 oid 查询 order的信息 （买家信息，购买商品的详细信息）
		Orders o = obiz.queryDetailsByOid(oid);

		model.addAttribute("order", o);
		return "admin/order/Order_detailed";// 跳转到jsp
	}

	/**
	 * 根据oid 查询退款订单的详情，----所属功能-订单管理-退款管理
	 * 
	 * @param model
	 * @param oid
	 * @return
	 */
	@RequestMapping("orderDetailsWithRefund")
	public String orderDetailsWithRefund(Model model, String oid) {
		// 根据 oid 查询 order的信息 （买家信息，购买商品的详细信息）
		Orders o = obiz.queryDetailsByOid(oid);

		model.addAttribute("order", o);
		return "admin/order/Refund_detailed";// 跳转到jsp
	}

	/**
	 * 查询所有 订单的成交金额，和今日的----所属功能-订单管理-交易金额
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryTransMoney")
	public Map<String, Object> queryTransMoney(Map<String, Object> map) {
		return obiz.queryTransMoney();
	}

	/**
	 * 按时间 分页查询 订单----所属功能-订单管理-交易金额
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOrdersListByPageAndTime")
	public Map<String, Object> queryOrdersListByPageAndTime(@RequestParam(defaultValue = "1") String flag,
			Model model) {
		List<Orders> ordersList = obiz.queryOrdersListByPageAndTime(flag);
		return returnMap(ordersList);
	}

	/**
	 * 查询 待退款，已退款的所有订单列表----所属功能-订单管理-退款管理
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryRefundOrdersList")
	public Map<String, Object> queryRefundOrdersList(@RequestParam(defaultValue = "all") String flag) {
		List<Orders> ordersList = obiz.queryRefundOrdersList(flag);
		return returnMap(ordersList);
	}

	private Map<String, Object> returnMap(List<Orders> ordersList) {
		Map<String, Object> map = new HashMap<>();
		map.put("data", ordersList);
		return map;
	}

	/**
	 * 当月 销售情况（用图表展示），成功订单，失败订单----所属功能-订单管理-交易情况
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("querySalesCondition")
	public Map<String, Object> querySalesCondition() {
		Map<String, Object> map = obiz.querySalesCondition();
		return map;
	}

	/**
	 * 一年的 订单情况（用图表展示），待付款，已付款。。。
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOrderTransAllYearByMonth")
	public Map<String, Object> queryOrderTransAllYearByMonth() {
		Map<String, Object> map = obiz.queryOrderTransAllYearByMonth();
		return map;
	}

	/**
	 * 查询所有的省份的 订单数量（用图表展示）
	 * 
	 * @return
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOrderNumByPro")
	public Result queryOrderNumByPro() {
		Result result = new Result(1, "ok");
		List<ProChart> proChartList = obiz.queryOrderNumByPro();
		result.setData(proChartList);
		return result;
	}

	/**
	 * 查询所有订单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryAllOrder")
	public PageHelperUtil queryAllOrder(@RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "4") Integer pageSize, @SessionAttribute("user") User user) {
		PageInfo<Orders> page = obiz.queryAllOrder(currPage, pageSize, user.getUid());
		if (page == null) {
			return new PageHelperUtil(0, new ArrayList<>(), 1, 0);
		}
		int code = 1;
		List<Orders> list = page.getList();
		if (list == null || list.size() <= 0) {
			code = 0;
		}
		return new PageHelperUtil(code, list, page.getPageNum(), page.getPages());
	}

	/**
	 * 退货操作
	 * 
	 * @return
	 */
	@ResponseBody
	@PostMapping("moneyReturn")
	public Result moneyReturn(String orderId, @RequestParam(defaultValue = "") String desc) {
		int flag = obiz.moneyReturn(orderId, desc);
		if (flag == 1) {
			return new Result(1, "退货申请成功！");
		} else {
			return new Result(0, "退货申请失败！请重新尝试");
		}
	}

	@ResponseBody
	@GetMapping("showItemForOrderByOid")
	public List<Orderitem> showItemForOrderByOid(String oid) {
		List<Orderitem> list = oibiz.queryItemForOrderByOid(oid);
		return list;
	}
}
