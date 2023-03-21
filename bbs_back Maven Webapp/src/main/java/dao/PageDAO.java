package dao;

import dto.PageBean;
import entity.Page;

import java.util.List;

/**
 * Created by ZYZ on 2017/11/29.
 */
public interface PageDAO {

    List<Page> selectAllPages(PageBean pageBean);

    void updatePageDetail(Page page);

    void addPageDetail(Page page);

    Integer selectCount();
}
