package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public interface UserDao {

	List test();
	
	List user_list(Map params);
	
	int getCount(Map params);
	
	void user_del(Map params);
	
	void user_save(Map params);
	
	void user_update(Map params);
	
	void user_del_more(Map params);
	
	/**
	 * µÇÂ¼
	 */
	List user_login(Map params);
	List user_login_guanli(Map params);
}
