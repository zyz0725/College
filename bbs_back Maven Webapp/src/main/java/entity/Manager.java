package entity;

import java.io.Serializable;

public class Manager implements Serializable {
    private String manager_name;
    private String manager_pwd;
    private String jurisdiction;
	public Manager() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Manager(String manager_name, String manager_pwd, String jurisdiction) {
		super();
		this.manager_name = manager_name;
		this.manager_pwd = manager_pwd;
		this.jurisdiction = jurisdiction;
	}
	@Override
	public String toString() {
		return "Manager [manager_name=" + manager_name + ", manager_pwd="
				+ manager_pwd + ", jurisdiction=" + jurisdiction + "]";
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_pwd() {
		return manager_pwd;
	}
	public void setManager_pwd(String manager_pwd) {
		this.manager_pwd = manager_pwd;
	}
	public String getJurisdiction() {
		return jurisdiction;
	}
	public void setJurisdiction(String jurisdiction) {
		this.jurisdiction = jurisdiction;
	}
	
	
}
