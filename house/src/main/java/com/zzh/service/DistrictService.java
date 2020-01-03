package com.zzh.service;

import com.github.pagehelper.PageInfo;
import com.zzh.domain.District;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/22.
 */
public interface DistrictService {
    PageInfo getDistrictAll(Integer pageNum,Integer pageSize);

    Integer addDistrict(District district);

    Integer updateDistrict(District district);

    Integer removeSome(Integer[] ids);

    List<District> getDistrictAll();
}
