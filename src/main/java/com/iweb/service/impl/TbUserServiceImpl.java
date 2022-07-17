package com.iweb.service.impl;

import com.iweb.dao.TbUserDao;
import com.iweb.domain.TbUser;
import com.iweb.domain.UserData;
import com.iweb.service.TbUserService;
import com.iweb.vo.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

/**
 * @file: financeManager
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/9 18:43
 */
@Service
public class TbUserServiceImpl implements TbUserService {

    @Autowired
    private TbUserDao tbUserDao;

    //查询所有用户
    @Override
    public R selectUserList(Map map) {
        List<TbUser> list = tbUserDao.selectUserList(map);
        int counts=tbUserDao.selectConut();
        R r = new R();
        int total =(counts % 4 == 0) ?(counts / 4) : (counts / 4 +1);
        r.data("total",total);
        r.data("lists",list);
        r.data("counts",counts);
        return r;
    }

    //添加用户
    @Override
    public int addUser(TbUser user) {
        int i=tbUserDao.addUser(user);
        return i;
    }

    //删除用户
    @Override
    public int deleteUserById(Integer id) {
        int i=tbUserDao.deleteUserById(id);
        return i;
    }

    //修改用户
    @Override
    public int editUser(TbUser user) {
        int i=tbUserDao.editUser(user);
        return i;
    }

    //根据id查询用
    @Override
    public TbUser selectUserByid(Integer id) {
        return tbUserDao.selectUserByid(id);
    }

    //查询要导出的数据
    @Override
    public List<UserData> queryAllList() {
        return tbUserDao.queryAllList();
    }
}
