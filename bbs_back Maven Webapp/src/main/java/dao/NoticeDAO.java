package dao;

import java.util.List;

import entity.Notice;

public interface NoticeDAO {
	List<Notice> queryAllNotices();
	void delete(Integer notice_id);
	void uodateNotice(Notice notice);
	void addNotice(Notice notice);
}
