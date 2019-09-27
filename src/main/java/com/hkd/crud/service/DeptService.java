package com.hkd.crud.service;

import com.hkd.crud.bean.Department;
import com.hkd.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {
    @Autowired
    DepartmentMapper departmentMapper ;
    public List<Department> getAllDept(){

        return departmentMapper.selectByExample(null);
    }
}
