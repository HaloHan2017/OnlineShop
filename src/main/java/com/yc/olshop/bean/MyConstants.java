package com.yc.olshop.bean;

public class MyConstants {
	/**
	 * 未支付 0 已失效 -1 退款中-2 已退款 -3 已支付（待发货）1 已发货（待收货）2 已收货（待评价）3 已评价4
	 */
	public static final int NOT_PAIED_ORDER = 0;// 未支付（待支付）
	public static final int PAIED_ORDER = 1; // 已支付（待发货）
	public static final int DELIVERED_ORDER = 2; // 已发货（待收货）
	public static final int RECEIVED_ORDER = 3;// 已收货（待评价）
	public static final int COMMENTED_ORDER = 4;// 已评价
	public static final int FAILED_ORDER = -1;// 已失效（失败订单）
	public static final int MONEY_RETURNING_ORDER = -2;// 退款中（失败订单）
	public static final int MONEY_RETURNED_ORDER = -3;// 已退款（失败订单）

	/**
	 *  0登录  1下线   2修改密码
	 */
	public static final int LOGING_IN = 0;
	public static final int LOGING_OUT = 1;
	public static final int MODIFY_PWD = 2;
	public static final Integer NOT_VIEWED_MSG = 0;
	public static final Integer VIEWED_MSG = 1;
	public static final Integer REPLYED_MSG = 2;

	// 一天 的毫秒数
	public static long THE_DAY_OF_MILLIS = 86400000;
}
