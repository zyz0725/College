package service;

import dao.ModuleDAO;
import entity.Module;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZYZ on 2017/11/28.
 */

public interface ModuleService {
    List<Module> queryAllModules();
}
