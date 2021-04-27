package com.st.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.service.UserService;

/**
 * û�е�½ʱ�ȿ��Է��ʵ�·��
 * @author dell
 *
 */
@Controller
public class CommonAction_admin {
	@Autowired
	UserService userSer;
	//��ת����¼ҳ��
	@RequestMapping("login_admin")
	public String login_admin() {
		return "login_admin";
	}
	//�����¼--��¼����
	@RequestMapping("admin")
	public String admin(@RequestParam Map params,HttpSession session) {
		boolean b=userSer.login_admin(params,session);
		if(b) {
			return "system_admin";
		}else {
			return "login_admin";
		}
	}
}
