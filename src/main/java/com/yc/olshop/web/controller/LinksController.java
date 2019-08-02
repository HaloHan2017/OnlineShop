package com.yc.olshop.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yc.olshop.bean.Links;
import com.yc.olshop.bean.Result;
import com.yc.olshop.biz.BizException;
import com.yc.olshop.biz.LinksBiz;

@RestController
@RequestMapping("links")
public class LinksController {
	@Autowired
	private LinksBiz lbiz;

	@GetMapping("queryAllLinksList")
	public Result queryAllLinksList(@RequestParam(required = false) String key) {
		Result result = new Result(1, "ok");
		List<Links> linksList = lbiz.queryAllLinksList(key);
		result.setData(linksList);
		return result;
	}

	// 根据 lid删除 links
	@PostMapping("delByLid")
	public Result delByLid(Integer lid) {
		Result result = new Result(1, "ok");
		int ret = lbiz.delByLid(lid);
		if (ret <= 0) {
			result = new Result(-1, "服务器忙");
		}
		return result;
	}

	// 根据 lid 添加或修改 links
	@PostMapping("addOrUpdate")
	public Result addOrUpdate(Links links) {
		Result result = new Result(1, "ok");
		try {
			int ret = lbiz.addOrUpdate(links);
			if (ret <= 0) {
				result = new Result(-1, "服务器忙");
			}

		} catch (BizException e) {
			e.printStackTrace();
			result = new Result(-1, e.getMessage());
		}
		return result;
	}
}
