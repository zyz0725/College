package dto;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;


public class China implements Serializable {
    @JSONField(name = "name")
    private String province;
    @JSONField(name = "value")
    private Integer count;

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public China() {
    }

    public China(String province, Integer count) {
        this.province = province;
        this.count = count;
    }

    @Override
    public String toString() {
        return "China{" +
                "province='" + province + '\'' +
                ", count=" + count +
                '}';
    }
}
