package service;

import java.util.List;

import entity.Dept;

public interface DeptService {
	public List<Dept> showAllDept();
	
	public Dept showOneDept(Integer did);
}
