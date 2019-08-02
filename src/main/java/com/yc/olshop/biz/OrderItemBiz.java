package com.yc.olshop.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.olshop.bean.Orderitem;
import com.yc.olshop.bean.OrderitemExample;
import com.yc.olshop.bean.OrderitemExample.Criteria;
import com.yc.olshop.bean.Product;
import com.yc.olshop.dao.OrderitemMapper;
import com.yc.olshop.dao.ProductMapper;

@Service
public class OrderItemBiz {
	@Autowired
	ProductMapper pm;
	@Autowired
	OrderitemMapper oim;
	@Autowired
	ProductBiz pb;

	// 增加购物明细
	public void addOrderItemFromCart(int[] pid, int[] pnum, double totalMoney, String orderId, double[] realPrice) {
		// 循环插入
		for (int i = 0; i < pid.length; i++) {
			Orderitem oi = new Orderitem();
			oi.setPid(pid[i]);
			oi.setPcount(pnum[i]);
			oi.setSumMoney(totalMoney);
			oi.setOid(orderId);
			oi.setPrealPrice(realPrice[i]);
			oim.insertSelective(oi);
			// 对每个product，更改它的psalecount
			Product product = pm.selectByPrimaryKey(pid[i]);
			product.setPsalenum(product.getPsalenum() + pnum[i]);
		}
	}

	public List<Orderitem> queryItemForOrderByOid(String oid) {
		List<Orderitem> list = oim.queryItemForOrderByOid(oid);
		return list;
	}

	// 修改商品销售数量
	public void modifyProductSaleNum(String orderId) {
		OrderitemExample oie = new OrderitemExample();
		Criteria c = oie.createCriteria();
		c.andOidEqualTo(orderId);
		List<Orderitem> list = oim.selectByExample(oie);
		for (Orderitem o : list) {
			pb.addPSaleNumWithPid(o.getPid(), o.getPcount());
		}
	}

}
