package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.dao.UserDao;
import com.st.util.ParamsUtil;
@Service
public class UserService {
	@Autowired
	UserDao user_dao;
	
	public void test() {
		List list=user_dao.test();
		for(Object obj:list) {
			System.out.println(obj);
		}
	}
	public List user_list(Map params) {
		//计算出每页要显示的数据开始的下标，保存到params中
		ParamsUtil.page(params);
		return user_dao.user_list(params);
	}
	public int getCount(Map params) {
		return user_dao.getCount(params);
	}
	public void user_del(Map params) {
		user_dao.user_del(params);
	}
	public void user_save(Map params) {
		ParamsUtil.uuid(params);
		ParamsUtil.initpass(params);
		user_dao.user_save(params);
	}
	public void user_update(Map params) {
		user_dao.user_update(params);
	}
	public void user_del_more(Map params) {
		//要执行删除
		//in('','','')
		//参数
		ParamsUtil.arr_str(params,"userids");
		user_dao.user_del_more(params);
	}
	/**
	 * 登录
	 */
	public boolean login(Map params,HttpSession session) {
		//根据用户名查询数据表中是否有该用户的信息
		// list代表数据库中查询到的信息
		List list=user_dao.user_login(params);
		if(list!=null&&list.size()==1) {
			Map user=(Map)list.get(0);
			//有，匹配密码是否正确     
			if(params.get("login_pass").equals(((Map)(list.get(0))).get("User_loginpass"))){
				//正确--登录成功	
				session.setAttribute("loginuser", user);
				return true;
			}
		}
		return false;
		//没有，密码不正确
	}
	public boolean login_guanli(Map params,HttpSession session) {
		//根据用户名查询数据表中是否有该用户的信息
		// list代表数据库中查询到的信息
		List list=user_dao.user_login_guanli(params);
		if(list!=null&&list.size()==1) {
			Map user=(Map)list.get(0);
			//有，匹配密码是否正确     
			if(params.get("login_pass").equals(((Map)(list.get(0))).get("User_loginpass"))){
				//正确--登录成功	
				session.setAttribute("loginuserguanli", user);
				return true;
			}
		}
		return false;
		//没有，密码不正确
	}
}
