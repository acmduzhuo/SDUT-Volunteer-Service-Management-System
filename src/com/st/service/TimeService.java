package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.dao.GuanliDao;
import com.st.dao.TimeDao;
import com.st.dao.UserDao;
import com.st.util.ParamsUtil;
@Service
public class TimeService {
	@Autowired
	TimeDao time_dao;
	
	public void test() {
		List list=time_dao.test();
	}
	public List time_list(Map params) {
		//计算出每页要显示的数据开始的下标，保存到params中
		ParamsUtil.page(params);
		return time_dao.time_list(params);
	}
	public int getCount(Map params) {
		return time_dao.getCount(params);
	}
	public void time_del(Map params) {
		time_dao.time_del(params);
	}
	public void time_save(Map params) {
		ParamsUtil.uuid(params);
		time_dao.time_save(params);
	}
	public void time_update(Map params) {
		time_dao.time_update(params);
	}
	public void time_del_more(Map params) {
		ParamsUtil.arr_str(params,"timeids");
		time_dao.time_del_more(params);
	}
}
