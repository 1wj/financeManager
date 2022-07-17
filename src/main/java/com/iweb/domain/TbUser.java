
package com.iweb.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * @file: TbUser
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/8 15:48
 */
public class TbUser implements Serializable,Cloneable {
    private Integer id;
    private String userName;
    private String loginName;
    private String password;
    private Integer type;
    private String idNo;
    private String phoneNo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

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
        TbUser user = (TbUser) o;
        return Objects.equals(id, user.id) && Objects.equals(userName, user.userName) && Objects.equals(loginName, user.loginName) && Objects.equals(password, user.password) && Objects.equals(type, user.type) && Objects.equals(idNo, user.idNo) && Objects.equals(phoneNo, user.phoneNo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, userName, loginName, password, type, idNo, phoneNo);
    }

    @Override
    public String toString() {
        return "TbUser{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", type=" + type +
                ", idNo='" + idNo + '\'' +
                ", phoneNo='" + phoneNo + '\'' +
                '}';
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
