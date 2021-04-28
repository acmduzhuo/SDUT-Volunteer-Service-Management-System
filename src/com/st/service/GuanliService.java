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
		//计算出每页要显示的数据开始的下标，保存到params中
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
		//要执行删除
		//in('','','')
		//参数
		ParamsUtil.arr_str(params,"guanliids");
		guanli_dao.guanli_del_more(params);
	}
}
