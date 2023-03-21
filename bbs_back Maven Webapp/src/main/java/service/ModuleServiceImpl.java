package service;

import dao.ModuleDAO;
import entity.Module;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZYZ on 2017/11/28.
 */
@Service
@Transactional
public class ModuleServiceImpl implements ModuleService {
    private ModuleDAO moduleDAO;
    @Autowired
    public void setModuleDAO(ModuleDAO moduleDAO) {
        this.moduleDAO = moduleDAO;
    }
    public ModuleDAO getModuleDAO() {

        return moduleDAO;
    }

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Module> queryAllModules() {
        return moduleDAO.selectAll();
    }
}
