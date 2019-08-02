package com.yc.olshop.bean;

public class Result {

	public static final int REG_SUCCESS = 1;// 注册成功 1

	public static final int VERIFY_FAILED = 0;// 验证失败

	public static final int SUCCESS = 1;
	public static final int FAILURE = 0;

	private int code;
	private String msg;
	private Object data;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Result(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public Result() {
		super();
	}

	public Result(int code, String msg, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

}
