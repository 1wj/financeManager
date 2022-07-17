
package com.iweb.vo;

import java.io.Serializable;
import java.util.Objects;

/**
 * @file: FinanceInfoVo
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/8 17:03
 */
public class FinanceInfoVo implements Serializable ,Cloneable {
    private Integer  claimerUserId;
    private String  startTime;
    private String  endTime;
    private Integer pageNo;
    private Integer skipCount;
    private Integer limit;

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getSkipCount() {
        return skipCount;
    }

    public void setSkipCount(Integer skipCount) {
        this.skipCount = skipCount;
    }

    public Integer getClaimerUserId() {
        return claimerUserId;
    }

    public void setClaimerUserId(Integer claimerUserId) {
        this.claimerUserId = claimerUserId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FinanceInfoVo that = (FinanceInfoVo) o;
        return Objects.equals(claimerUserId, that.claimerUserId) && Objects.equals(startTime, that.startTime) && Objects.equals(endTime, that.endTime) && Objects.equals(pageNo, that.pageNo) && Objects.equals(skipCount, that.skipCount) && Objects.equals(limit, that.limit);
    }

    @Override
    public int hashCode() {
        return Objects.hash(claimerUserId, startTime, endTime, pageNo, skipCount, limit);
    }

    @Override
    public String toString() {
        return "FinanceInfoVo{" +
                "claimerUserId=" + claimerUserId +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", pageNo=" + pageNo +
                ", skipCount=" + skipCount +
                ", limit=" + limit +
                '}';
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
