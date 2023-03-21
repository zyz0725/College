package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Reply implements Serializable {
	@JSONField(name="post_id")
	private Integer reply_id;
	@JSONField(name="post_content")
	private String reply_content;
	@JSONField(format = "yyyy-MM-dd HH:mm",name="post_pushtime")
	private Date reply_time;
	private String user_name;
	@JSONField(name="topic_id")
	private Integer post_id;
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reply(Integer reply_id, String reply_content, Date reply_time,
			String user_name, Integer post_id) {
		super();
		this.reply_id = reply_id;
		this.reply_content = reply_content;
		this.reply_time = reply_time;
		this.user_name = user_name;
		this.post_id = post_id;
	}
	@Override
	public String toString() {
		return "Reply [reply_id=" + reply_id + ", reply_content="
				+ reply_content + ", reply_time=" + reply_time + ", user_name="
				+ user_name + ", post_id=" + post_id + "]";
	}
	public Integer getReply_id() {
		return reply_id;
	}
	public void setReply_id(Integer reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_time() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(reply_time);
	}
	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Integer getPost_id() {
		return post_id;
	}
	public void setPost_id(Integer post_id) {
		this.post_id = post_id;
	}
	
}
