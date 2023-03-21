package service;

import dao.UserDAO;
import dto.China;
import dto.PageBean;
import dto.Sex;
import entity.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    private UserDAO userDAO;
    public UserDAO getUserDAO() {
        return userDAO;
    }
    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<User> queryUsersByPage(PageBean pageBean) {
        pageBean.setTotal(userDAO.selectAllUsers().size());
        return userDAO.selectUsersByPage(pageBean);
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<User> queryAllUsers() {
        return userDAO.selectAllUsers();
    }

    public void insertUsers(List<User> users) {
        userDAO.insertUsers(users);
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<China> queryMans() {
        return userDAO.selectMans();
    }
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<China> queryWomen() {
        return userDAO.selectWomen();
    }
	@Override
	@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
	public User queryOneUser(String user_name) {
		return userDAO.selectOneUser(user_name);
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
	public List<Sex> querySexes() {
		// TODO Auto-generated method stub
		return userDAO.selectSexes();
	}
	@Override
	public void update(User user) {
		userDAO.updateUser(user);
	}
}
