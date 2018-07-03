package com.huanxink.msys.managesys.model;

public class EnterpriseEmployee extends BasicEnity {

    private String enterpriseId;

    private String empName;

    private String empSex;

    private String empIdno;

    private String empType;

    private String empQulificationNo;

    public String getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(String enterpriseId) {
        this.enterpriseId = enterpriseId == null ? null : enterpriseId.trim();
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpSex() {
        return empSex;
    }

    public void setEmpSex(String empSex) {
        this.empSex = empSex == null ? null : empSex.trim();
    }

    public String getEmpIdno() {
        return empIdno;
    }

    public void setEmpIdno(String empIdno) {
        this.empIdno = empIdno == null ? null : empIdno.trim();
    }

    public String getEmpType() {
        return empType;
    }

    public void setEmpType(String empType) {
        this.empType = empType == null ? null : empType.trim();
    }

    public String getEmpQulificationNo() {
        return empQulificationNo;
    }

    public void setEmpQulificationNo(String empQulificationNo) {
        this.empQulificationNo = empQulificationNo == null ? null : empQulificationNo.trim();
    }

}