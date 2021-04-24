package com.st.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.dao.VisitDao;
import com.st.util.ParamsUtil;

@Service
public class VisitService {
	@Autowired
	VisitDao visitDao;
	public void visit_save(Map params,HttpSession session) {
		ParamsUtil.uuid(params);
		ParamsUtil.loginUserID(params, session);
		ParamsUtil.payment(params);
		visitDao.visit_save(params);
	}
	/*
	 * 回访日志
	 */
	public List visitlog_list(Map params) {
		return visitDao.visitlog_list(params);
	}
	/**
	 * 报表
	 */
	public Map total_sales() {
		List list=visitDao.total_sales();
		Map map=new HashMap();
		List username_list=new ArrayList();
		List money_list=new ArrayList();
		Map temp=null;
		for(int i=0;i<list.size();i++) {
			temp=(Map)list.get(i);
			username_list.add(temp.get("User_realname"));
			money_list.add(temp.get("money"));
		}
		map.put("name", username_list);
		map.put("money", money_list);
		return map;
	}
}
