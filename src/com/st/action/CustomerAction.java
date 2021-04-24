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
import com.st.service.CustomerService;
import com.st.util.ParamsUtil;

@Controller
public class CustomerAction {
	@Autowired
	CustomerService cusSer;

	@RequestMapping("/customer_all_page")//从system接受
	public String customer_all_page() {

		return "customer_all_Page";//页面上的文件名
	}
	@RequestMapping("customer_all_list")
	@ResponseBody
	public TableJson customer_list(@RequestParam Map params) {
		int count=cusSer.getCount(params);
		return new TableJson(count, cusSer.customer_list(params));
	}
	@RequestMapping("customer_save")
	@ResponseBody
	public void customer_save(@RequestParam Map params,HttpSession session) {
		//System.out.println(params);
		cusSer.customer_save(params,session);
	}
	@RequestMapping("customer_del")
	@ResponseBody
	public void customer_del(@RequestParam Map params) {
		System.out.println(params);
		cusSer.customer_del(params);
	}
	@RequestMapping("customer_del_more")
	@ResponseBody
	public void customer_del_more(@RequestParam Map params) {
		//System.out.println(params);
		ParamsUtil.arr_str(params, "customerids");
		cusSer.customer_del_more(params);
	}
	@RequestMapping("customer_update")
	@ResponseBody
	public void customer_update(@RequestParam Map params) {
		cusSer.customer_update(params);
	}
	
	/**
	 * 跳转到公海客户信息页面
	 * @return
	 */
	@RequestMapping("/customer_public_page")
	public String customer_public_page() {
		return "customer_public_Page";
	}
	//页面显示数据
	@RequestMapping("customer_public_list")
	@ResponseBody
	//ajax返回数据
	public TableJson customer_public_list(@RequestParam Map params) {
		int count=cusSer.getPublicCount(params);
		List list=cusSer.customer_public_list(params);
		return new TableJson(count,list);
		//(count,cusSer.customer_public_list(params));
	}
	@RequestMapping("customer_private")
	@ResponseBody
	public void customer_private(@RequestParam Map params,HttpSession session) {
		cusSer.customer_private(params,session);
	}
	/**
	 * 跟单客户
	 * @return
	 */
	@RequestMapping("customer_private_page")
	public String customer_private_page() {
		return "customer_private_Page";
	}
	@RequestMapping("customer_private_list")
	@ResponseBody
	public TableJson customer_private_list(@RequestParam Map params,HttpSession session) {
		int count=cusSer.getPrivateCount(params,session);
		List list=cusSer.customer_private_list(params,session);
		return new TableJson(count,list);
	}
	@RequestMapping("customer_public")
	@ResponseBody
	public void customer_public(@RequestParam Map params) {
		cusSer.customer_public(params);
	}
	
	/**
	 * 研发部门
	 */
	
	 @RequestMapping("/customer_yanfa_page")//从system接受 public String
	 public String customer_yanfa_page() {
		 return "customer_yanfa_Page";//页面上的文件名 
	 }
	@RequestMapping("customer_yanfa_list")
	@ResponseBody
	public TableJson customer_yanfa_list(@RequestParam Map params) {
		 int count=cusSer.getYanfaCount(params);
	     List list=cusSer.customer_yanfa_list(params);
		return new TableJson(count, cusSer.customer_yanfa_list(params));
	}
	
	/**
	 * 市场部门
	 */
	 @RequestMapping("/customer_shichang_page")//从system接受 public String
	 public String customer_shichang_page() {
		 return "customer_shichang_Page";//页面上的文件名 
	 }
	@RequestMapping("customer_shichang_list")
	@ResponseBody
	public TableJson customer_shichang_list(@RequestParam Map params) {
		 int count=cusSer.getShichangCount(params);
	     List list=cusSer.customer_shichang_list(params);
		return new TableJson(count, cusSer.customer_shichang_list(params));
	}
	/**
	 * 测试部门
	 */
	 @RequestMapping("/customer_ceshi_page")//从system接受 public String
	 public String customer_ceshi_page() {
		 return "customer_ceshi_Page";//页面上的文件名 
	 }
	@RequestMapping("customer_ceshi_list")
	@ResponseBody
	public TableJson customer_ceshi_list(@RequestParam Map params) {
		 int count=cusSer.getCeshiCount(params);
	     List list=cusSer.customer_ceshi_list(params);
		return new TableJson(count, cusSer.customer_ceshi_list(params));
	}
	/**
	 * 其他部门
	 */
	 @RequestMapping("/customer_qita_page")//从system接受 public String
	 public String customer_qita_page() {
		 return "customer_qita_Page";//页面上的文件名 
	 }
	@RequestMapping("customer_qita_list")
	@ResponseBody
	public TableJson customer_qita_list(@RequestParam Map params) {
		 int count=cusSer.getQitaCount(params);
	     List list=cusSer.customer_qita_list(params);
		return new TableJson(count, cusSer.customer_qita_list(params));
	}
}
