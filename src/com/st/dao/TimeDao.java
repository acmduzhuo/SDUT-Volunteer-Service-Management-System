package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface TimeDao {

	List test();
	
	List time_list(Map params);
	
	int getCount(Map params);
	
	void time_del(Map params);
	
	void time_save(Map params);
	
	void time_update(Map params);
	
	void time_del_more(Map params);
}
