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
 * ��֤�û��Ƿ��¼�������¼�������������ʣ����ޣ�����ת��¼����
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
			//��ֵ�Ѿ���½
			super.doFilter(req, res, chain);
		}else {
			//ת����login
			//req.getRequestDispatcher("login").forward(req, res);
			//�ض���
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
