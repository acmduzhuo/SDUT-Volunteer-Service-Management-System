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
import com.st.service.TimeService;
import com.st.service.UserService;


@Controller
public class TimeAction {
	@Autowired
	TimeService time_ser;

	@RequestMapping("/time_page")
	public String time_page() {
		time_ser.test();
		return "timePage";
	}
	@RequestMapping("time_list")
	@ResponseBody
	public TableJson time_list(@RequestParam Map params) {
		int count = time_ser.getCount(params);
		return new TableJson(count, time_ser.time_list(params));
	}
	
	@RequestMapping("time_del")
	@ResponseBody
	public void time_del(@RequestParam Map params) {
		time_ser.time_del(params);
	}
	@RequestMapping("time_save")
	@ResponseBody
	public void time_save(@RequestParam Map params) {
		time_ser.time_save(params);
	}
	@RequestMapping("time_update")
	@ResponseBody
	public void time_update(@RequestParam Map params) {
		time_ser.time_update(params);
	}
	@RequestMapping("time_del_more")
	@ResponseBody
	public void time_del_more(@RequestParam Map params) {
		time_ser.time_del_more(params);
	}
}


