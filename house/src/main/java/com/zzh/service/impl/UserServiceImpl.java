package com.zzh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzh.domain.Condition;
import com.zzh.domain.User;
import com.zzh.domain.UserExample;
import com.zzh.mapper.UserMapper;
import com.zzh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/24.
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public PageInfo<User> getUserByCondition(Condition condition) {

        PageHelper.startPage(condition.getPage(),condition.getRows());

        UserExample userExample = new UserExample();

        UserExample.Criteria criteria = userExample.createCriteria();

        if(condition.getName()!=null){
            criteria.andNameLike("%"+condition.getName()+"%");
        }
        if(condition.getTele()!=null){
            criteria.andTelephoneLike("%"+condition.getTele()+"%");
        }

        List<User> userList = userMapper.selectByExample(userExample);

        PageInfo<User> pageInfo = new PageInfo<>(userList);

        return pageInfo;
    }

    @Override
    public Integer addUser(User user) {
        return userMapper.insert(user);
    }

    @Override
    public Integer modifyUser(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    @Override
    public boolean checkName(String name) {

        UserExample userExample = new UserExample();

        UserExample.Criteria criteria = userExample.createCriteria();

        criteria.andNameEqualTo(name);

        List<User> userList = userMapper.selectByExample(userExample);

        if(userList!=null && userList.size()>0){
            return false;
        }

        return true;
    }

    @Override
    public boolean register(User user) {

        user.setIsadmin(0);

        int i = userMapper.insertSelective(user);

        if(i>0){
            return true;
        }

        return false;
    }

    @Override
    public List<User> login(String username, String password) {

        UserExample userExample = new UserExample();

        UserExample.Criteria criteria = userExample.createCriteria();

        criteria.andNameEqualTo(username);
        criteria.andPasswordEqualTo(password);

        List<User> userList = userMapper.selectByExample(userExample);


        return userList;
    }
}
