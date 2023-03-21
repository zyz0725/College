package service;

import java.util.List;

import annotation.Log;
import entity.Notice;

public interface NoticeService {
	
	public List<Notice> selectAllNotices();
	@Log(desc = "删除公告")
	public void removeNotice(Integer notice_id);
	@Log(desc = "修改公告")
	public void updateNotice(Notice notice);
	@Log(desc = "发布公告")
	public void insertNotice(Notice notice);
}
