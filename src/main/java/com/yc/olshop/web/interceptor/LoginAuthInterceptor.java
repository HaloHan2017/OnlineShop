package com.yc.olshop.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yc.olshop.bean.User;

public class LoginAuthInterceptor implements HandlerInterceptor {

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
		// 1.如果是 关于购物车，订单，收藏列表，评价，我的账户
		String uri = request.getRequestURI();

		if (uri.contains("cart") || uri.contains("checkout") || uri.contains("wishlist") || uri.contains("comment")
				|| uri.contains("my-account") || uri.contains("my-history") || uri.contains("/addfavorite")) {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				// 未登录，则进行拦截--->跳转到登录界面
				if (uri.contains("comment/selectAllComment") || uri.contains("comment/selectLike")) {
					return true;
				}
				if (request.getHeader("X-Requested-With") != null
						&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
					response.getWriter().write("isAjax");
				} else {
					// pw.println("<script>alert('您暂未登录，请先登录');location.href='login'</script>");
					response.sendRedirect(request.getContextPath() + "/login");
				}
				return false;
			}
			return true;
		}
		// 2.不是以上界面，则直接进行放行
		return true;
	}

}
