
package com.iweb.domain;

import com.alibaba.excel.annotation.ExcelProperty;

import java.io.Serializable;
import java.util.Objects;

/**
 * @file: UserData
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/10 14:10
 */
public class UserData implements Serializable,Cloneable{
    @ExcelProperty(value = "用户姓名",index = 0)
    private String userName;

    @ExcelProperty(value = "用户登录名",index = 1)
    private String loginName;

    @ExcelProperty(value = "身份证号",index = 2)
    private String idNo;

    @ExcelProperty(value = "手机号",index = 3)
    private String phoneNo;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getIdNo() {
        return idNo;
    }

    public void setIdNo(String idNo) {
        this.idNo = idNo;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserData userData = (UserData) o;
        return Objects.equals(userName, userData.userName) && Objects.equals(loginName, userData.loginName) && Objects.equals(idNo, userData.idNo) && Objects.equals(phoneNo, userData.phoneNo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userName, loginName, idNo, phoneNo);
    }

    @Override
    public String toString() {
        return "UserData{" +
                "userName='" + userName + '\'' +
                ", loginName='" + loginName + '\'' +
                ", idNo='" + idNo + '\'' +
                ", phoneNo='" + phoneNo + '\'' +
                '}';
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
