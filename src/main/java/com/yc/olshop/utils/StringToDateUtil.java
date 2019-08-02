package com.yc.olshop.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 从前台传入后台的时间（string->Date）转换
 * @author 蒋辉
 *
 */
public class StringToDateUtil {
	
	public static Date change(String time) throws ParseException {
		DateFormat dfm = new SimpleDateFormat("yyyy-MM-dd");
		Date date = dfm.parse(time);
		return date;
	}
}
