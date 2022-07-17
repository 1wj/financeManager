
package com.iweb.controller;

import com.iweb.domain.TbUser;
import com.iweb.service.LoginService;
import com.iweb.vo.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @file: LoginController
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/12 15:59
 */
@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    //登录
    @RequestMapping("/security/do/login.do")
    @ResponseBody
    public R addStudent(HttpServletRequest req, String loginAcct, String userPswd){
        System.out.println(loginAcct+"  ,  "+userPswd);
        Map map=new HashMap();
        map.put("loginAcct",loginAcct);
        map.put("userPswd",userPswd);
        TbUser user=loginService.selectUserByLogAndPas(map);
        System.out.println(user);
        R r = new R();
        String flag="";
        if (user!=null){
            flag="success";

        }
        //往session中注入user对象
        req.getSession().setAttribute("user",user);
        r.data("flag",flag);
        return r;
    }

    //注销
    @RequestMapping("/security/unLogin.do")
    public ModelAndView unLogin(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = req.getSession();
        session.invalidate();
        mv.setViewName("redirect:/login.jsp");
        return mv;
    }



}
