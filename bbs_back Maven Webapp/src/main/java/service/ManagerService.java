package service;

import java.util.List;

import annotation.Log;
import dto.PageBean;
import entity.Manager;

public interface ManagerService {
	public Manager queryOneManager(String username);
	
	public List<Manager> queryManagerByPage(PageBean pageBean);
	@Log(desc = "超级管理员更新管理员信息")
	public void updateManagerDetail(Manager manager);
	@Log(desc = "新增普通管理员")
	public void insertManager(Manager manager);
	@Log(desc = "超级管理员删除了管理员信息")
	public void removeManagerDetail(String manager_name);
}
