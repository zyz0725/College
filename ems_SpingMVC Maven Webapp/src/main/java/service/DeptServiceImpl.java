package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.DeptDAO;
import entity.Dept;

@Service
@Transactional
public class DeptServiceImpl implements DeptService {
	private DeptDAO deptDAO;
	public DeptDAO getDeptDAO() {
		return deptDAO;
	}
	@Autowired
	public void setDeptDAO(DeptDAO deptDAO) {
		this.deptDAO = deptDAO;
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<Dept> showAllDept() {
		List<Dept> depts = deptDAO.selectAllDept();
		return depts;
	}
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Dept showOneDept(Integer did) {
		Dept dept = deptDAO.selectOneDept(did);
		return dept;
	}

}
