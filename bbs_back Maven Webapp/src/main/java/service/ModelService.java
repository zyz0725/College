package service;

import java.util.List;

import annotation.Log;
import entity.Model;

public interface ModelService {
	List<Model> queryAllModels();
    @Log(desc = "新增一个模块")
    void addNewModel(Model model);
    @Log(desc = "删除一个模块")
    void removeModel(Integer model_id);
}
