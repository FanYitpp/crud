package com.hkd.crud.test;

import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:SpringMVC-config.xml"})
public class MVCTest {
    //传入Springmvc的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟mvc请求。获取到处理结果
    MockMvc mockMvc ;
    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void test1() throws Exception {
        //模拟请求拿到返回值
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","1")).andReturn();
        //请求成功以后，请求域中会有pageInfo，我们可以取出pageInfo来完成验证
        MockHttpServletRequest request = mvcResult.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页面"+pageInfo.getPageNum());
    }
}
