package dao;

import java.util.List;

import entity.Dept;

public interface DeptDAO {
	public List<Dept> selectAllDept();
	
	public Dept selectOneDept(Integer did);
}
