package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import service.UserService;
import util.CreateValidateCode;
import util.POIUtil;
import dto.China;
import dto.PageBean;
import dto.Sex;
import entity.User;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class UserControl {
    private UserService userService;
    public UserService getUserService() {
        return userService;
    }
    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/isOrNot")
    public @ResponseBody
    String isOrNot(String user_name){
        User user = userService.queryOneUser(user_name);
        if(user == null){
        	return "true";
        	}
        return "false";
    }
    @RequestMapping("/removeSuccess")
    public @ResponseBody
    String removeSuccess(HttpSession session){
        session.removeAttribute("success");
        return "ok";
    }
    @RequestMapping("/update")
    @ResponseBody void update(User user){
       System.out.println(user);
       userService.update(user);
    }
    @RequestMapping("/addUser")
	public String addUser(User user,HttpSession session){
    	List<User> users = new ArrayList<User>();
    	user.setRegister_time(new Date());
    	user.setLast_time(new Date());	
    	users.add(user);
    	userService.insertUsers(users);
    	session.setAttribute("success", "success");
    	return "redirect:/main/main.jsp";
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
    
    @RequestMapping("/showUsersByPage")
    public @ResponseBody
    Map queryUsers(PageBean pageBean){
        List<User> users = userService.queryUsersByPage(pageBean);
        Map m = new HashMap();
        m.put("total", pageBean.getTotal());
        m.put("rows", users);
        return m;
    }

    @RequestMapping("/exportAll")
    @ResponseBody
    public void exportAllUsers(HttpServletResponse response) {
        List<User> users = userService.queryAllUsers();
        try {
            POIUtil.exportAll(users,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping("/exportTitle")
    @ResponseBody
    public void exportMudule(HttpServletResponse response){
        try{
        POIUtil.exportTitle(response);
        }catch (Exception e){
            e.getStackTrace();
        }
    }

    @RequestMapping("/importUses")
    @ResponseBody
    public void importUses(MultipartFile excel){
        List<User> users = null;
        try{
            users = POIUtil.importUsers(excel);
            System.out.println(users);
            userService.insertUsers(users);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping("/mans")
    @ResponseBody List<China> showAllMans(){
        return userService.queryMans();
    }

    @RequestMapping("/women")
    @ResponseBody List<China> showAllWomen(){
        return userService.queryWomen();
    }
    @RequestMapping("/sex")
    @ResponseBody List<Sex> showAllSex(){
       /* List<Sex> sexes = new ArrayList<Sex>();
        sexes.add(new Sex("女",userService.queryWomen().size()));
        sexes.add(new Sex("男",userService.queryMans().size()));*/
    	return userService.querySexes();
    }
    
}
