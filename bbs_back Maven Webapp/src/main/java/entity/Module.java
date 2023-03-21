package entity;

import java.io.Serializable;
import java.util.List;

public class Module implements Serializable {
    private Integer id;
    private String name;
    private String iconcls;
    private String href;
    private Integer parentid;
    private List<Module> moduls;

    public Module() {
    }

    public Module(Integer id, String name, String iconcls, String href, List<Module> moduls) {
        this.id = id;
        this.name = name;
        this.iconcls = iconcls;
        this.href = href;
        this.moduls = moduls;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public Integer getParentid() {

        return parentid;
    }

    @Override
    public String toString() {
        return "Module{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", iconcls='" + iconcls + '\'' +
                ", href='" + href + '\'' +
                ", moduls=" + moduls +
                '}';
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setIconcls(String iconcls) {
        this.iconcls = iconcls;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public void setModuls(List<Module> moduls) {
        this.moduls = moduls;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getIconcls() {
        return iconcls;
    }

    public String getHref() {
        return href;
    }

    public List<Module> getModuls() {
        return moduls;
    }
}
