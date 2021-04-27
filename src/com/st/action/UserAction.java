package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.TableJson;
import com.st.service.UserService;


@Controller
public class UserAction {
	@Autowired
	UserService user_ser;

	@RequestMapping("/user_page")
	public String user_page() {
		System.out.println("--------Action--forward   page----");
		user_ser.test();
//		return "WEB-INF/page/userPage.jsp";
		return "userPage";
	}
	@RequestMapping("/system")
	public String system_page() {
		return "system";
	}
	@RequestMapping("user_list")
	@ResponseBody
	public TableJson user_list(@RequestParam Map params) {
		//将参数传递给SQL语句
		//		service调用dao--mapper--sql
		//查询结果的所有数据量
		int count = user_ser.getCount(params);
		return new TableJson(count, user_ser.user_list(params));
	}
	
	@RequestMapping("user_del")
	@ResponseBody
	public void user_del(@RequestParam Map params) {
		//删除用户信息
		user_ser.user_del(params);
	}
	@RequestMapping("user_save")
	@ResponseBody
	public void user_save(@RequestParam Map params) {
		user_ser.user_save(params);
	}
	@RequestMapping("user_update")
	@ResponseBody
	public void user_update(@RequestParam Map params) {
		user_ser.user_update(params);
	}
	@RequestMapping("user_del_more")
	@ResponseBody
	public void user_del_more(@RequestParam Map params) {
		System.out.println(params);
		user_ser.user_del_more(params);
	}
	/**
	 * 用户退出
	 */
	@RequestMapping("login_out")
	public String login_out(HttpSession session) {
		//让session失效
		session.invalidate();
		return "login";
	}
}


