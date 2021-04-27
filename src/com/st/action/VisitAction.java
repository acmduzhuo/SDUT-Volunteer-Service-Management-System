package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.service.VisitService;

@Controller
public class VisitAction {
	@Autowired
	VisitService visitSer;
	
	@RequestMapping("visit_save")
	@ResponseBody
	public void visit_save(@RequestParam Map params,HttpSession session) {
		visitSer.visit_save(params,session);
	}
	
	/**
	 * 回访记录
	 */
	@RequestMapping("visitlog_page")
	public String visitlog_page(@RequestParam Map params,HttpServletRequest request) {
		
		List loglist=visitSer.visitlog_list(params);
		request.setAttribute("loglist", loglist);
		for(Object obj:loglist) {
			System.out.println((Map)obj);
		}
		//跳转界面
		return "visitlog_Page";
	}
	/**
	 * 报表
	 */
	@RequestMapping("datatable_page")
	public String datatable_page() {
		return "datatable_Page";
	}
	@RequestMapping("total_sales")
	@ResponseBody
	public Map total_sales() {
		Map map = visitSer.total_sales();
		return map;
	}
}
