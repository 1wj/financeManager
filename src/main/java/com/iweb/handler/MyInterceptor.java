
package com.iweb.handler;

import com.iweb.domain.TbUser;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @file: MyInterceptor
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/10 15:10
 */
//动态资源拦截器类：拦截用户的请求。
public class MyInterceptor implements HandlerInterceptor {
    //验证登录的用户信息， 正确return true，其它return false
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //放行登录页面
        String path = request.getServletPath();
        if("/index.html".equals(path)||"/login.jsp".equals(path) || "/security/do/login.do".equals(path) || "/login.html".equals(path)||"/user/addUser".equals(path)){
            return true;
        }
        //从session中获取name的值
        TbUser user  = (TbUser) request.getSession().getAttribute("user");
       if(null==user){ //如果未登录
           request.getRequestDispatcher(request.getContextPath()+"/login.jsp").forward(request,response);
           return false;
       }
        //已经登录
        return true;
    }


}
