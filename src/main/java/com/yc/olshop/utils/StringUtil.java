package com.yc.olshop.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Calendar;
import java.util.Random;

public class StringUtil {
	/** 获取指定长度的16进制字符串. */
	public static String randomColorStr(int len) {
		try {
			StringBuffer result = new StringBuffer();
			for (int i = 0; i < len; i++) {
				// 随机生成0-15的数值并转换成16进制
				result.append(Integer.toHexString(new Random().nextInt(16)));
			}
			return result.toString().toUpperCase();
		} catch (Exception e) {
			System.out.println("获取16进制字符串异常，返回默认...");
			return "00CCCC";
		}
	}

	// 判断是否为空字符串
	public static boolean isEmpty(String str) {
		if (str == null || "".equals(str.trim())) {
			return true;
		}
		return false;
	}

	// 生成订单号16位
	public static String getOrderId() {
		// 获取当前时间年月日
		String str = "";
		Calendar c = Calendar.getInstance();
		String ls = c.getTime().toLocaleString();

		String[] split = ls.split(" ");
		String t1 = split[0];
		String[] t1sp = t1.split("-");
		for (String s : t1sp) {
			if (s.length() == 1)
				s = "0" + s;
			str += s;
		}

		String t2 = split[1];
		String[] t2sp = t2.split(":");
		for (String s : t2sp) {
			if (s.length() == 1)
				s = "0" + s;
			str += s;
		}

		return ("D" + str + Math.random() * 10000).split("\\.")[0];
	}

	public static String getMD5Str(String str) {
		try {
			// 生成一个MD5加密计算摘要
			MessageDigest md = MessageDigest.getInstance("MD5");
			// 计算md5函数
			md.update(str.getBytes());
			// digest()最后确定返回md5 hash值，返回值为8位字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
			// BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
			// 一个byte是八位二进制，也就是2位十六进制字符（2的8次方等于16的2次方）
			return new BigInteger(1, md.digest()).toString(16);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		System.out.println(getMD5Str("asdzxc"));
	}
}
