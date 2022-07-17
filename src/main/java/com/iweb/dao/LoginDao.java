
package com.iweb.dao;

import com.iweb.domain.TbUser;
import org.apache.ibatis.annotations.Mapper;
import java.util.Map;

/**
 * @file: LoginDao
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/10 14:44
 */
@Mapper
public interface LoginDao {
    //查询用户用作登录
    TbUser selectUserByLogAndPas(Map map);
}
