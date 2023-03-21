package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

public class Post implements Serializable {
	private Integer post_id;
	@JSONField(format = "yyyy-MM-dd HH:mm")
	private Date post_pushtime;
	private String post_content;
	private String user_name;
	private Integer topic_id;
	private Integer zan;
	public Integer getZan() {
		return zan;
	}
	public void setZan(Integer zan) {
		this.zan = zan;
	}
	@JSONField(name="children")
	private List<Reply> replys;
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Post(Integer post_id, Date post_pushtime, String post_content,
			String user_name, Integer topic_id, Integer zan, List<Reply> replys) {
		super();
		this.post_id = post_id;
		this.post_pushtime = post_pushtime;
		this.post_content = post_content;
		this.user_name = user_name;
		this.topic_id = topic_id;
		this.zan = zan;
		this.replys = replys;
	}
	@Override
	public String toString() {
		return "Post [post_id=" + post_id + ", post_pushtime=" + post_pushtime
				+ ", post_content=" + post_content + ", user_name=" + user_name
				+ ", topic_id=" + topic_id + ",zan=" + zan + ", replys=" + replys + "]";
	}
	public Integer getPost_id() {
		return post_id;
	}
	public void setPost_id(Integer post_id) {
		this.post_id = post_id;
	}
	public String getPost_pushtime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(post_pushtime);
	}
	public void setPost_pushtime(Date post_pushtime) {
		this.post_pushtime = post_pushtime;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Integer getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(Integer topic_id) {
		this.topic_id = topic_id;
	}
	public List<Reply> getReplys() {
		return replys;
	}
	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}
	
}
