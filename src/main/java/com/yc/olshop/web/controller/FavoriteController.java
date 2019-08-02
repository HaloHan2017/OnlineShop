package com.yc.olshop.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.yc.olshop.bean.Product;
import com.yc.olshop.biz.FavoriteBiz;
import com.yc.olshop.utils.PageHelperUtil;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteBiz fb;

	// 收藏商品
	@RequestMapping("addfavorite")
	@ResponseBody
	public int addfavorite(int pid, int uid) {
		return fb.addfavorite(pid, uid);
	}

	// 删除收藏商品
	@RequestMapping("delfavorite")
	@ResponseBody
	public int delfavoriteByPid(int pid, int uid) {
		return fb.delfavoriteByPid(pid, uid);
	}

	// 查询所有收藏商品
	@RequestMapping("selectfavorite")
	@ResponseBody
	public PageHelperUtil selectAllFavorite(Integer uid, @RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "4") Integer pageSize) {
		PageInfo<Product> page = fb.selectAllFavorite(uid, currPage, pageSize);
		if (page == null) {
			return new PageHelperUtil(0, null, null, null);
		}
		List<Product> list = page.getList();
		return new PageHelperUtil(1, list, page.getPageNum(), page.getPages());
	}
}
