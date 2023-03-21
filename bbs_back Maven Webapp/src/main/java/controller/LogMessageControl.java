package controller;

import aspect.LogMessageService;
import dto.PageBean;
import entity.LogMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
@RequestMapping("/log")
public class LogMessageControl {
    private LogMessageService logMessageService;
    public LogMessageService getLogMessageService() {
        return logMessageService;
    }
    @Autowired
    public void setLogMessageService(LogMessageService logMessageService) {
        this.logMessageService = logMessageService;
    }

    @RequestMapping("/showAllLogs")
    public @ResponseBody
    Map showAllLogs(PageBean pageBean){
        List<LogMessage> logs = logMessageService.queryAllLogs(pageBean);
        Map m = new HashMap();
        m.put("total", pageBean.getTotal());
        m.put("rows", logs);
        return m;
    }

}

