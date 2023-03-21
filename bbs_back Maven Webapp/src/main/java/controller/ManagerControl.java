package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;






import org.springframework.web.bind.annotation.ResponseBody;

import dto.PageBean;
import entity.Manager;
import entity.Notice;
import entity.User;
import service.ManagerService;
import util.CreateValidateCode;

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
	
	@RequestMapping("/showManagerByPage")
    public @ResponseBody
    Map queryManagers(PageBean pageBean){
        List<Manager> managers = managerService.queryManagerByPage(pageBean);
        Map m = new HashMap();
        m.put("total", pageBean.getTotal());
        m.put("rows", managers);
        return m;
    }
	@RequestMapping("/ImageAction")
	public String image(HttpSession session,HttpServletResponse response) throws Exception{
		//1.获得随机数
		CreateValidateCode cvc = new CreateValidateCode();
		String code = cvc.getCode();			
		//2.将code随机数存入session作用域\
		session.setAttribute("code",code);
		System.out.println(code);
		//3.将随机数以图片形式输出到浏览器，使用工具类的write方法
		cvc.write( response.getOutputStream() );		
		return null;
	}
	
	@RequestMapping("/codeEquals")
	public @ResponseBody String codeEquals(HttpSession session,String code) throws Exception{
		String correctCode = (String) session.getAttribute("code");	
		System.out.println(correctCode+"---*-*-*-*--*--*-*-*-*-");
		if(code.equalsIgnoreCase(correctCode)){
			return "true";
		}
		return "error";
	}

	@RequestMapping("/login")
	public String queryOneManager(Manager manager,HttpSession session){
		session.removeAttribute("error");
		Manager dbManager = managerService.queryOneManager(manager.getManager_name());
		if(manager.getManager_pwd().equals(dbManager.getManager_pwd())){
			session.setAttribute("manager",dbManager);       		
			return "redirect:/main/main.jsp";
		}else{
			session.setAttribute("error","输入有误"); 
			return "redirect:/login.jsp";
		}
	}
	@RequestMapping("/exit")
	public String exitLogin(HttpSession session){
		session.removeAttribute("manager");       		
		return "redirect:/login.jsp";
	}
	@RequestMapping("/updateManagerDetail")
    public void updateManagerDetail(String manager_name,String manager_pwd,String jurisdiction){
		Manager ma = new Manager(manager_name,manager_pwd,jurisdiction);
		System.out.println(ma);
		managerService.updateManagerDetail(ma);
    }
	@RequestMapping("/inserNewtManager")
    public void inserNewtManager(String manager_name,String manager_pwd){
		Manager manager = new Manager(manager_name,manager_pwd,null);
        managerService.insertManager(manager);
        //return "redirect:/main/main.jsp";
    }
	@RequestMapping("/remove")
    public @ResponseBody String removeManager(String manager_name){
        managerService.removeManagerDetail(manager_name);
        return "success";
    }
}


