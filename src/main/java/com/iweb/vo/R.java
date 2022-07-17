
package com.iweb.vo;

import java.util.HashMap;
import java.util.Map;

/**
 * @file: R
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/8 17:06
 */
public class R {

    private Map<String, Object> data = new HashMap<String, Object>();

    public  R() {
    }

    public R data(String key, Object value){
        this.data.put(key, value);
        return this;
    }

    public R data(Map<String, Object> map){
        this.setData(map);
        return this;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
