package com.yc.olshop.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yc.olshop.bean.Category;
import com.yc.olshop.biz.CategoryBiz;

@RestController
@RequestMapping("category")
public class CategoryController {
	@Autowired
	private CategoryBiz cbiz;

	/**
	 * 查询所有商品类别
	 * 
	 * @return
	 */
	@PostMapping("query")
	public List<Category> queryAll(ModelAndView mav) {
		// 查找所有的商品类别 以及 类别下对应的所有商品数量
		List<Category> clist = cbiz.queryAll();
		return clist;
	}

	@PostMapping("del")
	public Map<String, Object> delete(int cid) {
		Map<String, Object> result = new HashMap<>();
		int ret = cbiz.delete(cid);
		// int ret = -1;
		if (ret > 0) {
			result.put("code", 1);
			result.put("msg", "ok");
		} else {
			result.put("code", -1);
			result.put("msg", "删除失败");
		}
		return result;
	}

	@PostMapping("add")
	public Map<String, Object> delete(Category c, @RequestParam(defaultValue = "add") String flag) {
		Map<String, Object> result = new HashMap<>();
		int ret = cbiz.add(c, flag);
		if (ret > 0) {
			result.put("code", 1);
			result.put("msg", "ok");
		} else {
			result.put("code", -1);
			result.put("msg", "操作失败");
		}
		return result;
	}

}
