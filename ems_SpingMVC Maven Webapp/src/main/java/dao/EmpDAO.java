package dao;

import java.util.List;

import entity.Emp;

public interface EmpDAO {
	public List<Emp> queryAllEmp();
	
	public List<Emp> queryByPage(Integer pageNum);
	
	public void insertEmp(Emp emp);
	
	public void deleteOneEmp(Integer id);
	
	public void updateEmp(Emp emp);
	
	public Emp queryOneEmp(Integer id);
}
