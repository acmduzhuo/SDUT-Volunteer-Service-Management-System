package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.dao.GuanliDao;
import com.st.dao.UserDao;
import com.st.util.ParamsUtil;
@Service
public class GuanliService {
	@Autowired
	GuanliDao guanli_dao;
	
	public void test() {
		List list=guanli_dao.test();
		for(Object obj:list) {
			System.out.println(obj);
		}
	}
	public List guanli_list(Map params) {
		//�����ÿҳҪ��ʾ�����ݿ�ʼ���±꣬���浽params��
		ParamsUtil.page(params);
		return guanli_dao.guanli_list(params);
	}
	public int getCount(Map params) {
		return guanli_dao.getCount(params);
	}
	public void guanli_del(Map params) {
		guanli_dao.guanli_del(params);
	}
	public void guanli_save(Map params) {
		ParamsUtil.uuid(params);
		ParamsUtil.initpass(params);
		guanli_dao.guanli_save(params);
	}
	public void guanli_update(Map params) {
		guanli_dao.guanli_update(params);
	}
	public void guanli_del_more(Map params) {
		//Ҫִ��ɾ��
		//in('','','')
		//����
		ParamsUtil.arr_str(params,"guanliids");
		guanli_dao.guanli_del_more(params);
	}
}
