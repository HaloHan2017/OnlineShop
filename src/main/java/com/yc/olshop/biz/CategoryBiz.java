package com.yc.olshop.biz;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.olshop.bean.Category;
import com.yc.olshop.bean.ProductExample;
import com.yc.olshop.bean.CategoryExample;
import com.yc.olshop.dao.CategoryMapper;
import com.yc.olshop.dao.ProductMapper;

@Service
public class CategoryBiz {
	
	
	@Autowired
	private CategoryMapper cm;

	@Autowired
	private ProductMapper pm;
	@Autowired
	private OrderBiz obiz;
	
	//类别展示
	public List<Category> findAllCategory() {
		
		return cm.selectByExample(null);
	}

	// 查找所有类别--以及 类别下的商品数量
	public List<Category> queryAll() {

		List<Category> clist = cm.selectByExample(null);
		for (Category c : clist) {
			// 根据 cid查找 统计对应的商品 的数量
			ProductExample pe = new ProductExample();
			pe.createCriteria().andCidEqualTo(c.getCid());
			int pcount = pm.countByExample(pe);

			// 关联到 category表
			c.setProdNum(pcount);
		}
		return clist;
	}

	// 删除类别
	public int delete(int cid) {
		return cm.deleteByPrimaryKey(cid);
	}

	// 添加类别
	public int add(Category c, String flag) {
		c.setCreateTime(new Date());
		if (flag.equals("edit")) {
			// 修改
			return cm.updateByPrimaryKeySelective(c);
		} else {
			// 添加
			return cm.insertSelective(c);
		}
	}

	/**
	 * 查找所有商品类别下的订单数量
	 * 
	 * @return
	 */
	/*
	 * public List<Category> getOrderNumByCategory() { // 1 查询出 所有 类别列表
	 * List<Category> cList = cm.selectByExample(null); // 2 对每种类别的订单数进行统计 for
	 * (Category c : cList) { int ordersNum = 0; // 3 根据cid 查询 出该类别下的所有商品列表
	 * ProductExample pe = new ProductExample();
	 * pe.createCriteria().andCidEqualTo(c.getCid()); List<Product> pListByCid =
	 * pm.selectByExample(pe); // 4 查出 所有订单 ，以及订单下的itemList List<Orders>
	 * ordersListByCond = obiz.getOrdersListByCond(null);
	 * 
	 * for (Product p : pListByCid) { // 匹配，如果订单里有一个oitem包含pic，则认为该订单属于
	 * 此商品的类别--》ordersNum++ for (Orders orders : ordersListByCond) {
	 * OrderitemExample oie = new OrderitemExample();
	 * oie.createCriteria().andOidEqualTo(orders.getOid()); // oitemlist
	 * List<Orderitem> orderItemListByCond = obiz.getOrderItemListByCond(oie);
	 * for (Orderitem orderitem : orderItemListByCond) { if (orderitem.getPid()
	 * == p.getPid()) { ordersNum++; break;// 此循环目的达到，可以退出 } } } }
	 * c.setOrdersNum(ordersNum); } return cList; }
	 */

}
