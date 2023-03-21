package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import service.TopicService;
import dto.PageBean;
import entity.Model;
import entity.Topic;
import entity.User;

@Controller
@Scope("prototype")
@RequestMapping("/topic")
public class TopicControl {
	private TopicService topicService;
	public TopicService getTopicService() {
		return topicService;
	}
	@Autowired
	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}
	@RequestMapping("/showTopicsByPage")
	public @ResponseBody Map queryTopicsByPage(PageBean pageBean){
        List<Topic> topics = topicService.queryTopicsByPage(pageBean);
        Map m = new HashMap();
        m.put("total", pageBean.getTotal());
        m.put("rows", topics);
        return m;
    }
	
	@RequestMapping("/removeTopic")
	@ResponseBody
	public void removeTopic(Integer topic_id){
		topicService.removeTopic(topic_id);
	}
}
