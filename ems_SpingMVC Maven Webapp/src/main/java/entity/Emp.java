package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Emp implements Serializable {
	private Integer id;
	private String name;
	private Double salary;
	private String married;
	private Dept dept;
	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp(Integer id, String name, Double salary, String married, Dept dept) {
		super();
		this.id = id;
		this.name = name;
		this.salary = salary;
		this.married = married;
		this.dept = dept;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public String getMarried() {
		if(married.equals("0")){
			return "已婚";
		}
		else return "未婚";
	}
	public String getMarried01() {
		return married;
	}
	public void setMarried(String married) {
		this.married = married;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	@Override
	public String toString() {
		return "Emp [id=" + id + ", name=" + name + ", salary=" + salary
				+ ", married=" + married + ", dept=" + dept + "]";
	}
	
}
