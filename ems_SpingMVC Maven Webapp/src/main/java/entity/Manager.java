package entity;

import java.io.Serializable;

public class Manager implements Serializable{
	private String username;
	private String password;
	public Manager() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Manager(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	@Override
	public String toString() {
		return "Manager [username=" + username + ", password=" + password + "]";
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
