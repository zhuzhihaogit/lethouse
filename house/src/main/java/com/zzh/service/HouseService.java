package com.zzh.service;

import com.github.pagehelper.PageInfo;
import com.zzh.domain.House;
import com.zzh.domain.SearchCondition;
import com.zzh.util.PageUtil;

/**
 * Created by ZZH_PC on 2019/12/27.
 */
public interface HouseService {
    Integer addHouse(House house);

    PageInfo<House> findHouseByUser(Integer userId, PageUtil pageUtil);

    House findHouseById(String id);

    Integer modifyHouse(House house);

    Integer delHouse(String id,Integer isdel);

    PageInfo<House> isPassHouse(PageUtil pageUtil);

    Integer passHouse(String id);

    PageInfo<House> findAllHouse(PageUtil pageUtil);

    PageInfo<House> findHouseByCondition(SearchCondition condition,PageUtil pageUtil);
}
