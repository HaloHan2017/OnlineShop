package com.yc.olshop.biz;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yc.olshop.bean.Category;
import com.yc.olshop.bean.MyConstants;
import com.yc.olshop.bean.Product;
import com.yc.olshop.bean.ProductExample;
import com.yc.olshop.bean.ProductExample.Criteria;
import com.yc.olshop.dao.CategoryMapper;
import com.yc.olshop.dao.CommentMapper;
import com.yc.olshop.dao.OrderitemMapper;
import com.yc.olshop.dao.ProductMapper;
import com.yc.olshop.pojo.ViewObj;

@Service
public class ProductBiz {

	@Autowired
	private ProductMapper pm;
	@Autowired
	private CategoryMapper cm;
	@Autowired
	private RedisTemplate rt;
	@Autowired
	private CommentMapper comm;
	@Autowired
	private OrderitemMapper om;

	// 展示所有商品
	// 展示所有商品
	public List<Product> findAllProduct(Integer cid, Double startprice, Double endprice, String text, Integer pflag) {
		ProductExample pe = new ProductExample();
		Criteria c = pe.createCriteria();
		if (cid != null) {
			c.andCidEqualTo(cid);
		}
		if (startprice != null && endprice != null) {
			c.andDiscPriceBetween(startprice, endprice);
		}
		if (text != null) {
			c.andPnameLike("%" + text + "%");
		}
		if (pflag != null) {
			c.andPflagEqualTo(pflag);
		}
		List<Product> list = pm.selectByExampleWithBLOBs(pe);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setCategory(cm.selectByPrimaryKey(list.get(i).getCid()));
		}
		return list;
	}

	/*
	 * // 前台展示商品数据 public Page<Product> findAllProduct(Integer cid, int
	 * currentpage, int size, double startprice, double endprice, Integer
	 * orderby, String text, Integer pflag) { ProductExample pe = new
	 * ProductExample(); Criteria c = pe.createCriteria(); if (cid != null) {
	 * c.andCidEqualTo(cid); c.andDiscPriceBetween(startprice, endprice); } else
	 * { c.andDiscPriceBetween(startprice, endprice); } if (text != null) {
	 * c.andPnameLike("%" + text + "%"); } if (orderby != null) { if (orderby ==
	 * 3) { pe.setOrderByClause("disc_price asc"); } if (orderby == 4) {
	 * pe.setOrderByClause("disc_price desc"); } if (orderby == 2) {
	 * pe.setOrderByClause("pupdate desc"); } } if (pflag != null) {
	 * c.andPflagEqualTo(pflag); } Page<Product> list =
	 * PageHelper.startPage(currentpage, size); pm.selectByExampleWithBLOBs(pe);
	 * for (int i = 0; i < list.size(); i++) {
	 * list.get(i).setCategory(cm.selectByPrimaryKey(list.get(i).getCid()));
	 * Double avgstar = comm.selectAvgStar(list.get(i).getPid()); if (avgstar !=
	 * null) { list.get(i).setAvgstar(avgstar.intValue()); } else {
	 * list.get(i).setAvgstar(0); } } return list; }
	 */
	// 前台展示商品数据
	public PageInfo<Product> findAllProduct(Integer cid, int currentpage, int size, double startprice, double endprice,
			Integer orderby, String text, Integer pflag) {
		ProductExample pe = new ProductExample();
		Criteria c = pe.createCriteria();
		if (cid != null) {
			c.andCidEqualTo(cid);
			c.andDiscPriceBetween(startprice, endprice);
		} else {
			c.andDiscPriceBetween(startprice, endprice);
		}
		if (text != null) {
			c.andPnameLike("%" + text + "%");
		}
		if (orderby != null) {
			if (orderby == 3) {
				pe.setOrderByClause("disc_price asc");
			}
			if (orderby == 4) {
				pe.setOrderByClause("disc_price desc");
			}
			if (orderby == 2) {
				pe.setOrderByClause("pupdate desc");
			}
		}
		if (pflag != null) {
			c.andPflagEqualTo(pflag);
		}
		PageHelper.startPage(currentpage, size);
		List<Product> list = pm.selectByExampleWithBLOBs(pe);
		PageInfo<Product> page = new PageInfo<>(list);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setCategory(cm.selectByPrimaryKey(list.get(i).getCid()));
			Double avgstar = comm.selectAvgStar(list.get(i).getPid());
			if (avgstar != null) {
				list.get(i).setAvgstar(avgstar.intValue());
			} else {
				list.get(i).setAvgstar(0);
			}
		}
		if (orderby != null) {
			if (orderby == 1) {
				Collections.sort(list, new Comparator<Product>() {
					public int compare(Product o1, Product o2) {

						// 按照星级进行降序序排列
						if (o1.getAvgstar() < o2.getAvgstar()) {
							return 1;
						}
						if (o1.getAvgstar() == o2.getAvgstar()) {
							return 0;
						}
						return -1;
					}
				});
				page = new PageInfo<>(list);
				return page;
			}
		}
		return page;
	}

	// 操作上下架
	public int stopAndStart(int pflag, int pid, int isHot) {
		ProductExample pe = new ProductExample();
		Criteria c = pe.createCriteria();
		Product record = new Product();
		record.setPflag(pflag);
		record.setPid(pid);
		record.setIsHot(isHot);
		return pm.updateByPrimaryKeySelective(record);
	}

	// 添加商品
	public int save(Product product) {
		return pm.insertSelective(product);
	}

	// 删除商品
	public int delete(int pid) {
		return pm.deleteByPrimaryKey(pid);
	}

	// 根据id查商品 2
	@SuppressWarnings("unchecked")
	public Product selectByPid(int pid, String userId) {
		// 浏览 次数+1，写到redis里
		try {
			Integer viewCount = 0;
			Object object = rt.opsForValue().get(pid + "");
			if (object != null) {
				// 第一次浏览
				viewCount = Integer.parseInt(object + "");
			} else {
			}

			viewCount += 1;// 浏览次数+1
			Product prod = pm.selectByPrimaryKey(pid);
			rt.opsForValue().set(pid + "", viewCount + "");
			prod.setViewCount(viewCount);

			// 记录 用户 的 浏览记录
			storageUserHistoryViews(prod.getPid() + "", userId);

			return prod;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 根据 pid 查询商品
	public Product selectByPid(int pid) {
		return pm.selectByPrimaryKey(pid);
	}

	// 存储商品 浏览记录
	@SuppressWarnings("unchecked")
	private void storageUserHistoryViews(String pid, String userId) {
		if (userId == null) {
			return;
		}
		// 将该prod 的 pid存到 redis浏览记录当中

		// 根据 uid 获取 该用户的浏览历史记录 list集合
		LinkedList<ViewObj> viewHistoryProdList = (LinkedList<ViewObj>) rt.opsForValue().get(userId);
		if (viewHistoryProdList == null || viewHistoryProdList.size() <= 0) {
			viewHistoryProdList = new LinkedList<>();
		}
		// 如果 历史记录 当中没有 该pid,则直接加到 最前面
		ViewObj view = new ViewObj();
		view.setPid(pid);
		view.setViewedTime(new Date());
		if (!viewHistoryProdList.contains(view)) {
			viewHistoryProdList.addFirst(view);
		} else {
			// 如果包含，则从后面提到最前面
			// viewHistoryProdList.remove(view);
			Iterator<ViewObj> iterator = viewHistoryProdList.iterator();
			while (iterator.hasNext()) {
				ViewObj viewObj = iterator.next();
				if (viewObj.getPid().equals(pid)) {
					iterator.remove();
				}
			}
			viewHistoryProdList.addFirst(view);
		}

		// 将 操作完的 集合 ，重新放到redis
		rt.opsForValue().set(userId, viewHistoryProdList);
	}

	// 查询 历史记录 商品列表
	@SuppressWarnings("unchecked")
	public PageInfo<Product> getHistoryProdsList(String userId, Integer tcode, Integer currPage, Integer pageSize) {
		// 1.先 根据 userId 获取对应的 List<ViewObj>
		List<ViewObj> viewList = (List<ViewObj>) rt.opsForValue().get(userId);
		if (viewList == null || viewList.size() <= 0) {
			return null;
		}
		// 2.根据时间 排序（按天，按周，按月）
		if (tcode == 0) {
			// 查询全部--不用排序
		} else if (tcode == -1) {
			// 查询今天
			viewList = screenByTime(viewList, 1);
		} else if (tcode == -2) {
			// 查询近三天
			viewList = screenByTime(viewList, 3);
		} else if (tcode == 1) {
			// 查询近一周
			viewList = screenByTime(viewList, 7);
		} else if (tcode == 2) {
			// 查询近两个周
			viewList = screenByTime(viewList, 15);
		} else {
			// 查询近一个月
			viewList = screenByTime(viewList, 30);
		}
		int[] pidArr = new int[viewList.size()];
		for (int i = 0; i < viewList.size(); i++) {
			pidArr[i] = Integer.parseInt(viewList.get(i).getPid());
		}

		// 3.根据pid进行查询,封装到list(已经从数据库中分完页的了)
		List<Product> viewProdList = new ArrayList<>();
		PageHelper.startPage(currPage, pageSize);
		viewProdList = pm.selectByPidsWithPage(pidArr);

		PageInfo<Product> page = new PageInfo<>(viewProdList);
		// 设置 浏览日期
		List<Product> resList = new ArrayList<>();
		for (ViewObj vo : viewList) {
			int pid = Integer.parseInt(vo.getPid());
			for (Product product : page.getList()) {
				if (pid == product.getPid()) {
					product.setViewedTime(vo.getViewedTime());
					resList.add(product);
				}
			}
		}
		if (resList != null && resList.size() > 0) {
			/* 自定义按照age排序 */
			Collections.sort(resList, new Comparator() {
				@Override
				public int compare(Object o1, Object o2) {
					Product p1 = (Product) o1;
					Product p2 = (Product) o2;
					return p2.getViewedTime().compareTo(p1.getViewedTime());
				}
			});
		}

		page.setList(resList);// 最终的 list
		return page;

	}

	// 根据时间段筛选list中的元素
	private List<ViewObj> screenByTime(List<ViewObj> viewList, int days) {
		List<ViewObj> list = new ArrayList<>();
		for (ViewObj vo : viewList) {
			long currentTimeMillis = System.currentTimeMillis();
			long viewedTimeMillis = vo.getViewedTime().getTime();
			long t = MyConstants.THE_DAY_OF_MILLIS * days;
			if ((currentTimeMillis - viewedTimeMillis) < t) {
				// 如果 在时间差之内
				list.add(vo);
			}
		}
		return list;
	}

	/**
	 * 查询每种商品类别 的销售所占比例
	 * 
	 * @return
	 */
	public List<Category> querySaleByCategory() {
		List<Map<String, Object>> list = new ArrayList<>();
		// 查询出所有商品类别的 cid
		List<Category> clist = cm.selectByExample(null);

		for (Category c : clist) {
			ProductExample pe = new ProductExample();
			pe.createCriteria().andCidEqualTo(c.getCid());
			// 查询出每种商品类别下的 所有商品 ，把每个商品的销售数量累加
			List<Product> prodByCid = pm.selectByExample(pe);
			if (prodByCid != null && prodByCid.size() > 0) {
				for (Product p : prodByCid) {
					c.setProdSales(c.getProdSales() + p.getPsalenum());
				}
			}
			// System.out.println(c.getCname() + "--->" + saleCountByCid);
			// 添加到map
		}

		return clist; // 包含了销售数量
	}

	// 查询商品销售总记录
	public int selectAllSale() {
		return pm.selectALLsale();
	}

	// 查询商品总量
	public int selectCountPro() {
		return pm.selectCountPro();
	}

	// 查询上架商品
	public int selectCountFlag() {
		return pm.selectCountFlag();
	}

	// 查询热门商品
	public int selectCountHot() {
		return pm.selectCountHot();
	}

	public Page<Product> selectRelate(int cid, int ishot) {
		ProductExample pe = new ProductExample();
		Criteria c = pe.createCriteria();
		c.andCidEqualTo(cid);
		c.andIsHotEqualTo(ishot);
		Page<Product> list = PageHelper.startPage(1, 6);
		pm.selectByExampleWithBLOBs(pe);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setCategory(cm.selectByPrimaryKey(list.get(i).getCid()));
			Double avgstar = comm.selectAvgStar(list.get(i).getPid());
			if (avgstar != null) {
				list.get(i).setAvgstar(avgstar.intValue());
			} else {
				list.get(i).setAvgstar(0);
			}
		}
		return list;
	}

	// 根据pid 清除 浏览的商品记录
	@SuppressWarnings("unchecked")
	public int delViewdProdByPid(Integer pid, String userId) {
		try {
			// 根据 userId 获取浏览记录列表
			LinkedList<ViewObj> viewObjList = (LinkedList<ViewObj>) rt.opsForValue().get(userId);
			if (viewObjList == null || viewObjList.size() <= 0) {
				return 0;
			}
			int ret = 0;
			for (int i = 0; i < viewObjList.size(); i++) {
				if (Integer.parseInt(viewObjList.get(i).getPid()) == pid) {
					viewObjList.remove(i);
					rt.opsForValue().set(userId, viewObjList);
					ret = 1;// 找到就删除，重新设置进redis，然后返回
					break;
				}
			}
			return ret;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	// 根据pid 清除 所有的 浏览的商品记录
	@SuppressWarnings("unchecked")
	public int delAllViewdProds(String userId) {
		try {
			rt.delete(userId);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	// 支付成功之后加到商品表的数量里面
	public int addPSaleNumWithPid(Integer pid, Integer pcount) {
		try {
			return pm.addPSaleNumWithPid(pcount, pid);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	public int updatepro(Product product) {
		ProductExample pe = new ProductExample();
		Criteria c = pe.createCriteria();
		c.andPidEqualTo(product.getPid());
		return pm.updateByExampleSelective(product, pe);
	}

}
