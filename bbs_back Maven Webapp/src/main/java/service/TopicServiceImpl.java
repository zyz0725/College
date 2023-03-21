package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.PostDAO;
import dao.ReplyDAO;
import dao.TopicDAO;
import dto.PageBean;
import entity.Topic;

@Service
@Transactional
public class TopicServiceImpl implements TopicService {
	private TopicDAO topicDAO;
	private PostDAO postDAO;
	private ReplyDAO replyDAO;
	public ReplyDAO getReplyDAO() {
		return replyDAO;
	}
	@Autowired
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	public TopicDAO getTopicDAO() {
		return topicDAO;
	}
	@Autowired
	public void setTopicDAO(TopicDAO topicDAO) {
		this.topicDAO = topicDAO;
	}
	public PostDAO getPostDAO() {
		return postDAO;
	}
	@Autowired
	public void setPostDAO(PostDAO postDAO) {
		this.postDAO = postDAO;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
	public List<Topic> queryTopicsByPage(PageBean pageBean) {
		List<Topic> topics = topicDAO.queryTopicsByPage(pageBean);
		pageBean.setTotal(topicDAO.queryAllTopics().size());
		for (Topic topic : topics) {
			topic.setTopic_sum(postDAO.countAllPosts(topic.getTopic_id()));
			System.out.println(topic);
		}
		System.out.println(pageBean+"++++++++++++++------******");
		return topics;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
	public Integer countAllTopics(Integer model_id) {
		return topicDAO.countAllTopics(model_id);
	}
	@Override
	public void removeTopic(Integer topic_id) {
		replyDAO.deleteByTopic(topic_id);
		postDAO.deletePostByTopic(topic_id);
		topicDAO.removeTopic(topic_id);
	}

	@Override
	public List<Topic> queryAllTopics() {
		return topicDAO.queryAllTopics();
	}

}
