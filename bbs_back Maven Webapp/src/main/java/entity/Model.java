package entity;

import java.io.Serializable;
import java.util.List;

public class Model implements Serializable {
	private Integer model_id;
	private String model_name;
	private String model_desc;
	private String model_img;
	public Model() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Model(Integer model_id, String model_name, String model_desc,
			String model_img) {
		super();
		this.model_id = model_id;
		this.model_name = model_name;
		this.model_desc = model_desc;
		this.model_img = model_img;
	}
	@Override
	public String toString() {
		return "Model [model_id=" + model_id + ", model_name=" + model_name
				+ ", model_desc=" + model_desc + ", model_img=" + model_img
				+ "]";
	}
	public Integer getModel_id() {
		return model_id;
	}
	public void setModel_id(Integer model_id) {
		this.model_id = model_id;
	}
	public String getModel_name() {
		return model_name;
	}
	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}
	public String getModel_desc() {
		return model_desc;
	}
	public void setModel_desc(String model_desc) {
		this.model_desc = model_desc;
	}
	public String getModel_img() {
		return model_img;
	}
	public void setModel_img(String model_img) {
		this.model_img = model_img;
	}
	
}
