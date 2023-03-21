package controller;

import dto.PageBean;
import entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.PostService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
@RequestMapping("/post")
public class PostControl {
    private PostService postService;
    public PostService getPostService() {
		return postService;
	}
    @Autowired
	public void setPostService(PostService postService) {
		this.postService = postService;
	}
	@RequestMapping("/showAllPosts")
    public @ResponseBody Map 
    queryAll(PageBean pageBean){
        List<Post> posts = postService.queryPostsByPage(pageBean);
        Map m = new HashMap();
        m.put("total", pageBean.getTotal());
        m.put("rows", posts);
		return m;
    }
	@RequestMapping("/removePost")
    public @ResponseBody String removePost(Integer post_id){
        postService.deleteOnePost(post_id);
        return "success";
    }
	@RequestMapping("/removeReply")
    public @ResponseBody String removeReply(Integer reply_id){
		System.out.println(reply_id);
        postService.deleteOneReply(reply_id);
        return "success";
    }
}
