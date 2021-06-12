package com.st.action;

import java.util.List;
import java.util.ListIterator;
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
import com.alibaba.fastjson.JSONObject;

@Controller
public class CustomerAction {
	@Autowired
	CustomerService cusSer;

	@RequestMapping("/volunteer_all_page")//从system接受
	public String volunteer_all_page() {

		return "volunteer/volunteer_all_Page";//页面上的文件名
	}
	@RequestMapping("/customer_all_guanli_page")//从system接受
	public String customer_all_guanli_page() {

		return "customer_all_guanli_Page";//页面上的文件名
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
	@RequestMapping("/volunteer_public_page")
	public String volunteer_public_page() {
		return "volunteer/volunteer_public_Page";
	}
	//页面显示数据
	@RequestMapping("customer_public_list")
	@ResponseBody
	//ajax返回数据
	public TableJson customer_public_list(@RequestParam Map params,HttpSession session) {
		int count=cusSer.getPublicCount(params,session);
		List list=cusSer.customer_public_list(params,session);
		System.out.println(list);
//		Object listStr = list.get(0);
//		System.out.println(listStr);
		List listStr = list;
//		int k;
//		for (k=0; k<list.size(); k++) {
//			listStr.add(k, list.get(k)); 
//		}
//		JSONObject json=JSONObject.parseObject(listStr.toString());//关键
//		String str = json.getString("Customer_tel");
//		System.out.println(str);
//		System.out.println(listStr.size());
		int i, j;
		for (i=0; i<listStr.size()-1; i++) {
			for (j=i+1; j<listStr.size(); j++) {
				String str_i1 = listStr.get(i).toString().substring(listStr.get(i).toString().indexOf("Customer_number")+16,listStr.get(i).toString().indexOf(", Customer_max"));
				String str_i2 = listStr.get(i).toString().substring(listStr.get(i).toString().indexOf("Customer_max")+13,listStr.get(i).toString().indexOf(", Customer_state"));
				int num_i1 = Integer.parseInt(str_i1);
				int num_i2 = Integer.parseInt(str_i2);
				float num_i = (float)num_i1 / (float)num_i2;
				System.out.println(num_i);
				String str_j1 = listStr.get(j).toString().substring(listStr.get(j).toString().indexOf("Customer_number")+16,listStr.get(j).toString().indexOf(", Customer_max"));
				String str_j2 = listStr.get(j).toString().substring(listStr.get(j).toString().indexOf("Customer_max")+13,listStr.get(j).toString().indexOf(", Customer_state"));
				int num_j1 = Integer.parseInt(str_j1);
				int num_j2 = Integer.parseInt(str_j2);
				float num_j = (float)num_j1 / (float)num_j2;
				System.out.println(num_j);
				if(num_i < num_j) {
					Object listStrTemp = listStr.get(i);
//					listStr.remove(i);
//					listStr.add(i,listStr.get(j));
//					listStr.remove(j);
//					listStr.add(j,listStrTemp);
					listStr.set(i, listStr.get(j));
					listStr.set(j, listStrTemp);
				}
			}
		}
//		System.out.println(listStr);
//		for (int i=0; i<listStr.size(); i++) {
//			listStr.get(i).toString().indexOf("Customer_number")
//			listStr.get(i).toString().indexOf("Customer_number")
//			System.out.println(listStr.get(i).toString());
//			String str1 = listStr.get(i).toString().substring(listStr.get(i).toString().indexOf("Customer_number")+16,listStr.get(i).toString().indexOf(", Customer_max"));
//			String str2 = listStr.get(i).toString().substring(listStr.get(i).toString().indexOf("Customer_max")+13,listStr.get(i).toString().indexOf(", Customer_state"));
//			int num1 = Integer.parseInt(str1);
//			int num2 = Integer.parseInt(str2);
//			float num = (float)num1 / (float)num2;
//			System.out.println(num);
//			System.out.println(listStr.get(i).toString().substring(listStr.get(i).toString().indexOf("Customer_number")+16,listStr.get(i).toString().indexOf(", Customer_max")));
//			System.out.println(listStr.get(i).toString().substring(listStr.get(i).toString().indexOf("Customer_max")+13,listStr.get(i).toString().indexOf(", Customer_state")));
//		}
//		System.out.println(listStr.get(i).toString().indexOf("Customer_number"));
//		ListIterator<Object> iter = listStr.listIterator();
//		Object first = iter.next();
//		System.out.println(first);
//		System.out.println(list.get(0).keys('a'));
//		System.out.println(list.get(0).get('a'));
//       JSONObject listjson = JSONObject(list.get(0));
//		System.out.println(resultStr);
//		System.out.println(first.Customer_number/first.Customer_max);
//		list.add(list.get(0));
//		list.remove(0);
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
	@RequestMapping("volunteer_private_page")
	public String volunteer_private_page() {
		return "volunteer/volunteer_private_Page";
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
	public void customer_public(@RequestParam Map params,HttpSession session) {
		cusSer.customer_public(params,session);
	}
	
	/**
	 * 助学活动
	 */
	
	 @RequestMapping("/volunteer_zhuxue_page")//从system接受 public String
	 public String volunteer_zhuxue_page() {
		 return "volunteer/volunteer_zhuxue_Page";//页面上的文件名 
	 }
	 @RequestMapping("/customer_yanfa_guanli_page")//从system接受 public String
	 public String customer_yanfa_guanli_page() {
		 return "customer_yanfa_guanli_Page";//页面上的文件名 
	 }
	@RequestMapping("customer_yanfa_list")
	@ResponseBody
	public TableJson customer_yanfa_list(@RequestParam Map params) {
		 int count=cusSer.getYanfaCount(params);
	     List list=cusSer.customer_yanfa_list(params);
		return new TableJson(count, cusSer.customer_yanfa_list(params));
	}
	
	/**
	 * 环保活动
	 */
	 @RequestMapping("/volunteer_huanbao_page")//从system接受 public String
	 public String volunteer_huanbao_page() {
		 return "volunteer/volunteer_huanbao_Page";//页面上的文件名 
	 }
	 @RequestMapping("/customer_shichang_guanli_page")//从system接受 public String
	 public String customer_shichang_guanli_page() {
		 return "customer_shichang_guanli_Page";//页面上的文件名 
	 }
	@RequestMapping("customer_shichang_list")
	@ResponseBody
	public TableJson customer_shichang_list(@RequestParam Map params) {
		 int count=cusSer.getShichangCount(params);
	     List list=cusSer.customer_shichang_list(params);
		return new TableJson(count, cusSer.customer_shichang_list(params));
	}
	/**
	 * 扶贫活动
	 */
	 @RequestMapping("/volunteer_fupin_page")//从system接受 public String
	 public String volunteer_fupin_page() {
		 return "volunteer/volunteer_fupin_Page";//页面上的文件名 
	 }
	 @RequestMapping("/customer_ceshi_guanli_page")//从system接受 public String
	 public String customer_ceshi_guanli_page() {
		 return "customer_ceshi_guanli_Page";//页面上的文件名 
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
	 @RequestMapping("/volunteer_qita_page")//从system接受 public String
	 public String volunteer_qita_page() {
		 return "volunteer/volunteer_qita_Page";//页面上的文件名 
	 }
	 @RequestMapping("/customer_qita_guanli_page")//从system接受 public String
	 public String customer_qita_guanli_page() {
		 return "customer_qita_guanli_Page";//页面上的文件名 
	 }
	@RequestMapping("customer_qita_list")
	@ResponseBody
	public TableJson customer_qita_list(@RequestParam Map params) {
		 int count=cusSer.getQitaCount(params);
	     List list=cusSer.customer_qita_list(params);
		return new TableJson(count, cusSer.customer_qita_list(params));
	}
}
