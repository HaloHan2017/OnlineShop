package com.yc.olshop.test;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;

import com.yc.olshop.utils.HttpUtils;

public class TestMessage {

	public static void main(String[] args) {
		String host = "http://toushitz.market.alicloudapi.com";
		String path = "/ts/notifySms";
		String method = "POST";
		String appcode = "你自己的AppCode";
		Map<String, String> headers = new HashMap<String, String>();
		// 最后在header中的格式(中间是英文空格)为Authorization:APPCODE
		// 83359fd73fe94948385f570e3c139105
		headers.put("Authorization", "APPCODE " + appcode);
		Map<String, String> querys = new HashMap<String, String>();
		querys.put("mobile", "159XXXX9999");
		querys.put("param", "more:188");
		querys.put("tpl_id", "TP18040317");
		Map<String, String> bodys = new HashMap<String, String>();

		try {
			HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
			System.out.println(response.toString());
			// 获取response的body
			// System.out.println(EntityUtils.toString(response.getEntity()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
