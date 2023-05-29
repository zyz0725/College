package entity;

import java.io.Serializable;

public class Dept implements Serializable {
	private Integer did;
	private String deptname;
	public Dept() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dept(Integer did, String deptname) {
		super();
		this.did = did;
		this.deptname = deptname;
	}
	@Override
	public String toString() {
		return "Dept [did=" + did + ", deptname=" + deptname + "]";
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	
}
