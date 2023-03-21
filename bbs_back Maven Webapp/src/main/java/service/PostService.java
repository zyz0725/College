package service;

import annotation.Log;
import dto.PageBean;

import entity.Post;

import java.util.List;

public interface PostService {
    List<Post> queryPostsByPage(PageBean pageBean);
    @Log(desc = "删除帖子")
    void deleteOnePost(Integer post_id);
    @Log(desc = "删除回复")
    void deleteOneReply(Integer reply_id);
}
