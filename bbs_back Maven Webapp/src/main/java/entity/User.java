package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class User implements Serializable {
	private String user_name;
	private String user_pwd;
	private String qq;
	private String province;
	private String city;
	private String sex;
	@JSONField(format = "yyyy-MM-dd")
	private Date register_time;
	@JSONField(format = "yyyy-MM-dd")
	private Date last_time;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String user_name, String user_pwd, String qq,
			String province, String city, String sex, Date register_time,
			Date last_time) {
		super();
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.qq = qq;
		this.province = province;
		this.city = city;
		this.sex = sex;
		this.register_time = register_time;
		this.last_time = last_time;
	}
	@Override
	public String toString() {
		return "User [user_name=" + user_name + ", user_pwd=" + user_pwd
				+ ", qq=" + qq + ", province="
				+ province + ", city=" + city + ", sex=" + sex
				+ ", register_time=" + register_time + ", last_time="
				+ last_time + "]";
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRegister_time() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(register_time);
	}
	public void setRegister_time(Date register_time) {
		this.register_time = register_time;
	}
	public String getLast_time() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(last_time);
	}
	public void setLast_time(Date last_time) {
		this.last_time = last_time;
	}
	
}
