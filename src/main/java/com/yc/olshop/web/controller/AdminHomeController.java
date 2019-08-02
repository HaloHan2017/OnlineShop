package com.yc.olshop.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.olshop.biz.LeaveMsgBiz;
import com.yc.olshop.biz.OrderBiz;
import com.yc.olshop.utils.Result;

@RestController
@RequestMapping("home")
public class AdminHomeController {
	@Autowired
	private OrderBiz obiz;
	@Autowired
	private LeaveMsgBiz lmbiz;

	/**
	 * 查询 待退款订单：待发货订单：待评价订单：成交订单数：交易失败： 的数量 商城总订单数，商城总用户，今日商品销量，今日交易金额
	 * 
	 * @return
	 */
	@GetMapping("homeOrdersStatistic")
	public Result homeOrdersStatistic() {
		Result result = new Result(1, "ok");
		List<Map<String, Object>> queryRes = obiz.queryHomeOrdersStatistic();
		result.setData(queryRes);
		return result;
	}

	@GetMapping("getNewMsgCnt")
	public Map<String, Integer> getNewMsgCnt() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 查询 新订单数（待发货，待退货）
		int newOdrCnt = obiz.queryNewOdrCnt();
		int returnOdrCnt = obiz.queryReturnOdrCnt();

		// 查询 用户新留言数（未回复）
		int newLeaveMsgCnt = lmbiz.queryNewNotReplayLeaveMsgCnt();
		map.put("newOdrCnt", newOdrCnt);
		map.put("returnOdrCnt", returnOdrCnt);
		map.put("newLeaveMsgCnt", newLeaveMsgCnt);

		return map;
	}
}
