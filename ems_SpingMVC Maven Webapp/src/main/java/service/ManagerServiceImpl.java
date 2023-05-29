package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import util.Md5Util;
import dao.ManagerDAO;
import entity.Manager;
@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {
	private ManagerDAO managerDAO;
	public ManagerDAO getManagerDAO() {
		return managerDAO;
	}
	@Autowired
	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Boolean showOneManager(String username,String password) {
		Manager mdao = managerDAO.login(username);
		System.out.println(mdao);
		if(mdao!=null){
			if(Md5Util.checkPassword(password,mdao.getPassword())){
				return true;
			}
		}
		return false;
	}

	@Override
	public void register(Manager manager) {
		String md5pwd = Md5Util.encryption(manager.getPassword());
		manager.setPassword(md5pwd);
		System.out.println(manager+"----------------------------");
		managerDAO.register(manager);
	}
	
}
