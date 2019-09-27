<%--
  Created by IntelliJ IDEA.
  User: fan
  Date: 2019-09-04
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <%--引入jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.11.3.min.js"></script>
    <%--引入样式--%>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-success">新增</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table" id="emp_table">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>员工姓名</th>
                        <th>性别</th>
                        <th>邮箱</th>
                        <th>所属部门</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">
            当前第页，总共页，条数据
        </div>
        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

</div>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn=1",
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    //1.解析并显示员工信息
                    build_emp_table(result);
                    //2。解析并显示分页信息
                    build_page_info(result);
                    //3.解析并显示分页条信息
                    build_page_nav(result);
                }
            });
        });
        //解析显示表格
        function build_emp_table(result) {
            var emps = result.msgData.pageInfo.list;
            $.each(emps,function (index,item) {
                //alert(item.empName);
                var empId_td = $("<td></td>").append(item.empId);
                var empName_td = $("<td></td>").append(item.empName);
                var empGender_td = $("<td></td>").append(item.gender);
                var empEmail_td = $("<td></td>").append(item.email);
                var empDep_td = $("<td></td>").append(item.department.depName);
                var editBtn = $("<button></button>").addClass("btn btn-info  btn-sm").append($("<span></span>")).addClass("glyphicon glyphicon-pencil").append("编辑");
                var deleteBtn = $("<button></button>").addClass("btn btn-danger  btn-sm").append($("<span></span>")).addClass("glyphicon glyphicon-trash").append("删除");
                var btn = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
                //append方法执行后还是返回原来的元素
                $("<tr></tr>").append(empId_td).append(empName_td).append(empGender_td).append(empEmail_td).append(empDep_td).append(btn).appendTo("#emp_table tbody");
            })
        }
        //解析显示分页信息
        function build_page_info(result){
            $("#page_info_area").append(  "当前第"+ result.msgData.pageInfo.pageNum +"页，总共"+ result.msgData.pageInfo.pages +"页，"+ result.msgData.pageInfo.total +"条数据")
        }
        //解析显示分页条
        function build_page_nav(result) {
            var firstLi = $("<li></li>").append($("<a></a>")).append("首页").attr("href","${APP_PATH}/emps?pn=1");
            var lastLi = $("<li></li>").append($("<a></a>")).append("末页").attr("href","${APP_PATH}/emps?pn=${pageInfo.pages}");
            var preLi = $("<li></li>").append($("<a></a>")).attr("href","${APP_PATH}/emps?pn=${pageInfo.pageNum-1}").append($("<span></span>")).append("&laquo;").attr("aria-hidden","true");
            $("#page_nav_area").append(firstLi).append(preLi);
        }
    </script>
</body>
</html>
