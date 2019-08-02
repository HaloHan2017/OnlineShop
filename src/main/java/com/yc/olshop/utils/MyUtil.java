package com.yc.olshop.utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.http.HttpResponse;

import cn.hutool.core.util.RandomUtil;

public class MyUtil {
	public static void sendMessage(String mobilePhone, int code) throws Exception {
		String host = "http://toushitz.market.alicloudapi.com";
		String path = "/ts/notifySms";
		String method = "POST";
		String appcode = "61f24ff0a3e94b14bb76c6dc82118331";
		String tpl_id = "TP1906285"; // 模板id
		Map<String, String> headers = new HashMap<String, String>();
		// 最后在header中的格式(中间是英文空格)为Authorization:APPCODE
		headers.put("Authorization", "APPCODE " + appcode);
		Map<String, String> querys = new HashMap<String, String>();
		querys.put("mobile", mobilePhone);
		querys.put("param", "code:" + code);
		querys.put("tpl_id", tpl_id);
		Map<String, String> bodys = new HashMap<String, String>();

		HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
	}

	// 随机生成4位数验证码
	public static int getRandomCode() {
		return RandomUtil.randomInt(0001, 9999);
	}

	public static void main(String[] args) {
		// sendMessage("18974749746", 4568);
		System.out.println(RandomUtil.randomInt(0001, 9999));
	}

	public static String getCookieValue(Cookie[] cookies, String cookiename) {
		for (Cookie c : cookies) {
			if (cookiename.equals(c.getName())) {
				return c.getValue();
			}
		}
		return null;
	}
}
