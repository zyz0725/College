package dao;

import java.util.List;

import dto.PageBean;
import entity.Post;

public interface PostDAO {
	Integer countAllPosts(Integer topic_id);
	
	List<Post> queryPostsByPage(PageBean pageBean);
	
	List<Post> queryAllPosts();
	
	void deletePosts(Integer model_id);
	
	void deletePostByTopic(Integer topic_id);
	
	void deleteOnePost(Integer post_id);
}
