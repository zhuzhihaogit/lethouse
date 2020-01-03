package com.zzh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzh.domain.District;
import com.zzh.domain.DistrictExample;
import com.zzh.mapper.DistrictMapper;
import com.zzh.service.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/22.
 */
@Service
public class DistrictServiceImpl implements DistrictService{

    @Autowired
    private DistrictMapper districtMapper;

    @Override
    public PageInfo getDistrictAll(Integer pageNum,Integer pageSize) {

        PageHelper.startPage(pageNum,pageSize);

        List<District> districtList = districtMapper.selectByExample(new DistrictExample());

        PageInfo<District> pageInfo = new PageInfo<>(districtList);

        return pageInfo;

    }

    @Override
    public Integer addDistrict(District district) {
        return districtMapper.insert(district);
    }

    @Override
    public Integer updateDistrict(District district) {
        return districtMapper.updateByPrimaryKey(district);
    }

    @Override
    public Integer removeSome(Integer[] ids) {
        return districtMapper.deleteSome(ids);
    }

    @Override
    public List<District> getDistrictAll() {
        return districtMapper.selectByExample(new DistrictExample());
    }
}
