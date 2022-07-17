
package com.iweb.service;

import com.iweb.domain.TbUser;
import com.iweb.domain.UserData;
import com.iweb.vo.R;
import java.util.List;
import java.util.Map;

/**
 * @file: TbUserService
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/9 18:43
 */
public interface TbUserService {

    //查询所有用户
    R selectUserList(Map map);

    //添加用户
    int addUser(TbUser user);

    //删除用户
    int deleteUserById(Integer id);

    //修改用户
    int editUser(TbUser user);

    //根据id查用户
    TbUser selectUserByid(Integer id);

    //查询要导出的数据
    List<UserData> queryAllList();

}
