package service;

import java.util.List;

import annotation.Log;
import dto.China;
import dto.PageBean;
import dto.Sex;
import entity.User;

public interface UserService {
    List<User> queryUsersByPage(PageBean pageBean);

    List<User> queryAllUsers();
    @Log(desc = "导入用户信息")
    void insertUsers(List<User> users);
    User queryOneUser(String user_name);
    List<China> queryMans();
    List<China> queryWomen();
    List<Sex> querySexes();
    @Log(desc = "更改用户信息")
    void update(User user);
}
