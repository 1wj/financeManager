
package com.iweb.controller;

import com.alibaba.excel.EasyExcel;
import com.iweb.domain.TbUser;
import com.iweb.domain.UserData;
import com.iweb.service.TbUserService;
import com.iweb.utils.UUIDUtil;
import com.iweb.vo.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @file: TbUserController
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/9 18:42
 */
@Controller
@RequestMapping("/user")
public class TbUserController {

    @Autowired
    TbUserService userService;

    //导出Excel
    @GetMapping("/printExcel")
    @ResponseBody
    public R editUser( ){
        List<UserData> list=userService.queryAllList();
        //1.设置写入文件地址和文件名
        String fileName="C:\\Users\\Wj\\Desktop\\user.xlsx";
        //2.调用easyExcel中的write方法
        EasyExcel.write(fileName, UserData.class)
                .sheet("用户列表")
                .doWrite(list);
        int flag=1;
        R r = new R();
        if (flag==1){
            r.data("flag","success");
        }else {
            r.data("flag","error");
        }
        return r;

    }

    //根据id查询用户
    @GetMapping("/selectUserByid")
    public ModelAndView selectUserByid(Integer id ){
        TbUser user11=userService.selectUserByid(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("user11",user11);
        mv.setViewName("forward:/user/addUser.jsp");
        return mv;
    }

    //编辑用户
    @PostMapping("/editUser")
    @ResponseBody
    public R editUser(TbUser user ){
        user.setType(2);
        int flag=userService.editUser(user);
        R r = new R();
        if (flag==1){
            r.data("flag","success");
        }else {
            r.data("flag","error");
        }
        return r;
    }

    //删除用户
    @PostMapping("/deleteUserById")
    @ResponseBody
    public R deleteUserById(Integer id){
        int flag=userService.deleteUserById(id);
        R r = new R();
        if (flag==1){
            r.data("flag","success");
        }else {
            r.data("flag","error");
        }
        return r;
    }

    //添加用户
    @PostMapping("/addUser")
    @ResponseBody
    public R addUser(TbUser user){
        //设置用户id
        Integer uuid3 = UUIDUtil.getUUID3();
        user.setId(uuid3);
        //设置用户类型 为普通用户
        user.setType(2);
        int flag=userService.addUser(user);
        R r = new R();
        if (flag==1){
            r.data("flag","success");
        }else {
            r.data("flag","error");
        }
        return r;
    }

    //查询所有用户
    @PostMapping("/selectUserList")
    @ResponseBody
    public R selectUserList(String current){
        int pageNo=Integer.valueOf(current);                      //当前页 固定每页查询4条
        int skipCount=(pageNo-1)*4;                               //略过的条数
        Map map=new HashMap();
        map.put("skipCount",skipCount);
        map.put("limit",4);
        R r = userService.selectUserList(map);
        return r;
    }
}
