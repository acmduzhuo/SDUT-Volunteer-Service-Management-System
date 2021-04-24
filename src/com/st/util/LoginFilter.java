package com.st.util;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 验证用户是否登录，如果登录，可以正常访问，如无，则跳转登录界面
 * @author dell
 *
 */
public class LoginFilter extends HttpFilter{
	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		Object user=session.getAttribute("loginuser");
		if(user!=null) {
			//有值已经登陆
			super.doFilter(req, res, chain);
		}else {
			//转发到login
			//req.getRequestDispatcher("login").forward(req, res);
			//重定向
			String path = req.getContextPath();
			String basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
					+ path + "/";
			res.sendRedirect(basePath+"login");
		}
		super.doFilter(req, res, chain);
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
