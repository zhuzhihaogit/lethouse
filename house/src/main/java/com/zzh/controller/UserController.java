package com.zzh.controller;

import com.github.pagehelper.PageInfo;
import com.zzh.domain.Condition;
import com.zzh.domain.District;
import com.zzh.domain.User;
import com.zzh.service.DistrictService;
import com.zzh.service.UserService;
import com.zzh.util.TeleCheckUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZZH_PC on 2019/12/24.
 */
@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/getUsers")
    public Map<String,Object> getDistrictData(Condition condition){

        PageInfo<User> pageInfo = userService.getUserByCondition(condition);

        Map<String,Object> map = new HashMap<>();

        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());

        return map;
    }

    @RequestMapping("/addUser")
    public String addUser(User user){

        Integer i = userService.addUser(user);

        return "{\"result\":\""+i+"\"}";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user){

        Integer i = userService.modifyUser(user);

        return "{\"result\":\""+i+"\"}";
    }

    @RequestMapping("/checkName")
    public boolean checkName(String name){

        boolean b = userService.checkName(name);

        return b;
    }

    @RequestMapping("/register")
    public boolean register(User user){
        return userService.register(user);
    }

    @RequestMapping("/login")
    public Map<String,Object> login(String username, String password, HttpSession session){

        List<User> userList = userService.login(username, password);

        Map<String,Object> map = new HashMap<>();

        if (userList!=null && userList.size()>0) {
            userList.forEach(temp->session.setAttribute("user",temp));
            session.setMaxInactiveInterval(60*10);
            map.put("result","success");
        } else {
            map.put("result","fail");
        }

        return map;
    }



    //获取验证码
    @RequestMapping("/getCode")
    public String getCode(String tel, HttpSession session){
        Integer checkCode = (int)Math.round((Math.random()+1) * 1000);

        int i = TeleCheckUtil.sendMsg(tel, checkCode.toString());

        System.out.println(i);

        User user = userService.findUserByTel(tel);

        session.setAttribute("user",user);

        return checkCode.toString();
    }

}
