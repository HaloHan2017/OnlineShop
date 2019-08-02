package com.yc.olshop.pojo;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

	// ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092900626204";

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCU2K/LUUbUPcvVtNDd1+Zse0HkjN5s6MsnK104JLdrukFt1vxWTRqfBPtnVhvFgjlbsjgc/yS7Zj5NmcKWct1R/y9KtssEjyvdvP/QMOrecAKlvnlDQFOaz6LfaSN7BK6Q5xHYyhIqyP+o7905J/wb8sXbLhUF4CEj1/ngNbvl32/mpk/cF3IBe6k5gWDtvU5y6XcXqXKbYbi3orcyixFkMHZ7fY4farqEZDrj0E/xGc/NImKTUzQfIV8BEUPwViFPfo8S8S7xHuJ2DQQiQElcQo7PEADPeSjp958vzS9JZ2twemhqbY7hFv+3PGMmYulqMO0bOi9aDV/ywxeB2n0pAgMBAAECggEAA3PDIAQSkHmecKZw8bRAM+Pn81URE5WSoKXw04yGdIktW07RK28+XtHOwubMXhhXHDlV89Y3E+GbMFGQocyoNW6luiXjL4fijJIFnN6FlAMlDJMOXPDw/3YxYN0fZYsGQXYag9yr7zIaO+DUUK8Mudk3nY3EDw7TtfEcaobUhNBQygpwQI/lO5yvQiOYkd0GVjAWj3ZN/JRvx7DMDQAiXD4C1szAXQCWQ/A4Rhm6iOAMQCZ8i4svoljrvQlItIEbJf8ZNBB9rRRzSWUGMJKxozqdl/gKCwPz+TH1jBPFrG82g9RUkEgD59XgiwemX2GjB0wz2pY7UrBJdlzvllO3AQKBgQDDojAxyNCFheGB/3G7qhKGy7PNvxysBtx2TevvT9Yl/5uL9R6pso2dyiDG1K272oyf4YasRdoGC1ZHLR+iy/fCqjMqnKX4oao12LepaJvZIWC4q1W57cYTblqpnXIdqZ9ZvAs6wIEuCM3oSRfS0Nb5nb5v9oOQ1nAmRG55kk9IbQKBgQDCxpzOE0CO7HVKdN1WMo5zk0Ouz6V1QJNYn4LzX06gjPCxIAomJqP47xDkLHCebbIM2vqVn7VGvtDOEROxrtew/H66KTVcciETYKZEOX5W+tbrQx2krtZJKcWXliz2pFkWlPcyRstWF0/DvZrlYaveIB0S57sDaWf6lQAT9GCKLQKBgHKPxb1BpaqrTfV8izOkUpkRLMfthHLQycWVt/Y6QGOcHZCGCGDDqN6gATWuUdbSEsuFnAHCHfywIuQnboE9BGfAl5n6hc7ljPFfaZ4RHkK2oxdBbkAlF3tFgl4VT0BDlodL8R+En6E/kqTWONdBaMJgN6cFKuJkUOR36mHS5g65AoGAPF0/haJz1Je19iBn5GoAuhL+2/OgrMkZoVK2S+TSwnFLuylZ298H3IOC8aRQNtl6X/+Rv8NidA15OxQRzXSJhmGKiPlyfzcjxxSiEuzamexdpUYEruA8qyoWAdfaEYp3zcbXIa7NH95Tqy9dDRALKuk6+Xv1+qW1QvTgtE59iPUCgYASA9VXE6cpzL0A2TQAONmnKL0A7eE7lC1MJo6TMvTqlZ1Cnbdbkqj3piqA3M1Ci7Z51N72dOcMZAGRcFyKTu2qfjjCWbfOQSKiKSW3oduEU36n+D7c9kC1TzQP9qIFtgpSLa2kj8afU9eoPJzl6QEXay78pRdNmCkrxr84KjWsog==";

	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
	// 对应APPID下的支付宝公钥。
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy1BcdZWv2S0er6IPEAnGGblxjaGrxgr35d1UmJvcu0HlWMMbKafxQ+5JWsdAlHOZJ8LBtdMmESkXYdwYEYYxKB6Ie8AGeuEbgpxMvoFx9wuNG9yLRkFsG06kX1L9Z2PxDOjvn1uTxSi1ijlwfPwTe/YyJnIYGKgygnY8uL1rQ4OHuhZ3jc07aXVnF4B2EJaBP3HYu5KfZdVSOfDss5KiTRSACJEeapTqOS0JDkH58GRhIae/KvgHhwrdm4VqD6+jdgjB1uDgtViv/l746c4kgSLom+Gr3whe/yLsqdcrHXk4q7E/VIBwwwywbncnQEABpwMLwtMWACtDzFGA15coTQIDAQAB";

	// 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost/payment/payForAliSuccess";

	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	// 支付宝网关
	public static String log_path = "C:\\";

	// ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 * 
	 * @param sWord
	 *            要写入日志里的文本内容
	 */
	public static void logResult(String sWord) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
			writer.write(sWord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
