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
public class CommonAction {
	@Autowired
	UserService userSer;
	//��ת����¼ҳ��
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	//�����¼--��¼����
	@RequestMapping("loginaction")
	public String logincation(@RequestParam Map params,HttpSession session) {
		boolean b=userSer.login(params,session);
		System.out.println("�û�"+b);
		if(b) {
			return "system";
		}else {
			return "login";
		}
	}
}
