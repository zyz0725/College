package dao;

import java.util.List;

import dto.PageBean;
import entity.Topic;

public interface TopicDAO {
	
	public List<Topic> queryTopicsByPage(PageBean pageBean);
	
	public List<Topic> queryAllTopics();
	
	public Integer countAllTopics(Integer model_id);
	
	public void removeTopic(Integer topic_id);
	
	public void removeTopics(Integer model_id);
}
