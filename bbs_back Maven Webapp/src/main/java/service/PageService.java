package service;

import annotation.Log;
import dto.PageBean;
import entity.Page;

import java.util.List;

/**
 * Created by ZYZ on 2017/11/29.
 */
public interface PageService {
    List<Page> queryAllPages(PageBean pageBean);
    @Log(desc = "修改轮转图信息")
    void updatePageDetail(Page page);
    @Log(desc = "增加新的轮转图")
    void insertPageDetail(Page page);
}
