package com.hkd.crud.bean;

public class Department {
    private Integer deptId;

    private String deptName;

    public Department() {
        super();
        ///范德萨发阿发生的fuck
        ///范德萨发阿发生的new change
        System.out.println("hehheheaaaaaa");
    }

    public Department(Integer deptId, String deptName) {
        this.deptId = deptId;
        this.deptName = deptName;
    }


    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }
}
