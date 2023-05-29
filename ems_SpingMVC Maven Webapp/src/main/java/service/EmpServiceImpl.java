package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.EmpDAO;
import entity.Emp;
@Service
@Transactional
public class EmpServiceImpl implements EmpService {
	private EmpDAO empDAO;
	public EmpDAO getEmpDAO() {
		return empDAO;
	}
	@Autowired
	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<Emp> showAllEmp() {
		List<Emp> le = empDAO.queryAllEmp();
		return le;
	}
	@Override
	public void addEmp(Emp emp) {
		empDAO.insertEmp(emp);
	}
	@Override
	public void dropOneEmp(Integer id) {
		empDAO.deleteOneEmp(id);
	}
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public Emp showOneEmp(Integer id) {
		Emp emp = empDAO.queryOneEmp(id);
		return emp;
	}
	@Override
	public void updateEmp(Emp emp) {
		empDAO.updateEmp(emp);
	}

}
