package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Notice implements Serializable {
	private Integer notice_id;
	private String notice_title;
	private String notice_content;
	@JSONField(format = "yyyy-MM-dd")
	private Date notice_time;
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(Integer notice_id, String notice_title,
			String notice_content, Date notice_time) {
		super();
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_time = notice_time;
	}
	@Override
	public String toString() {
		return "Notice [notice_id=" + notice_id + ", notice_title="
				+ notice_title + ", notice_content=" + notice_content
				+ ", notice_time=" + notice_time + "]";
	}
	public Integer getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(Integer notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_time() {
		return notice_time;
	}
	public void setNotice_time(Date notice_time) {
		this.notice_time = notice_time;
	}
	
	
}
