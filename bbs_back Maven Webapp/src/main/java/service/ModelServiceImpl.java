package service;

import java.util.List;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.ModelDAO;
import dao.PostDAO;
import dao.ReplyDAO;
import dao.TopicDAO;
import entity.Model;
@Service
@Transactional
public class ModelServiceImpl implements ModelService {
	private ModelDAO modelDAO;
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
	public PostDAO getPostDAO() {
		return postDAO;
	}
	@Autowired
	public void setPostDAO(PostDAO postDAO) {
		this.postDAO = postDAO;
	}
	public TopicDAO getTopicDAO() {
		return topicDAO;
	}
	@Autowired
	public void setTopicDAO(TopicDAO topicDAO) {
		this.topicDAO = topicDAO;
	}
	public ModelDAO getModelDAO() {
		return modelDAO;
	}
	@Autowired
	public void setModelDAO(ModelDAO modelDAO) {
		this.modelDAO = modelDAO;
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
	public List<Model> queryAllModels() {
		 List<Model> lm = modelDAO.selectAllModels();
	        /*for(Model m:lm){
	            m.setModel_sum(topicDAO.countAllTopics(m.getModel_id()));
	        }*/
	        return lm;
	}

	@Override
	public void addNewModel(Model model) {
		modelDAO.insertNewModel(model);
	}
	@Override
	public void removeModel(Integer model_id) {
		replyDAO.deleteByModel(model_id);
		postDAO.deletePosts(model_id);
		topicDAO.removeTopics(model_id);
		modelDAO.removeModel(model_id);
	}

}
