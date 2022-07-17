
package com.iweb.service;

import com.iweb.domain.TbUser;
import java.util.Map;

/**
 * @file: LoginService
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/10 14:43
 */
public interface LoginService {
    //查询用户用作登录
    TbUser selectUserByLogAndPas(Map map);
}
