package com.yc.olshop.utils;

public class Result {
	
	public static final int SUCCESS = 1;



	public static final int FAILTER = 0;
	
	
	
	private int code;
	private String msg;
	private Object data;
	
	
	
	
	public Result(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public Result(int code, String msg, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	
	/**
	 * @return the code
	 */
	public int getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(int code) {
		this.code = code;
	}
	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}
	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
	/**
	 * @return the data
	 */
	public Object getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(Object data) {
		this.data = data;
	}
	
	
}
