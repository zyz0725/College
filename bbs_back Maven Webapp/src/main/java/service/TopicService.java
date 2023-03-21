package service;

import java.util.List;

import annotation.Log;
import dto.PageBean;
import entity.Topic;

public interface TopicService {
	
	public List<Topic> queryTopicsByPage(PageBean pb);
	
	public List<Topic> queryAllTopics();
	public Integer countAllTopics(Integer model_id);
	@Log(desc = "删除话题")
	public void removeTopic(Integer topic_id);
}
