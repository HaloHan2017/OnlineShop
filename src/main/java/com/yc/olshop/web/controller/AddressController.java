package com.yc.olshop.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.yc.olshop.bean.Address;
import com.yc.olshop.bean.Result;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.AddressBiz;

@RestController
@RequestMapping("address")
public class AddressController {
	@Autowired
	private AddressBiz abiz;

	/**
	 * 查询 对应 用户的所有收货地址
	 */
	@GetMapping("getAllAddressByUid")
	public Result getAllAddressByUid(@SessionAttribute("user") User user) {
		Result result = new Result(1, "ok");
		List<Address> addrList = abiz.getAllAddressByUid(user.getUid());
		if (addrList == null || addrList.size() <= 0) {
			result = new Result(0, "您还未添加收货地址");
		} else {
			result.setData(addrList);
		}
		return result;
	}

	/**
	 * 添加 收货地址
	 * 
	 * @param user
	 * @param addr
	 * @param province
	 * @param city
	 * @param county
	 * @param detail
	 * @return
	 */
	@PostMapping("add")
	public Result addAddress(@SessionAttribute("user") User user, Address addr, String province, String city,
			String county, String detail) {
		Result result = new Result(1, "ok");
		String address = province + "-" + city + "-" + county + "-" + detail;
		addr.setAddress(address);
		addr.setUid(user.getUid());
		// 添加
		int ret = abiz.addAddress(addr);
		if (ret <= 0) {
			result = new Result(-1, "服务器忙");
		}
		return result;
	}

	@GetMapping("del")
	public Result delAddress(Integer addrId) {
		Result result = new Result(1, "ok");
		int ret = abiz.delAddress(addrId);
		if (ret <= 0) {
			result = new Result(-1, "服务器忙");
		}
		return result;
	}
}
