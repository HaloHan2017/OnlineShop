package com.yc.olshop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yc.olshop.bean.Orders;
import com.yc.olshop.bean.OrdersExample;

public interface OrdersMapper {
	int countByExample(OrdersExample example);

	int deleteByExample(OrdersExample example);

	int deleteByPrimaryKey(String oid);

	int insert(Orders record);

	int insertSelective(Orders record);

	List<Orders> selectByExample(OrdersExample example);

	Orders selectByPrimaryKey(String oid);

	int updateByExampleSelective(@Param("record") Orders record, @Param("example") OrdersExample example);

	int updateByExample(@Param("record") Orders record, @Param("example") OrdersExample example);

	int updateByPrimaryKeySelective(Orders record);

	int updateByPrimaryKey(Orders record);

	// 查询所有订单的 成交金额
	double getAllTransMoney();

	// 查询今日订单的成交金额
	double getTodayTransMoney();

	// 查询 总订单数
	int getAllOrdersNum();

	// 查询时间段内的 每天的订单销售情况（已付款，未付款。。。）
	List<Map<String, Object>> getOrdersTransByDays(@Param("dateStr") String dateStr, // 当天所在月的第一天
			@Param("dayNum") int dayNum, // 查询的时间区域（7天，15天。。）
			@Param("statusArr") int[] statusArr);// 查询的订单条件

	// 查询全年 12 个月，每个月订单（已付款。。。）的数量

	List<Map<String, Object>> queryOrderTransAllYearByMonth(@Param("currYearFD") String currYearFD, // 当前年的1月1号
			@Param("currYearLMD") String currYearLMD, // 当前时间12月的一号
			@Param("status") Integer status);

	//// 获取 所有的订单的收货地址
	List<String> getAllOrderAddress();

	// 查询所有订单并返回相应的订单地址
	List<Orders> selectAllOrderWithAddress(Integer uid);
}