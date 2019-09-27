package com.hkd.crud.service;

import com.hkd.crud.bean.Employee;
import com.hkd.crud.dao.EmployeeMapper;
import org.aspectj.lang.annotation.After;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll() {

        return employeeMapper.selectByExampleWithDept(null);

    }

    public void setEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    public Employee getEmpById(Integer id) {

        return   employeeMapper.selectByPrimaryKey(id);
    }

    public void upEmployee(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }
}
