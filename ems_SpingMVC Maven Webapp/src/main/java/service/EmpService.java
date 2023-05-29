package service;

import java.util.List;

import entity.Emp;

public interface EmpService {
	public List<Emp> showAllEmp();
	
	public void addEmp(Emp emp);
	
	public void dropOneEmp(Integer id);
	
	public Emp showOneEmp(Integer id);
	
	public void updateEmp(Emp emp);
}
