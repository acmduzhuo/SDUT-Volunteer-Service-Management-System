package com.st.util;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

public class ParamsUtil {
	public static void page(Map params) {
		int page = Integer.parseInt(params.get("page").toString());
		int limit = Integer.parseInt(params.get("limit").toString());
		int start = (page - 1)*limit;
		params.put("start", start);
	}
	public static void uuid(Map params) {
		UUID uuid=UUID.randomUUID();
		params.put("uuid", uuid.toString());
	}
	/*
	 * 向params中添加默认密码，属性名为User_loginpass
	 */
	public static String initpass(Map params) {
		String pass="123456";
		params.put("user_loginpass",pass);
		return pass;
	}
	/*
	 * 将字符串变为'A','B'格式方便sql使用
	 */
	public static void arr_str(Map params,Object key) {
		String arr_str = params.get(key) +"";
		arr_str = arr_str.substring(0,arr_str.length()-1);
		arr_str = arr_str.replaceAll(",", "','");
		arr_str="'"+arr_str+"'";
		params.put(key, arr_str);
		System.out.println(params.get(key));
	}
	
	public static void state(Map params,int state) {
		params.put("state", state);
	}
	public static void loginUserID(Map params, HttpSession session) {
		Map user=(Map)session.getAttribute("loginuser");
		String loginUserID=user.get("User_id")+"";
		params.put("loginUserID", loginUserID);
	}
	public static void payment(Map params) {
		String payment=params.get("visit_payment")+"";
		params.put("visit_payment","on".equals(payment)?1:0);
	}
}
