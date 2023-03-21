package controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import entity.Model;
import service.ModelService;
import service.UploadService;

@Controller
@Scope("prototype")
@RequestMapping("/model")
public class ModelControl {
	private ModelService modelService;
	private UploadService uploadService;
	public UploadService getUploadService() {
		return uploadService;
	}
	@Autowired
	public void setUploadService(UploadService uploadService) {
		this.uploadService = uploadService;
	}
	public ModelService getModelService() {
		return modelService;
	}
	@Autowired
	public void setModelService(ModelService modelService) {
		this.modelService = modelService;
	}
	 @RequestMapping("/showAllModels")
	public @ResponseBody List<Model> queryAllModels(){
	    return modelService.queryAllModels();
	}
	@RequestMapping("/addNewModel")
	@ResponseBody
	    public void insertModel(MultipartFile upload, String model_name, HttpServletRequest request, String model_desc,String model_target){
	        /*文件上传到服务器*/
	        String realPath = request.getSession().getServletContext().getRealPath("/");
	        String originalFilename = upload.getOriginalFilename();
	        //创建对应实体
	        Model model = new Model();
	        model.setModel_desc(model_desc);
	        model.setModel_name(model_name);
	        //model.setModel_target(model_target);
	        //UUID.jpg
	        String s1 = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(originalFilename);
	        model.setModel_img(s1);
	        String webPath = "/image/";
	        try {
	            uploadService.upload(realPath,webPath,upload,s1);
	            modelService.addNewModel(model);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	
	@RequestMapping("/removeModel")
	@ResponseBody
	public void removeModel(Integer model_id){
		modelService.removeModel(model_id);
	}
}
