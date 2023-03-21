package dao;

import java.util.List;

import dto.PageBean;
import entity.Manager;

public interface ManagerDAO {
	Manager selectOneManager(String manager_name);
	
	List<Manager> selectManagerByPage(PageBean pageBean);
	
	List<Manager> selectAllManagers();
	
	void updateDetail(Manager manager);
	
	void insertManager(Manager manager);
	
	void deleteManager(String manager_name);
}
