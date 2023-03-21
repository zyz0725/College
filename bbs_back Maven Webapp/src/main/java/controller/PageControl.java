package controller;

import dto.PageBean;
import entity.Page;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.PageService;
import service.UploadService;


import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by ZYZ on 2017/11/29.
 */
@Controller
@Scope("prototype")
@RequestMapping("/page")
public class PageControl {
    private PageService pageService;
    private UploadService uploadService;
    public UploadService getUploadService() {
        return uploadService;
    }
    @Autowired
    public void setUploadService(UploadService uploadService) {
        this.uploadService = uploadService;
    }
    public PageService getPageService() {
        return pageService;
    }
    @Autowired
    public void setPageService(PageService pageService) {
        this.pageService = pageService;
    }

    @RequestMapping("/showAllPages")
    public @ResponseBody
    Map queryAllPages(PageBean pageBean){
        List<Page> pages = pageService.queryAllPages(pageBean);
        Map m = new HashMap();
        m.put("total", pageBean.getTotal());
        m.put("rows", pages);
        return m;
    }

    @ResponseBody
    @RequestMapping("/uploadPicture")
    public void  audioUpload(MultipartFile upload, String description, HttpServletRequest request,String status)  {
        /*文件上传到服务器*/
        String realPath = request.getSession().getServletContext().getRealPath("/");
        String originalFilename = upload.getOriginalFilename();
        //创建对应实体
        Page load = new Page();
        load.setDescription(description);
        load.setStatus(status);
        //UUID.jpg
        String s1 = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(originalFilename);
        load.setPath(s1);
        String webPath = "/img/";
        try {
            uploadService.upload(realPath,webPath,upload,s1);
            pageService.insertPageDetail(load);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updatePageDetail")
    public void updatePageDetail(Page page){
        pageService.updatePageDetail(page);
    }

}
