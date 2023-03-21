package controller;

import entity.Module;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ModuleService;

import java.util.List;

/**
 * Created by ZYZ on 2017/11/28.
 */
@Controller
@Scope("prototype")
@RequestMapping("/module")
public class ModuleControl {
    private ModuleService moduleService;
    @Autowired
    public void setModuleService(ModuleService moduleService) {
        this.moduleService = moduleService;
    }
    public ModuleService getModuleService() {
        return moduleService;
    }

    @RequestMapping("/showAllModules")
    public @ResponseBody List<Module> showAllMenus(){
        return moduleService.queryAllModules();
    }
}
