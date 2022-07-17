package com.iweb.dao;


import com.iweb.domain.TbUser;
import com.iweb.domain.UserData;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

/**
 * @file: financeManager
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/9 18:46
 */
@Mapper
public interface TbUserDao {
    List<TbUser> selectUserList(Map map);

    //查询数量
    int selectConut();
    //增加用户
    int addUser(TbUser user);
    //删除用户
    int deleteUserById(Integer id);
    //修改用户
    int editUser(TbUser user);
    //根据id查用户
    TbUser selectUserByid(Integer id);
    //查询所有集合
    List<UserData> queryAllList();
}
