package service;

import entity.Manager;

public interface ManagerService {
	public Boolean showOneManager(String username,String password);
	
	public void register(Manager manager);
}
