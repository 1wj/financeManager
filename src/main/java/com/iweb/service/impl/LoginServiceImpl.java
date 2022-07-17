
package com.iweb.service.impl;

import com.iweb.dao.LoginDao;
import com.iweb.domain.TbUser;
import com.iweb.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Map;

/**
 * @file: financeManager
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/10 14:43
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;

    //查询用户用作登录
    @Override
    public TbUser selectUserByLogAndPas(Map map) {
        return loginDao.selectUserByLogAndPas(map);
    }
}
