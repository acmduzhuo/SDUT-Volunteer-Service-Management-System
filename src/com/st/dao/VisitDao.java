package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface VisitDao {
	void visit_save(Map params);
	/**
	 * �ط���־
	 */
	List visitlog_list(Map params);
	//����
	List total_sales();
}
