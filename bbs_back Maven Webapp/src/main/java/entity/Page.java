package entity;

import java.io.Serializable;

/**
 * Created by ZYZ on 2017/11/29.
 */
public class Page implements Serializable {
    private Integer id;
    private String path;
    private String description;
    private String status;

    public Page() {
    }

    public Page(Integer id, String path, String description, String status) {

        this.id = id;
        this.path = path;
        this.description = description;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Page{" +
                "id=" + id +
                ", path='" + path + '\'' +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
