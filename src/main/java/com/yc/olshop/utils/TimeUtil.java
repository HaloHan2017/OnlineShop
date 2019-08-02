package com.yc.olshop.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.junit.Test;

public class TimeUtil {
	public static void main(String[] args) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String currdate = format.format(date);
		System.out.println("当前日期是:" + currdate);
		Date addDate = addDate(-7);
		System.out.println("7天以后的日期是:" + format.format(addDate));
	}

	public static String getCurrYearFD() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(createStartDate());
	}

	public static String getCurrYearLMD() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = createEndDate();
		date.setMonth(11);
		date.setDate(1);
		return sdf.format(date);
	}

	public static Date createStartDate() {
		Date date = new Date();
		GregorianCalendar gc = new GregorianCalendar();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		gc.set(Calendar.YEAR, calendar.get(Calendar.YEAR));// 设置年
		gc.set(Calendar.MONTH, 0);// 这里0是1月..以此向后推
		gc.set(Calendar.DAY_OF_MONTH, 1);// 设置天
		gc.set(Calendar.HOUR_OF_DAY, 0);// 设置小时
		gc.set(Calendar.MINUTE, 0);// 设置分
		gc.set(Calendar.SECOND, 0);// 设置秒
		gc.set(Calendar.MILLISECOND, 0);// 设置毫秒
		return gc.getTime();
	}

	// 获取 最后一天
	public static Date createEndDate() {
		Date date = new Date();
		GregorianCalendar gc = new GregorianCalendar();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		gc.set(Calendar.YEAR, calendar.get(Calendar.YEAR));// 设置年
		gc.set(Calendar.MONTH, 0);// 这里0是1月..以此向后推
		gc.set(Calendar.DAY_OF_MONTH, 31);// 设置天
		gc.set(Calendar.HOUR_OF_DAY, 23);// 设置小时
		gc.set(Calendar.MINUTE, 59);// 设置分
		gc.set(Calendar.SECOND, 59);// 设置秒
		gc.set(Calendar.MILLISECOND, 0);// 设置毫秒
		return gc.getTime();
	}

	public static Date getCurrentMonthFirstDay() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		Date time = calendar.getTime();
		time.setHours(0);
		time.setMinutes(0);
		time.setSeconds(0);
		return time;
	}

	/**
	 * 获得系统当前月的第一天
	 * 
	 * @return
	 */
	public static Date getCurrentDay() {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		Date zero = calendar.getTime();
		return zero;
	}

	public static Date addDate(int num) {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, num);
		Date date = calendar.getTime();
		return date;
	}

	public static Date getFirstDayOfCurrentMonth() {
		Calendar cale = Calendar.getInstance();
		cale.add(Calendar.MONTH, 0);
		cale.set(Calendar.DAY_OF_MONTH, 1);
		Date time = cale.getTime();
		time.setHours(0);
		time.setMinutes(0);
		time.setSeconds(0);
		return time;
	}

	public static String getFirstDayStrOfCurrentMonth() {
		Calendar cale = null;
		// 获取当月第一天和最后一天
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String firstday;
		// 获取前月的第一天
		cale = Calendar.getInstance();
		cale.add(Calendar.MONTH, 0);
		cale.set(Calendar.DAY_OF_MONTH, 1);
		firstday = format.format(cale.getTime());
		return firstday;
	}

	// 给 yyyy-MM-dd 填上时分秒
	@SuppressWarnings("deprecation")
	public static Date createDateWithMils(Date d) {
		d.setHours(23);
		d.setMinutes(59);
		d.setSeconds(59);
		return d;
	}

	public static void get() {
		// 获取当前年份、月份、日期
		Calendar cale = null;
		cale = Calendar.getInstance();
		int year = cale.get(Calendar.YEAR);
		int month = cale.get(Calendar.MONTH) + 1;
		int day = cale.get(Calendar.DATE);
		int hour = cale.get(Calendar.HOUR_OF_DAY);
		int minute = cale.get(Calendar.MINUTE);
		int second = cale.get(Calendar.SECOND);
		int dow = cale.get(Calendar.DAY_OF_WEEK);
		int dom = cale.get(Calendar.DAY_OF_MONTH);
		int doy = cale.get(Calendar.DAY_OF_YEAR);

		// 获取当月第一天和最后一天
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String firstday, lastday;
		// 获取前月的第一天
		cale = Calendar.getInstance();
		cale.add(Calendar.MONTH, 0);
		cale.set(Calendar.DAY_OF_MONTH, 1);
		firstday = format.format(cale.getTime());
		// 获取前月的最后一天
		cale = Calendar.getInstance();
		cale.add(Calendar.MONTH, 1);
		cale.set(Calendar.DAY_OF_MONTH, 0);
		lastday = format.format(cale.getTime());
		System.out.println("本月第一天和最后一天分别是 ： " + firstday + " and " + lastday);

		// 获取当前日期字符串
		Date d = new Date();
		System.out.println("当前日期字符串1：" + format.format(d));
		System.out.println("当前日期字符串2：" + year + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second);
	}

	// 获取 当前时间的前 n个小时的时间
	public static Date getBeforeByHourTime(int ihour) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - ihour);
		return calendar.getTime();
	}

	@Test
	public void testName() throws Exception {
		System.out.println(getBeforeByHourTime(1));
	}
}
