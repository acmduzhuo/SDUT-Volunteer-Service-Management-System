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
public class CommonAction_guanli {
	@Autowired
	UserService userSer;
	//跳转到登录页面
	@RequestMapping("login_guanli")
	public String login_guanli() {
		return "login_guanli";
	}
	//点击登录--登录操作
	@RequestMapping("guanli")
	public String guanli(@RequestParam Map params,HttpSession session) {
		boolean b=userSer.login_guanli(params,session);
		System.out.println("管理"+b);
		if(b) {
			return "system_guanli";
		}else {
			return "login_guanli";
		}
	}
}
