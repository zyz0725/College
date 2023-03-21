package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.PostDAO;
import dao.ReplyDAO;
import dto.PageBean;
import entity.Post;
@Service
@Transactional
public class PostServiceImpl implements PostService {
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
	@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
	@Override
	public List<Post> queryPostsByPage(PageBean pageBean) {
		pageBean.setTotal(postDAO.queryAllPosts().size());
        return postDAO.queryPostsByPage(pageBean);
	}
	@Override
	public void deleteOnePost(Integer post_id) {
		replyDAO.deleteByPosts(post_id);
		postDAO.deleteOnePost(post_id);
		
	}
	@Override
	public void deleteOneReply(Integer reply_id) {
		replyDAO.deleteById(reply_id);
	}

}
