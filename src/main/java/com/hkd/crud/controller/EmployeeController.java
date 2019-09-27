package com.hkd.crud.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hkd.crud.bean.Employee;
import com.hkd.crud.bean.Msg;
import com.hkd.crud.service.EmployeeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
//    @ResponseBody
//    @RequestMapping("/emps")
//    public Msg getEmpWithJson(@RequestParam(value="pn",defaultValue = "1") Integer pn){
//        //*引入pagehelper分页插件*//
//        //*在查询之前只需要调用传入页码，以及页面大小*//
//        PageHelper.startPage(pn,5);
//        //*startPage后边紧跟这个查询就是一个分页查询*//
//        List<Employee> employees = employeeService.getAll();
//        //*使用pageInfo包装查询后的结果只需要将pageInfo交给页面就行*//
//        //*封装了详细的分页信息，包括查询出来的数据*//
//        PageInfo pageInfo = new PageInfo(employees,5);
//        return Msg.Msgsuccess().add("pageInfo",pageInfo);
//    }

    //删除用户
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    public void deleteEmp(@PathVariable("id")Integer id){
        employeeService.deleteEmpById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    public String getEmpl(@PathVariable("id") Integer id){
        Employee emp = employeeService.getEmpById(id);
        return JSON.toJSONString(emp);
    }

    @RequestMapping(value = "/emps",produces = "application/json; charset=utf-8")
    public String getEmps(@RequestParam(value="pn",defaultValue = "1") Integer pn, Model model){
        //*引入pagehelper分页插件*//*
        //*在查询之前只需要调用传入页码，以及页面大小*//*
        PageHelper.startPage(pn,5);
        //*startPage后边紧跟这个查询就是一个分页查询*//*
        List<Employee> employees = employeeService.getAll();
        //*使用pageInfo包装查询后的结果只需要将pageInfo交给页面就行*//*
        //*封装了详细的分页信息，包括查询出来的数据*//*
        PageInfo pageInfo = new PageInfo(employees,5);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
    @ResponseBody
    @RequestMapping(value = "/emp",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    public String setEmps(Employee employee){
        employeeService.setEmp(employee);
        String s = "成功";
        return JSON.toJSONString(s);
    }


    @RequestMapping(value = "/emp",method = RequestMethod.PUT,produces = "application/json; charset=utf-8")
    public void updateEmp(Employee employee){
        System.out.println(employee);
        employeeService.upEmployee(employee);
    }
}
