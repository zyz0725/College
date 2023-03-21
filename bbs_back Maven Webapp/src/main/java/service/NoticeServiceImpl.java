package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.NoticeDAO;
import entity.Notice;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	private NoticeDAO noticeDAO;
	public NoticeDAO getNoticeDAO() {
		return noticeDAO;
	}
	@Autowired
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
	public List<Notice> selectAllNotices() {
		// TODO Auto-generated method stub
		return noticeDAO.queryAllNotices();
	}
	@Override
	public void removeNotice(Integer notice_id) {
		noticeDAO.delete(notice_id);
	}
	@Override
	public void updateNotice(Notice notice) {
		noticeDAO.uodateNotice(notice);
	}
	@Override
	public void insertNotice(Notice notice) {
		noticeDAO.addNotice(notice);
	}

}
