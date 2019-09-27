<%--
  Created by IntelliJ IDEA.
  User: fan
  Date: 2019-09-04
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<div class="modal fade" id="edit_employ_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="editModalLabel">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" id="emp_Id" name="empId"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" id="emp_edit_name" disabled="disabled" name="empName" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_edit" placeholder="">
                            <span name="error_text"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_edit" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_edit" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-3">
                            <select  class="form-control" name="dId" id="select_dept_edit">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="edit_emp">修改</button>
            </div>
        </div>
    </div>
</div>




<div class="modal fade" id="add_employ_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add" placeholder="">
                            <span name="error_text"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add" placeholder="">
                            <span name="error_text"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-3">
                            <select  class="form-control" name="dId" id="select_dept">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="regist_emp">注册</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button type="button" class="btn btn-success" id="add_emp">新增</button>
            <button type="button" class="btn btn-danger" id="delete_emp_all">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <tr>
                    <th>id</th>
                    <th>员工姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>所属部门</th>
                    <th>操作</th>
                    <th>
                        <p>全选</p>
                         <input type="checkbox" id="check-all"/>
                    </th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>

                        <th>
                            <button type="button" class="btn btn-info  btn-sm edit_btn"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改</button>
                            <button type="button" class="btn btn-danger  btn-sm delete_btn" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
                        </th>
                        <th>
                            <input type="checkbox" class="check-one"/>
                        </th>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，${pageInfo.total}条数据
        </div>
        <%--分页条信息--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">

                        <c:if test="${pageInfo.pageNum == page_Num}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != page_Num}">
                            <li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
    <script type="text/javascript">
        $("#add_emp").click(function () {
            $("#add_employ_modal").modal({
                backdrop:"static"
            });
            getDept(("#add_employ_modal select"));
        });
        //查询所有部门信息
        function getDept(ele) {
            $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"GET",
                success:function (result) {
                    $.each(result,function () {
                        var select_El = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                        select_El.appendTo(ele);
                    })

                }
            });
        }
        function to_page(pages){
            $.ajax({
                url:"${APP_PATH}/emps",
                type:"POST",
                data:"pn="+pages
            })
        }
        function regist_verify() {
            var empName = $("#empName_add").val();
            var regName = /^[a-z0-9_-]{6,16}$/;
            if(!regName.test(empName)){
                show_verify("#empName_add","error","用户名长度必须在6～16位！");
                return false;
            }else{
                show_verify("#empName_add","success","");
            }
            var empEmail = $("#email_add").val();
            var regEmail =  /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
            if(!regEmail.test(empEmail)){
                show_verify("#email_add","error","请输入正确的邮箱！");
                return false;
            }else{
                show_verify("#email_add","success","");
            }
            return true;
        }
        function show_verify(ele,status,msg){
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text();
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }
        $("#regist_emp").click(function () {
            if(!regist_verify()){
                return false;
            }
           $.ajax({
               url:"${APP_PATH}/emp",
               type:"POST",
               data:$("#add_employ_modal form").serialize(),
               success:function () {
                   $("#add_employ_modal").modal('hide');
                   window.location="${APP_PATH}/emps?pn=${pageInfo.pages}+1";
               }
           })
        });
        $(".edit_btn").click(function () {
            $("#edit_employ_modal").modal({
                backdrop:"static"
            });
            var empid = $(this).parent().parent().children(":first").text();
           // alert(empid);
            getDept(("#select_dept_edit"));
            getEmp(empid);
            //alert(empid);
        });
        //获取员工信息

        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"GET",
             success:function(result1){
                    //var result1 = JSON.parse(result);
                    //console.log(result1);
                    $("#emp_edit_name").val(result1.empName);
                    $("#email_edit").val(result1.email);
                    $("#edit_employ_modal input[name=gender]").val([result1.gender]);
                    $("#edit_employ_modal select").val([result1.dId]);
                    $("#emp_Id").val(result1.empId);
                }

            });
        }
        $("#edit_emp").click(function () {
            var empEmail = $("#email_edit").val();
            var regEmail =  /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
            if(!regEmail.test(empEmail)){
                show_verify("#email_edit","error","请输入正确的邮箱！");
                return false;
            }else{
                show_verify("#email_edit","success","");
            }

            //alert($("#emp_Id").val());
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                data:$("#edit_employ_modal form").serialize()+"&_method=PUT"
            });
            $("#edit_employ_modal").modal("hide");
            window.location="${APP_PATH}/emps?pn=${pageInfo.pageNum}";
        });
        //单个用户删除
        $(".delete_btn").click(function () {
           // alert("ccc");
            var truthBeTold = window.confirm("单击“确定”删除。单击“取消”取消删除。");
            if (truthBeTold) {
                var id1 = $(this).parent().parent().children(":first").text();
                $.ajax({
                    url:"${APP_PATH}/emp/"+id1,
                    type:"DELETE"
                })
                window.location="${APP_PATH}/emps?pn=${pageInfo.pageNum}";
            }
        })
        //设置全选全不选
        $("#check-all").click(function () {
            var checkstatic = $("#check-all").prop("checked");
            $(".check-one").prop("checked",checkstatic);
        })
        $(".check-one").click(function () {
            //alert($(".check-one:checked").length);
            var len = $(".check-one:checked").length;
            if(len == $(".check-one").length){
                $("#check-all").prop("checked",true);
            }else{
                $("#check-all").prop("checked",false);
            }
        })
        //多个删除
        $("#delete_emp_all").click(function () {
            var emps = $(".check-one:checked");
           // alert(emps);
            $.each(emps,function () {
                //alert($(this).parents("th").parents("tr").find("th:eq(0)").text());
                var empids = $(this).parents("th").parents("tr").find("th:eq(0)").text()
                $.ajax({
                    url:"${APP_PATH}/emp/"+empids,
                    type:"DELETE"
                })
            });
            window.location="${APP_PATH}/emps?pn=${pageInfo.pageNum}";
        });
    </script>
</div>
</body>
</html>
