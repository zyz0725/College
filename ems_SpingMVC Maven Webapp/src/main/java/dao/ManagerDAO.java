package dao;

import entity.Manager;

public interface ManagerDAO {
	
	public void register(Manager manager);
	
	public Manager login(String username);
}
