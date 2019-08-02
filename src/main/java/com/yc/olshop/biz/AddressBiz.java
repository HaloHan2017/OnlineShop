package com.yc.olshop.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.olshop.bean.Address;
import com.yc.olshop.bean.AddressExample;
import com.yc.olshop.dao.AddressMapper;

@Service
public class AddressBiz {
	@Autowired
	private AddressMapper am;

	// 查询所有 收货地址
	public List<Address> getAllAddressByUid(Integer uid) {
		AddressExample ae = new AddressExample();
		ae.createCriteria().andUidEqualTo(uid);
		List<Address> alist = am.selectByExample(ae);
		return alist;
	}

	// 添加 收货地址
	public int addAddress(Address addr) {
		if (addr.getAddrId() == null) {
			// 添加
			return am.insertSelective(addr);
		} else {
			// 修改
			return am.updateByPrimaryKeySelective(addr);
		}
	}

	// 删除 address
	public int delAddress(Integer addrId) {
		return am.deleteByPrimaryKey(addrId);
	}

}
