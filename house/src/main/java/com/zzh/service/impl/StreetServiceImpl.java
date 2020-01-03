package com.zzh.service.impl;

import com.zzh.domain.Street;
import com.zzh.domain.StreetExample;
import com.zzh.mapper.StreetMapper;
import com.zzh.service.StreetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZZH_PC on 2019/12/27.
 */
@Service
public class StreetServiceImpl implements StreetService{

    @Autowired
    private StreetMapper streetMapper;

    @Override
    public List<Street> getStreetById(Integer districtId) {

        StreetExample streetExample = new StreetExample();

        StreetExample.Criteria criteria = streetExample.createCriteria();

        criteria.andDistrictIdEqualTo(districtId);

        List<Street> streetList = streetMapper.selectByExample(streetExample);

        return streetList;
    }
}
