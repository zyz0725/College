package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.DeptService;
import service.EmpService;
import entity.Dept;
import entity.Emp;

@Controller
@Scope("prototype")
@RequestMapping("/emp")
public class EmpControl {
	private EmpService empService;
	private DeptService deptService;
	public DeptService getDeptService() {
		return deptService;
	}
	@Autowired
	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}
	public EmpService getEmpService() {
		return empService;
	}
	@Autowired
	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}
	
	@RequestMapping("/addEmp")
	public String addEmp(Emp emp,Integer did){
		emp.setDept(deptService.showOneDept(did));
		empService.addEmp(emp);
		return "redirect:/emp/showAllEmp.do";	
	}
	
	@RequestMapping("/dropOneEmp")
	public String dropOne(Integer id){
		empService.dropOneEmp(id);
		return "redirect:/emp/showAllEmp.do";
	}
	
	@RequestMapping("/queryOneEmp")
	public String queryOneEmp(Integer id,HttpServletRequest request){
		Emp emp = empService.showOneEmp(id);
		request.setAttribute("emp", emp);
		return "view/updateEmp";
	}
	
	@RequestMapping("/showAllEmp")
	public String queryAllEmp(HttpServletRequest request){
		List<Emp> emps = empService.showAllEmp();
		request.setAttribute("list", emps);
		return "view/showAllEmp";
	}
	
	@RequestMapping("/updateEmp")
	public String updateEmp(Emp emp,Integer did){
		Dept dept = deptService.showOneDept(did);
		emp.setDept(dept);
		empService.updateEmp(emp);
		System.out.println(emp+"---------------------------------------------");
		return "redirect:/emp/showAllEmp.do";
	}
}
