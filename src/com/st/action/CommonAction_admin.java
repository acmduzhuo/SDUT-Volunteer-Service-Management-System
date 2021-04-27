package com.st.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.service.UserService;

/**
 * 没有登陆时既可以访问的路径
 * @author dell
 *
 */
@Controller
public class CommonAction_admin {
	@Autowired
	UserService userSer;
	//跳转到登录页面
	@RequestMapping("login_admin")
	public String login_admin() {
		return "login_admin";
	}
	//点击登录--登录操作
	@RequestMapping("admin")
	public String admin(@RequestParam Map params,HttpSession session) {
		boolean b=userSer.login_admin(params,session);
		if(b) {
			return "system_admin";
		}else {
			return "login_admin";
		}
	}
}
