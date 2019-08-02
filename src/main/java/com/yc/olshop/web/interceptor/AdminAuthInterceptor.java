package com.yc.olshop.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yc.olshop.bean.Admin;

public class AdminAuthInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception e)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		// 获取请求的uri
		// 1.如果是 关于 后台管理
		String uri = request.getRequestURI();

		if (uri.contains("admin")) {
			Admin admin = (Admin) request.getSession().getAttribute("adminUser");
			if (admin == null) {
				response.sendRedirect(request.getContextPath() + "/admin/login");
				return false;
			}
			return true;
		}
		// 2.不是以上界面，则直接进行放行
		return true;
	}

}
