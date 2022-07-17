
package com.iweb.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * @file: TbFinanceInfo
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/8 15:33
 */
public class TbFinanceInfo implements Serializable ,Cloneable{
    private Integer  id;
    private Integer  claimerUserId;
    private String  reason;
    private String  balance;
    private Integer  recorderUserId;
    private Integer  isDeleted;
    private String createTime;  //OffsetDateTime
    private String  updateTime;
    private String  sum;
    private Integer  type;
    private String  reasonTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getClaimerUserId() {
        return claimerUserId;
    }

    public void setClaimerUserId(Integer claimerUserId) {
        this.claimerUserId = claimerUserId;
    }

    public Integer getRecorderUserId() {
        return recorderUserId;
    }

    public void setRecorderUserId(Integer recorderUserId) {
        this.recorderUserId = recorderUserId;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getReasonTime() {
        return reasonTime;
    }

    public void setReasonTime(String reasonTime) {
        this.reasonTime = reasonTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TbFinanceInfo that = (TbFinanceInfo) o;
        return Objects.equals(id, that.id) && Objects.equals(claimerUserId, that.claimerUserId) && Objects.equals(reason, that.reason) && Objects.equals(balance, that.balance) && Objects.equals(recorderUserId, that.recorderUserId) && Objects.equals(isDeleted, that.isDeleted) && Objects.equals(createTime, that.createTime) && Objects.equals(updateTime, that.updateTime) && Objects.equals(sum, that.sum) && Objects.equals(type, that.type) && Objects.equals(reasonTime, that.reasonTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, claimerUserId, reason, balance, recorderUserId, isDeleted, createTime, updateTime, sum, type, reasonTime);
    }

    @Override
    public String toString() {
        return "TbFinanceInfo{" +
                "id=" + id +
                ", claimerUserId=" + claimerUserId +
                ", reason='" + reason + '\'' +
                ", balance='" + balance + '\'' +
                ", recorderUserId=" + recorderUserId +
                ", isDeleted=" + isDeleted +
                ", createTime='" + createTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", sum='" + sum + '\'' +
                ", type=" + type +
                ", reasonTime='" + reasonTime + '\'' +
                '}';
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
