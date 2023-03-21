package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.ManagerDAO;
import dto.PageBean;
import entity.Manager;

@Service
@Transactional
public class ManagerServiceImpl implements ManagerService{
	private ManagerDAO managerDAO;
	public ManagerDAO getManagerDAO() {
		return managerDAO;
	}
	@Autowired
	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}
	@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
	@Override
	public Manager queryOneManager(String username) {
		return managerDAO.selectOneManager(username);
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
	public List<Manager> queryManagerByPage(PageBean pageBean) {
		pageBean.setTotal(managerDAO.selectAllManagers().size());
		return managerDAO.selectManagerByPage(pageBean);
	}
	@Override
	public void updateManagerDetail(Manager manager) {
		managerDAO.updateDetail(manager);
	}
	@Override
	public void insertManager(Manager manager) {
		managerDAO.insertManager(manager);
	}
	@Override
	public void removeManagerDetail(String manager_name) {
		managerDAO.deleteManager(manager_name);
	}

}
