package com.zzh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzh.domain.House;
import com.zzh.domain.SearchCondition;
import com.zzh.mapper.HouseMapper;
import com.zzh.service.HouseService;
import com.zzh.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/27.
 */
@Service
public class HouseServiceImpl implements HouseService{

    @Autowired
    private HouseMapper houseMapper;

    @Override
    public Integer addHouse(House house) {
        return houseMapper.insertSelective(house);
    }

    @Override
    public PageInfo<House> findHouseByUser(Integer userId, PageUtil pageUtil) {

        PageHelper.startPage(pageUtil.getPage(),pageUtil.getRows());

        List<House> houseList = houseMapper.selectHouseByUser(userId);

        return new PageInfo<>(houseList);
    }

    @Override
    public House findHouseById(String id) {
        return houseMapper.selectHouseById(id);
    }

    @Override
    public Integer modifyHouse(House house) {
        return houseMapper.updateByPrimaryKeySelective(house);
    }

    @Override
    public Integer delHouse(String id, Integer isdel) {
        return houseMapper.delHouse(id,isdel);
    }

    @Override
    public PageInfo<House> isPassHouse(PageUtil pageUtil) {

        PageHelper.startPage(pageUtil.getPage(),pageUtil.getRows());

        List<House> houseList = houseMapper.isPassHouse();

        return new PageInfo<>(houseList);
    }

    @Override
    public Integer passHouse(String id) {
        return houseMapper.passHouse(id);
    }

    @Override
    public PageInfo<House> findAllHouse(PageUtil pageUtil) {

        PageHelper.startPage(pageUtil.getPage(),pageUtil.getRows());

        List<House> houseList = houseMapper.selectAllHouse();

        return new PageInfo<>(houseList);
    }

    @Override
    public PageInfo<House> findHouseByCondition(SearchCondition condition, PageUtil pageUtil) {

        PageHelper.startPage(pageUtil.getPage(),pageUtil.getRows());

        List<House> houseList = houseMapper.selectHouseByCondition(condition);

        return new PageInfo<>(houseList);
    }


}
