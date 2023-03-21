package dao;

import dto.PageBean;
import entity.LogMessage;

import java.util.List;


public interface LogMessageDAO {
    List<LogMessage> selectAllLogs(PageBean pageBean);
    List<LogMessage> selectLogs();
    void insertNewLog(LogMessage logMessage);
}
