package aspect;

import dto.PageBean;
import entity.LogMessage;

import java.util.List;


public interface LogMessageService {
    List<LogMessage> queryAllLogs(PageBean pageBean);

    void addNewLog(LogMessage logMessage);
}
