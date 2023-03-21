package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import dto.China;
import dto.PageBean;
import dto.Sex;
import entity.User;


public interface UserDAO {
    List<User> selectUsersByPage(PageBean pageBean);
    List<User> selectAllUsers();
    void insertUsers(@Param("users") List<User> users);
    User selectOneUser(String user_name);
    List<China> selectMans();
    List<China> selectWomen();
    List<Sex> selectSexes();
    void updateUser(User user);
}
