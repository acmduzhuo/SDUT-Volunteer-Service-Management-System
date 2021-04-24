package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public interface CustomerDao {
	int getCount(Map params);
	List customer_list(Map params);
	void customer_save(Map params);
	void customer_del_more(Map params);
	void customer_update(Map params);
	void customer_del(Map params);
	/**
	 * 
	 * 公海客户
	 * @return
	 */
	int getPublicCount(Map params);
    List customer_public_list(Map params);
    void customer_private(Map params);
    /**
        * 跟单客户
     * @param params
     * @return
     */
    int getPrivateCount(Map params);
    List customer_private_list(Map params);
    void customer_public(Map params);
    /**
     * 研发部门
     */
	 int getYanfaCount(Map params); 
	 List customer_yanfa_list(Map params);
	 /**
	 * 研发部门
	 */
	 int getShichangCount(Map params); 
	 List customer_shichang_list(Map params);
	 /**
	 * 测试部门
	 */
	 int getCeshiCount(Map params); 
	 List customer_ceshi_list(Map params);
	 /**
	 * 其他部门
	 */
	 int getQitaCount(Map params); 
	 List customer_qita_list(Map params);
}
