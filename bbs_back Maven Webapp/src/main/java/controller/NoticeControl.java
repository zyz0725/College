package controller;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.NoticeService;
import entity.Notice;

@Controller
@Scope("prototype")
@RequestMapping("/notice")
public class NoticeControl {
	private NoticeService noticeService;
	public NoticeService getNoticeService() {
		return noticeService;
	}
	@Autowired
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	@RequestMapping("/showNotices")
    public @ResponseBody
    List<Notice> showNotices(){
        List<Notice> notices = noticeService.selectAllNotices();
        
        return notices;
    }
	@RequestMapping("/remove")
    public @ResponseBody String removeNotice(Integer notice_id){
        noticeService.removeNotice(notice_id);
        return "success";
    }
	@RequestMapping("/updateNoticeDetail")
    public void updatePageDetail(Integer notice_id,String notice_title,String notice_content){
		Notice notice = new Notice(notice_id,notice_title,notice_content,new Date());
        noticeService.updateNotice(notice);
    }
	@RequestMapping("/addNotice")
    public String addNotice(String notice_title,String notice_content){
		Notice notice = new Notice(null,notice_title,notice_content,new Date());
        noticeService.insertNotice(notice);
        return "redirect:/main/main.jsp";
    }
}



