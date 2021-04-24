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
public class CommonAction_guanli {
	@Autowired
	UserService userSer;
	//��ת����¼ҳ��
	@RequestMapping("login_guanli")
	public String login_guanli() {
		return "login_guanli";
	}
	//�����¼--��¼����
	@RequestMapping("guanli")
	public String guanli(@RequestParam Map params,HttpSession session) {
		boolean b=userSer.login_guanli(params,session);
		System.out.println("����"+b);
		if(b) {
			return "system_guanli";
		}else {
			return "login_guanli";
		}
	}
}
