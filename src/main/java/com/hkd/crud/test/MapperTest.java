package com.hkd.crud.test;

import com.hkd.crud.bean.Department;
import com.hkd.crud.bean.Employee;
import com.hkd.crud.dao.DepartmentMapper;
import com.hkd.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void test1(){
      /*  departmentMapper.insertSelective(new Department(null,"开发部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));*/

       // employeeMapper.insertSelective(new Employee(null,"xioaming","男","22222@qq.com",1));

    
       /* System.out.println(departmentMapper);*/
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i = 0 ; i < 1000; i++){
            String uuid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,uuid,"男",uuid+"@qq.com",1));
            System.out.println("批量完成");
        }

    }
}
