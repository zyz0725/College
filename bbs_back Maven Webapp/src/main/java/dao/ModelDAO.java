package dao;

import java.util.List;

import entity.Model;

public interface ModelDAO {
	List<Model> selectAllModels();

    void insertNewModel(Model model);
    
    void removeModel(Integer model_id);
}
