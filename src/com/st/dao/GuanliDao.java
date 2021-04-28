package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface GuanliDao {

	List test();
	
	List guanli_list(Map params);
	
	int getCount(Map params);
	
	void guanli_del(Map params);
	
	void guanli_save(Map params);
	
	void guanli_update(Map params);
	
	void guanli_del_more(Map params);
}
