package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ManagerService;
import util.CreateValidateCode;
import entity.Manager;

@Controller
@Scope("prototype")
@RequestMapping("/manager")
public class ManagerControl {
	private ManagerService managerService;
	public ManagerService getManagerService() {
		return managerService;
	}
	@Autowired
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@RequestMapping("/register")
	public String register(Manager manager){
		managerService.register(manager);
		return "redirect:/emp/showAllEmp.do";
	}
	
	@RequestMapping("/ImageAction")
	public String image(HttpSession session,HttpServletResponse response) throws Exception{
		//1.获得随机数
		CreateValidateCode cvc = new CreateValidateCode();
		String code = cvc.getCode();			
		//2.将code随机数存入session作用域\
		session.setAttribute("#session.code",code);
		System.out.println(code);
		//3.将随机数以图片形式输出到浏览器，使用工具类的write方法
		cvc.write( response.getOutputStream() );		
		return null;
	}
	
	@RequestMapping("/login")
	public String login(String username,String password,String vcode,HttpSession session){
		String code = (String) session.getAttribute("#session.code");
		if(managerService.showOneManager(username, password)){
			if( code.equals(vcode)){
				session.setAttribute("#session.user", username);
				return "redirect:/emp/showAllEmp.do";
			}
		}
		return "errorView";
	}
}
