package dao;

import java.util.List;

import dto.PageBean;
import entity.Post;

public interface ReplyDAO {
	void deleteByModel(Integer model_id);
	
	void deleteByTopic(Integer topic_id);
	
	void deleteByPosts(Integer post_id);
	
	void deleteById(Integer Reply_id);
}
