package service;

import dao.PageDAO;
import dto.PageBean;
import entity.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZYZ on 2017/11/29.
 */
@Service
@Transactional
public class PageServiceImpl implements PageService{
    private PageDAO pageDAO;
    public PageDAO getPageDAO() {
        return pageDAO;
    }
    @Autowired
    public void setPageDAO(PageDAO pageDAO) {
        this.pageDAO = pageDAO;
    }

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Page> queryAllPages(PageBean pageBean) {
        pageBean.setTotal(pageDAO.selectCount());
        System.out.println(pageBean+"------------------=====================================");
        return pageDAO.selectAllPages(pageBean);
    }

    public void updatePageDetail(Page page) {
        pageDAO.updatePageDetail(page);
    }

    public void insertPageDetail(Page page) {
        pageDAO.addPageDetail(page);
    }
}
