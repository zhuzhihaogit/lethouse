package com.zzh.service;

import com.github.pagehelper.PageInfo;
import com.zzh.domain.Condition;
import com.zzh.domain.User;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/24.
 */
public interface UserService {
    PageInfo<User> getUserByCondition(Condition condition);

    Integer addUser(User user);

    Integer modifyUser(User user);

    boolean checkName(String name);

    boolean register(User user);

    List<User> login(String username,String password);

    User findUserByTel(String tel);

}
