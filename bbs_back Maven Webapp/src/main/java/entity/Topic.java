package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Topic implements Serializable {
	private Integer topic_id;
	private String topic_title;
	private String topic_content;
	@JSONField(format = "yyyy-MM-dd-HH:mm")
	private Date topic_pushtime;
	private String user_name;
	private Integer model_id;
	private Integer topic_sum;
	public Topic() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Topic(Integer topic_id, String topic_title, String topic_content,
			Date topic_pushtime, String user_name, Integer model_id,
			Integer topic_sum) {
		super();
		this.topic_id = topic_id;
		this.topic_title = topic_title;
		this.topic_content = topic_content;
		this.topic_pushtime = topic_pushtime;
		this.user_name = user_name;
		this.model_id = model_id;
		this.topic_sum = topic_sum;
	}
	@Override
	public String toString() {
		return "Topic [topic_id=" + topic_id + ", topic_title=" + topic_title
				+ ", topic_content=" + topic_content + ", topic_pushtime="
				+ topic_pushtime + ", user_name=" + user_name + ", model_id="
				+ model_id + ", topic_sum=" + topic_sum + "]";
	}
	public Integer getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(Integer topic_id) {
		this.topic_id = topic_id;
	}
	public String getTopic_title() {
		return topic_title;
	}
	public void setTopic_title(String topic_title) {
		this.topic_title = topic_title;
	}
	public String getTopic_content() {
		return topic_content;
	}
	public void setTopic_content(String topic_content) {
		this.topic_content = topic_content;
	}
	public String getTopic_pushtime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(topic_pushtime);
	}
	public void setTopic_pushtime(Date topic_pushtime) {
		this.topic_pushtime = topic_pushtime;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Integer getModel_id() {
		return model_id;
	}
	public void setModel_id(Integer model_id) {
		this.model_id = model_id;
	}
	public Integer getTopic_sum() {
		return topic_sum;
	}
	public void setTopic_sum(Integer topic_sum) {
		this.topic_sum = topic_sum;
	}
	
}
