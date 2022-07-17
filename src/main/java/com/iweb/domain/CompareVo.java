package com.iweb.domain;

import java.io.Serializable;

/**
 * @file: CompareVo
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/5/8 17:26
 */
public class CompareVo implements Serializable,Cloneable {
    private String name;
    private long value;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getValue() {
        return value;
    }

    public void setValue(long value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "CompareVo{" +
                "name='" + name + '\'' +
                ", value=" + value +
                '}';
    }

}
