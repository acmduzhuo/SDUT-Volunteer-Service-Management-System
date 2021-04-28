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
import com.st.service.GuanliService;
import com.st.service.UserService;


@Controller
public class GuanliAction {
	@Autowired
	GuanliService guanli_ser;

	@RequestMapping("/guanli_page")
	public String guanli_page() {
		System.out.println("--------Action--forward   page----");
		guanli_ser.test();
//		return "WEB-INF/page/userPage.jsp";
		return "guanliPage";
	}
	@RequestMapping("guanli_list")
	@ResponseBody
	public TableJson guanli_list(@RequestParam Map params) {
		//将参数传递给SQL语句
		//		service调用dao--mapper--sql
		//查询结果的所有数据量
		int count = guanli_ser.getCount(params);
		return new TableJson(count, guanli_ser.guanli_list(params));
	}
	
	@RequestMapping("guanli_del")
	@ResponseBody
	public void guanli_del(@RequestParam Map params) {
		//删除用户信息
		guanli_ser.guanli_del(params);
	}
	@RequestMapping("guanli_save")
	@ResponseBody
	public void guanli_save(@RequestParam Map params) {
		guanli_ser.guanli_save(params);
	}
	@RequestMapping("guanli_update")
	@ResponseBody
	public void guanli_update(@RequestParam Map params) {
		guanli_ser.guanli_update(params);
	}
	@RequestMapping("guanli_del_more")
	@ResponseBody
	public void guanli_del_more(@RequestParam Map params) {
		System.out.println(params);
		guanli_ser.guanli_del_more(params);
	}
}


