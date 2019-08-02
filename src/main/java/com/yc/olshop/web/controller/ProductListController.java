package com.yc.olshop.web.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.yc.olshop.bean.Category;
import com.yc.olshop.bean.Favorite;
import com.yc.olshop.bean.Product;
import com.yc.olshop.bean.User;
import com.yc.olshop.biz.CategoryBiz;
import com.yc.olshop.biz.CommentBiz;
import com.yc.olshop.biz.FavoriteBiz;
import com.yc.olshop.biz.ProductBiz;
import com.yc.olshop.utils.PageHelperUtil;
import com.yc.olshop.utils.Result;

@Controller
public class ProductListController {

	@Resource
	CategoryBiz cb;

	@Resource
	ProductBiz pb;
	@Resource
	FavoriteBiz fb;
	@Resource
	CommentBiz commb;

	// 日期字符串格式化
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false)); // true:允许输入空值，false:不能为空值

	}

	@RequestMapping("showAllCategory")
	@ResponseBody
	public List<Category> findAllCategory() {
		List<Category> list = cb.findAllCategory();
		// for (int i = 0; i < list.size(); i++) {
		// System.out.println(list.get(i));
		// }
		return cb.findAllCategory();
	}

	// 后台展示数据
	@RequestMapping("products")
	@ResponseBody
	public Map<String, Object> findAllProduct(@RequestParam(value = "cid", required = false) Integer cid,
			@RequestParam(required = false) Double startprice, @RequestParam(required = false) Double endprice,
			@RequestParam(required = false) String text, @RequestParam(required = false) Integer pflag) {
		// model.addAttribute("productList", pb.findAllProduct());
		// return "admin/product/products_List";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", pb.findAllProduct(cid, startprice, endprice, text, pflag));
		return map;
	}

	// 前台展示数据
	/*
	 * @RequestMapping("showproduct")
	 * 
	 * @ResponseBody public PageHelperUtil findAllProduct(@RequestParam(value =
	 * "cid", required = false) Integer cid,
	 * 
	 * @RequestParam(defaultValue = "1") int
	 * currentpage, @RequestParam(defaultValue = "12") int size, Double
	 * startprice, Double endprice, @RequestParam(required = false) Integer
	 * orderby,
	 * 
	 * @RequestParam(value = "uid", required = false) Integer uid,
	 * 
	 * @RequestParam(value = "text", required = false) String text,
	 * 
	 * @RequestParam(defaultValue = "1") Integer pflag) { List<Product> plist =
	 * pb.findAllProduct(cid, startprice, endprice, text, pflag); List<Favorite>
	 * favorite = null; if (uid != null) { favorite = fb.selectFavByUid(uid); }
	 * int totalpage = plist.size() % size; if (totalpage == 0) { totalpage =
	 * plist.size() / size; } else { totalpage = plist.size() / size + 1; }
	 * Page<Product> data = pb.findAllProduct(cid, currentpage, size,
	 * startprice, endprice, orderby, text, pflag); for (int i = 0; i <
	 * data.size(); i++) { data.get(i).setFavorites(favorite); }
	 * 
	 * return new PageHelperUtil(1, data, currentpage, totalpage); }
	 */
	// 前台展示数据
	@RequestMapping("showproduct")
	@ResponseBody
	public PageHelperUtil findAllProduct(@RequestParam(value = "cid", required = false) Integer cid,
			@RequestParam(defaultValue = "1") int currentpage, @RequestParam(defaultValue = "12") int size,
			Double startprice, Double endprice, @RequestParam(required = false) Integer orderby,
			@RequestParam(value = "uid", required = false) Integer uid,
			@RequestParam(value = "text", required = false) String text,
			@RequestParam(defaultValue = "1") Integer pflag) {
		List<Favorite> favorite = null;
		if (uid != null) {
			favorite = fb.selectFavByUid(uid);
		}
		PageInfo<Product> page = pb.findAllProduct(cid, currentpage, size, startprice, endprice, orderby, text, pflag);
		List<Product> data = page.getList();
		for (int i = 0; i < data.size(); i++) {
			data.get(i).setFavorites(favorite);
		}
		return new PageHelperUtil(1, data, page.getPageNum(), page.getPages());
	}

	// 操作上下架
	@RequestMapping("stopAndStart")
	@ResponseBody
	public int stopAndStart(int pflag, int pid, int isHot) {
		return pb.stopAndStart(pflag, pid, isHot);
	}

	// 添加商品
	@RequestMapping("productSave")
	@ResponseBody
	public Result save(Product product) {
		product.setPupdate(new Date());
		if (pb.save(product) == 1) {
			return new Result(Result.SUCCESS, "商品添加成功");
		} else {
			return new Result(Result.FAILTER, "商品添加失败");
		}
	}

	// 删除商品
	@RequestMapping("productDel")
	@ResponseBody
	public Result delete(int pid) {
		if (pb.delete(pid) == 1) {
			return new Result(Result.SUCCESS, "删除成功");
		} else {
			return new Result(Result.FAILTER, "删除失败");
		}
	}

	// 头像上传
	@RequestMapping("upload")
	@ResponseBody
	public Result upload(@RequestParam("file") MultipartFile file) {
		try {
			System.out.println(file.getOriginalFilename());
			file.transferTo(new File("c:/upload/" + file.getOriginalFilename()));
			return new Result(Result.SUCCESS, "文件添加成功", "/upload/" + file.getOriginalFilename());
		} catch (Exception e) {
			return new Result(Result.FAILTER, "文件添加失败");
		}
	}

	@GetMapping("product_update")
	public String product_update(int pid, Model model) {
		model.addAttribute("product", pb.selectByPid(pid));
		return "/admin/product/product_update";
	}

	// 商品详情
	@GetMapping("product")
	public String selectProductByPid(int pid, Model model, HttpSession session, int avgstar,
			@RequestParam(defaultValue = "1") int ishot, int cid, Integer uid) {
		User user = (User) session.getAttribute("user");
		String userId = null;
		if (user != null) {
			userId = user.getUsername() + "" + user.getUid();// 不加 “-” ，用以区分//
																// 购物车的userId
		}

		// model.addAttribute("singlepro", pb.selectByPid(pid, userId));

		Product p = pb.selectByPid(pid, userId);// 查询 商品浏览量包括详情
		p.setAvgstar(avgstar);
		model.addAttribute("singlepro", p);
		Page<Product> data = pb.selectRelate(cid, ishot);
		model.addAttribute("relatepro", data);
		return "product";
	}

	// 查询 历史记录 表
	@GetMapping("getHistoryProdsList")
	@ResponseBody
	public PageHelperUtil showHistoryProds(@RequestParam(defaultValue = "0") Integer tcode,
			@SessionAttribute("user") User user, @RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "12") Integer pageSize) {
		PageInfo<Product> prodList = pb.getHistoryProdsList(user.getUsername() + "" + user.getUid(), tcode, currPage,
				pageSize);
		// 获取总页数
		int totalPage = 0;
		int pageNum = 1;
		List<Product> viewedProdList = new ArrayList<>();
		if (prodList != null) {
			totalPage = prodList.getPages();
			viewedProdList = prodList.getList();
			pageNum = prodList.getPageNum();
		}

		// if (prodList == null || prodList.size() <= 0) {
		// result = new Result(0, "暂无记录");
		// } else {
		// result.setData(prodList);
		// }
		return new PageHelperUtil(1, viewedProdList, pageNum, totalPage);
	}

	// 后台产品销售记录
	@GetMapping("home")
	public String selectAllSale(Model model) {
		model.addAttribute("allsale", pb.selectAllSale());
		int allpro = pb.selectCountPro();
		model.addAttribute("allpro", allpro);
		int allpflag = pb.selectCountFlag();
		model.addAttribute("allpflag", allpflag);
		model.addAttribute("allhot", pb.selectCountHot());
		model.addAttribute("allnotpflag", allpro - allpflag);
		model.addAttribute("allcomm", commb.selectcountcomm());
		return "admin/home";
	}

	// 根据pid 清除 浏览的商品记录
	@PostMapping("delViewdProdByPid")
	@ResponseBody
	public Result delViewdProdByPid(@SessionAttribute("user") User user, Integer pid) {
		Result result = new Result(1, "ok");
		if (user == null) {
			return new Result(0, "登录已失效，请重新登录");
		} else {
			String userId = user.getUsername() + "" + user.getUid();
			int ret = pb.delViewdProdByPid(pid, userId);
			if (ret <= 0) {
				result = new Result(-1, "服务器忙");
			}
			return result;
		}
	}

	// 根据pid 清除 所有的 浏览的商品记录
	@PostMapping("delAllViewdProds")
	@ResponseBody
	public Result delAllViewdProds(@SessionAttribute("user") User user) {
		Result result = new Result(1, "ok");
		if (user == null) {
			return new Result(0, "登录已失效，请重新登录");
		} else {
			String userId = user.getUsername() + "" + user.getUid();
			int ret = pb.delAllViewdProds(userId);
			if (ret <= 0) {
				result = new Result(-1, "服务器忙");
			}
			return result;
		}
	}

	// 修改商品详情
	@RequestMapping("productUpload")
	@ResponseBody
	public Result update(Product product) {
		int code = pb.updatepro(product);
		if (code == 1) {
			return new Result(code, "修改成功");
		} else {
			return new Result(0, "修改失败");
		}

	}

}
