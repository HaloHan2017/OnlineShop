package com.yc.olshop.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.olshop.biz.ProductBiz;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	private ProductBiz pbiz;

}
