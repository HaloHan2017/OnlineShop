package com.yc.olshop.utils;

public class PageHelperUtil {

	private Integer code;
	private Object data;
	private Integer currentpage;
	private Integer totalpage;

	public PageHelperUtil() {
		super();
	}

	public PageHelperUtil(Integer code, Object data, Integer currentpage, Integer totalpage) {
		super();
		this.code = code;
		this.data = data;
		this.currentpage = currentpage;
		this.totalpage = totalpage;
	}

	/**
	 * @return the currentpage
	 */
	public Integer getCurrentpage() {
		return currentpage;
	}

	/**
	 * @param currentpage
	 *            the currentpage to set
	 */
	public void setCurrentpage(Integer currentpage) {
		this.currentpage = currentpage;
	}

	/**
	 * @return the totalpage
	 */
	public Integer getTotalpage() {
		return totalpage;
	}

	/**
	 * @param totalpage
	 *            the totalpage to set
	 */
	public void setTotalpage(Integer totalpage) {
		this.totalpage = totalpage;
	}

	/**
	 * @return the code
	 */
	public Integer getCode() {
		return code;
	}

	/**
	 * @param code
	 *            the code to set
	 */
	public void setCode(Integer code) {
		this.code = code;
	}

	/**
	 * @return the data
	 */
	public Object getData() {
		return data;
	}

	/**
	 * @param data
	 *            the data to set
	 */
	public void setData(Object data) {
		this.data = data;
	}

}
