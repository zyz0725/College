package aspect;

import dao.LogMessageDAO;
import dto.PageBean;
import entity.LogMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class LogMessageServiceImpl implements LogMessageService {
    private LogMessageDAO logMessageDAO;
    public LogMessageDAO getLogMessageDAO() {
        return logMessageDAO;
    }
    @Autowired
    public void setLogMessageDAO(LogMessageDAO logMessageDAO) {
        this.logMessageDAO = logMessageDAO;
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<LogMessage> queryAllLogs(PageBean pageBean) {
    	pageBean.setTotal(logMessageDAO.selectLogs().size());
        return logMessageDAO.selectAllLogs(pageBean);
    }

    public void addNewLog(LogMessage logMessage) {
        logMessageDAO.insertNewLog(logMessage);
    }
}
