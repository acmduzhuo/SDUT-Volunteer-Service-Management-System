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
public class CommonAction {
	@Autowired
	UserService userSer;
	//跳转到登录页面
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	//点击登录--登录操作
	@RequestMapping("loginaction")
	public String logincation(@RequestParam Map params,HttpSession session) {
		boolean b=userSer.login(params,session);
		System.out.println("用户"+b);
		if(b) {
			return "system";
		}else {
			return "login";
		}
	}
}
