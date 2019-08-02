package com.yc.olshop.biz;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yc.olshop.bean.Favorite;
import com.yc.olshop.bean.FavoriteExample;
import com.yc.olshop.bean.FavoriteExample.Criteria;
import com.yc.olshop.bean.Product;
import com.yc.olshop.dao.FavoriteMapper;

@Service
public class FavoriteBiz {

	@Autowired
	private FavoriteMapper fm;

	// 添加收藏
	public int addfavorite(int pid, int uid) {
		FavoriteExample fe = new FavoriteExample();
		Favorite record = new Favorite();
		record.setPid(pid);
		record.setUid(uid);
		record.setFavTime(new Date());
		return fm.insertSelective(record);
	}

	// 删除收藏
	public int delfavoriteByPid(int pid, int uid) {
		FavoriteExample fe = new FavoriteExample();
		Criteria c = fe.createCriteria();
		c.andPidEqualTo(pid);
		c.andUidEqualTo(uid);
		return fm.deleteByExample(fe);
	}

	// 查询所有favorite
	public List<Favorite> selectFavByUid(Integer uid) {
		FavoriteExample fe = new FavoriteExample();
		Criteria c = fe.createCriteria();
		c.andUidEqualTo(uid);
		return fm.selectByExample(fe);
	}

	// 查询所有收藏商品
	public PageInfo<Product> selectAllFavorite(Integer uid, Integer currPage, Integer pageSize) {
		PageHelper.startPage(currPage, pageSize);
		FavoriteExample fe = new FavoriteExample();
		List<Product> list = fm.selectByUid(uid);
		PageInfo<Product> page = new PageInfo<>(list);
		if (list.size() > 0) {
			return page;
		} else {
			return null;
		}
	}

}
