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
		//�����ÿҳҪ��ʾ�����ݿ�ʼ���±꣬���浽params��
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
		//Ҫִ��ɾ��
		//in('','','')
		//����
		ParamsUtil.arr_str(params,"userids");
		user_dao.user_del_more(params);
	}
	/**
	 * ��¼
	 */
	public boolean login(Map params,HttpSession session) {
		//�����û�����ѯ���ݱ����Ƿ��и��û�����Ϣ
		// list�������ݿ��в�ѯ������Ϣ
		List list=user_dao.user_login(params);
		if(list!=null&&list.size()==1) {
			Map user=(Map)list.get(0);
			//�У�ƥ�������Ƿ���ȷ     
			if(params.get("login_pass").equals(((Map)(list.get(0))).get("User_loginpass"))){
				//��ȷ--��¼�ɹ�	
				session.setAttribute("loginuser", user);
				return true;
			}
		}
		return false;
		//û�У����벻��ȷ
	}
	public boolean login_guanli(Map params,HttpSession session) {
		//�����û�����ѯ���ݱ����Ƿ��и��û�����Ϣ
		// list�������ݿ��в�ѯ������Ϣ
		List list=user_dao.user_login_guanli(params);
		if(list!=null&&list.size()==1) {
			Map user=(Map)list.get(0);
			//�У�ƥ�������Ƿ���ȷ     
			if(params.get("login_pass").equals(((Map)(list.get(0))).get("User_loginpass"))){
				//��ȷ--��¼�ɹ�	
				session.setAttribute("loginuserguanli", user);
				return true;
			}
		}
		return false;
		//û�У����벻��ȷ
	}
}
