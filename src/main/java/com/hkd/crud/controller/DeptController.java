package com.hkd.crud.controller;

import com.alibaba.fastjson.JSON;
import com.hkd.crud.bean.Department;
import com.hkd.crud.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptController {
    @Autowired
    DeptService deptService;
    @ResponseBody
    @RequestMapping(value = "/depts",produces = "application/json; charset=utf-8")
    public String getDepts(){

        List<Department> deptments = deptService.getAllDept();
//        model.addAttribute("departs",depts);
        return JSON.toJSONString(deptments);
    }
}
