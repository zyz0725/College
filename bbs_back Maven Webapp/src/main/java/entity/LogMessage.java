package entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;


public class LogMessage implements Serializable {
    private Integer id;
    private String username;
    private String operation;
    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    private Date time;

    @Override
    public String toString() {
        return "LogMessage{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", operation='" + operation + '\'' +
                ", time=" + time +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public LogMessage() {

    }

    public LogMessage(Integer id, String username, String operation, Date time) {

        this.id = id;
        this.username = username;
        this.operation = operation;
        this.time = time;
    }
}
