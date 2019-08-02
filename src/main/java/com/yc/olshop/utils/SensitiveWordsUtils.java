package com.yc.olshop.utils;

public class SensitiveWordsUtils {
	static SensitiveWord sw = new SensitiveWord("SensitiveWords.txt");
	static {
		sw.InitializationWork();
	}

	public static boolean isContainsSensitiveWords(String str) {
		String str_temp = str;

		// 开始过滤
		str = sw.filterInfo(str);

		// 判断过滤前的字符串是否 == 过滤后的
		if (str_temp.equals(str)) {
			return true; // 未包含敏感词
		} else {
			return false; // 包含敏感词
		}
	}

	// 过滤敏感词
	public static String filterSensitiveWords(String str) {
		return sw.filterInfo(str);
	}
}
