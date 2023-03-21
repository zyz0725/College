package dto;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;


public class Sex implements Serializable {
    @JSONField(name = "name")
    private String sex;
    @JSONField(name = "value")
    private Integer count;
	public Sex() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Sex(String sex, Integer count) {
		super();
		this.sex = sex;
		this.count = count;
	}
	@Override
	public String toString() {
		return "Sex [sex=" + sex + ", count=" + count + "]";
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}

    
}
